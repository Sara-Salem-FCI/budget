import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/di/service_locator.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:budget/l10n/app_localizations.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/top_glow.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/custom_back_button.dart';
import '../cubit/forgot_password_cubit.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider.value(
      value: getIt<ForgotPasswordCubit>(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            context.go(AppRouter.login);
          } else if (state is ForgotPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ForgotPasswordCubit>();

          return Scaffold(
            backgroundColor: AppColors.background,
            body: Stack(
              children: [
                const TopGlow(),
                SafeArea(
                  child: Column(
                    children: [
                      const CustomBackButton(),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: 10.h),
                                AuthHeader(
                                  title: l10n.new_password_title,
                                  subtitle: l10n.new_password_desc,
                                ),
                                SizedBox(height: 40.h),
                                AuthTextField(
                                  label: l10n.password,
                                  hint: l10n.password_hint,
                                  isPassword: true,
                                  controller: cubit.passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.field_required;
                                    }
                                    if (value.length < 8) {
                                      return l10n.password_too_short;
                                    }
                                    if (!RegExp(r'[A-Z]').hasMatch(value) ||
                                        !RegExp(r'[a-z]').hasMatch(value)) {
                                      return l10n.password_mixed_case;
                                    }
                                    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                        .hasMatch(value)) {
                                      return l10n.password_symbols;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.h),
                                AuthTextField(
                                  label: l10n.confirm_password,
                                  hint: l10n.confirm_password_hint,
                                  isPassword: true,
                                  controller: cubit.confirmPasswordController,
                                  validator: (value) {
                                    if (value != cubit.passwordController.text) {
                                      return l10n.passwords_do_not_match;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 40.h),
                                AuthButton(
                                  text: l10n.save,
                                  isLoading: state is ForgotPasswordLoading,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.resetPassword(context);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
