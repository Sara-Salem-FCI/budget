import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/di/service_locator.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:budget/l10n/app_localizations.dart';

import '../widgets/auth_phone_field.dart';
import '../widgets/top_glow.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/custom_back_button.dart';
import '../cubit/forgot_password_cubit.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider.value(
      value: getIt<ForgotPasswordCubit>(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSentSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            context.push(AppRouter.verification);
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
                                  title: l10n.forgot_password_title,
                                  subtitle: l10n.forgot_password_desc,
                                ),
                                SizedBox(height: 30.h),
                                AuthPhoneField(
                                  label: l10n.phone_number,
                                  hint: l10n.phone_number_hint,
                                  controller: cubit.phoneController,
                                  initialCountryCode: 'SA',
                                  onCountryChanged: (code) =>
                                      cubit.setCountryCode(code),
                                ),
                                SizedBox(height: 24.h),
                                AuthButton(
                                  text: l10n.send,
                                  isLoading: state is ForgotPasswordLoading,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.sendCode();
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
