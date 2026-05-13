import 'package:flutter/material.dart';
import 'package:budget/core/error/failure_localizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_assets.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:budget/core/di/service_locator.dart';
import 'package:budget/l10n/app_localizations.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/top_glow.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_footer.dart';
import '../widgets/or_divider.dart';
import '../widgets/remember_me_row.dart';
import '../widgets/forgot_password_link.dart';
import '../widgets/guest_login_button.dart';
import '../cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success')),
            );
            context.go(AppRouter.home);
          } else if (state is LoginError) {
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
          final cubit = context.read<LoginCubit>();

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
                          SizedBox(height: 40.h),
                          Center(
                            child: SvgPicture.asset(
                              Localizations.localeOf(context).languageCode == 'ar'
                                  ? AppAssets.logoAr
                                  : AppAssets.logo,
                              height: 50.h,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          AuthHeader(
                            title: l10n.login,
                            subtitle: l10n.welcome_back,
                          ),
                          SizedBox(height: 40.h),

                          // Email/Phone Field
                          AuthTextField(
                            label: l10n.email,
                            hint: l10n.email_hint,
                            keyboardType: TextInputType.emailAddress,
                            controller: cubit.loginController,
                            validator: (value) => value == null || value.isEmpty
                                ? l10n.field_required
                                : null,
                          ),
                          SizedBox(height: 16.h),

                          // Password Field
                          AuthTextField(
                            label: l10n.password,
                            hint: l10n.password_hint,
                            isPassword: true,
                            controller: cubit.passwordController,
                            validator: (value) => value == null || value.isEmpty
                                ? l10n.field_required
                                : null,
                          ),
                          SizedBox(height: 8.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RememberMeRow(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                              ),
                              ForgotPasswordLink(
                                onTap: () => context.push(AppRouter.forgotPassword),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),

                          AuthButton(
                            text: l10n.login,
                            isLoading: state is LoginLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.login();
                              }
                            },
                          ),
                        SizedBox(height: 12.h),

                        AuthFooter(
                          text: l10n.dont_have_account,
                          actionText: l10n.create_account,
                          onActionPressed: () => context.push(AppRouter.register),
                        ),
                        SizedBox(height: 24.h),

                        OrDivider(text: l10n.or),
                        SizedBox(height: 20.h),
                        
                        SizedBox(height: 20.h),
                        
                        GuestLoginButton(
                          onPressed: () => cubit.guestLogin(),
                        ),
                          SizedBox(height: 30.h),
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
