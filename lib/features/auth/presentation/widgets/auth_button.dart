import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.deepBlue,
        foregroundColor: AppColors.white,
        minimumSize: Size(double.infinity, 52.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 4.r,
        shadowColor: AppColors.deepBlue.withAlpha(100),
      ),
      child: isLoading
          ? SizedBox(
              height: 20.h,
              width: 20.h,
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              text,
              style: AppStyles.buttonText.copyWith(fontSize: 18.sp),
            ),
    );
  }
}
