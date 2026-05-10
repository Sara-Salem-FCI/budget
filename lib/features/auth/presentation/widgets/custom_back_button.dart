import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:budget/core/constants/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.grey,
            size: 28.sp,
          ),
          onPressed: () => context.pop(),
        ),
      ],
    );
  }
}
