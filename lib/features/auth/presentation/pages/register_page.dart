import 'package:flutter/material.dart';
import 'package:budget/core/error/failure_localizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/di/service_locator.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:budget/l10n/app_localizations.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_phone_field.dart';
import '../widgets/social_auth_buttons.dart';
import '../widgets/top_glow.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_footer.dart';
import '../widgets/or_divider.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/agree_to_terms_row.dart';
import '../cubit/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _agreeToTerms = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            context.push(AppRouter.registerVerification);
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  FailureLocalizer.localize(state.message, context),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();

          return Scaffold(
            backgroundColor: AppColors.background,
            body: Stack(
              children: [
                const TopGlow(),
                SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                        const CustomBackButton(),
                        AuthHeader(title: l10n.register),
                        SizedBox(height: 30.h),
                        AuthTextField(
                          label: l10n.full_name,
                          hint: l10n.full_name_hint,
                          controller: cubit.nameController,
                          validator: (value) => value == null || value.isEmpty
                              ? l10n.field_required
                              : null,
                        ),
                        SizedBox(height: 16.h),
                        AuthTextField(
                          label: l10n.email,
                          hint: l10n.email_hint,
                          keyboardType: TextInputType.emailAddress,
                          controller: cubit.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.field_required;
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return l10n.invalid_email;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        AuthPhoneField(
                          label: l10n.phone_number,
                          hint: l10n.phone_number_hint,
                          controller: cubit.phoneController,
                          initialCountryCode: 'SA',
                          onCountryChanged: (code) => cubit.setCountryCode(code),
                        ),
                        SizedBox(height: 16.h),
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
                        SizedBox(height: 12.h),
                        AgreeToTermsRow(
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value ?? false;
                            });
                          },
                          onTermsTap: () {},
                        ),
                        SizedBox(height: 20.h),
                        AuthButton(
                          text: l10n.register,
                          isLoading: state is RegisterLoading,
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            if (_agreeToTerms) {
                              cubit.register();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(l10n.must_agree_to_terms)),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 12.h),
                        AuthFooter(
                          text: l10n.already_have_account,
                          actionText: l10n.login,
                          onActionPressed: () => context.pop(),
                        ),
                        SizedBox(height: 24.h),
                        OrDivider(text: l10n.or),
                        SizedBox(height: 20.h),
                        SocialAuthButtons(),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
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
