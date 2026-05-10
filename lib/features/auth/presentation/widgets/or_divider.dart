import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/constants/app_colors.dart';

class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.lightGrey, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            text,
            style: AppStyles.caption.copyWith(
              color: AppColors.grey,
              fontSize: 14.sp,
            ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.lightGrey, thickness: 1)),
      ],
    );
  }
}
