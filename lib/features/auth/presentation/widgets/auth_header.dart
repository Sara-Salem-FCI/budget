import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/constants/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: AppStyles.heading1.copyWith(
              fontSize: 32.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        if (subtitle != null) ...[
          SizedBox(height: 8.h),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: AppStyles.body1.copyWith(
                  color: AppColors.grey,
                  fontSize: 16.sp,
                  height: 1.6,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
