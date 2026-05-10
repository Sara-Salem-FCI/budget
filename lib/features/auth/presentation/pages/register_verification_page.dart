import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'dart:async';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/di/service_locator.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:budget/l10n/app_localizations.dart';
import '../widgets/top_glow.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/otp_timer_row.dart';
import '../cubit/register_cubit.dart';

class RegisterVerificationPage extends StatefulWidget {
  const RegisterVerificationPage({super.key});

  @override
  State<RegisterVerificationPage> createState() => _RegisterVerificationPageState();
}

class _RegisterVerificationPageState extends State<RegisterVerificationPage> {
  int _timerSeconds = 59;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _timerSeconds = 59);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() => _timerSeconds--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: AppStyles.heading2.copyWith(fontSize: 24.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.lightGrey),
      ),
    );

    return BlocProvider.value(
      value: getIt<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterOtpVerifiedSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.response['message'] ?? 'Success')),
            );
            // Navigate to home since user is now verified and token is saved
            context.go(AppRouter.home);
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is RegisterSuccess) {
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            _startTimer();
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
                  child: Column(
                    children: [
                      const CustomBackButton(),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 10.h),
                              AuthHeader(
                                title: l10n.verification_code_title,
                                subtitle: l10n.verification_code_desc,
                              ),
                              SizedBox(height: 40.h),
                              Center(
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Pinput(
                                    length: 5,
                                    controller: cubit.otpController,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: defaultPinTheme.copyWith(
                                      decoration: defaultPinTheme.decoration!.copyWith(
                                        border: Border.all(color: AppColors.deepBlue),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.h),
                              OtpTimerRow(
                                timerSeconds: _timerSeconds,
                                onResend: () {
                                  cubit.resendOtp();
                                  _startTimer();
                                },
                              ),
                              SizedBox(height: 40.h),
                              AuthButton(
                                text: l10n.next,
                                isLoading: state is RegisterLoading,
                                onPressed: () => cubit.verifyOtp(),
                              ),
                            ],
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
