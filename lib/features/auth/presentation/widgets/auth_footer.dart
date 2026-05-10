import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/constants/app_colors.dart';

class AuthFooter extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onActionPressed;

  const AuthFooter({
    super.key,
    required this.text,
    required this.actionText,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionText,
            style: AppStyles.body1.copyWith(
              color: AppColors.deepBlue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 16.sp,
            ),
          ),
        ),
        Text(
          text,
          style: AppStyles.body1.copyWith(
            color: AppColors.grey,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
