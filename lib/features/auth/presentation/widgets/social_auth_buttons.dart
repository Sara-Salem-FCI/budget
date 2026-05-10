import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_assets.dart';
import 'package:budget/core/constants/app_colors.dart';

import 'social_card.dart';

/// Social authentication buttons for Google and Apple sign-in.
class SocialAuthButtons extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  final VoidCallback? onApplePressed;

  const SocialAuthButtons({
    super.key,
    this.onGooglePressed,
    this.onApplePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Apple Button (black card)
        SocialCard(
          backgroundColor: Colors.black,
          onPressed: onApplePressed ?? () {},
          child: Icon(
            Icons.apple,
            size: 32.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 20.w),
        // Google Button (white card)
        SocialCard(
          backgroundColor: AppColors.white,
          onPressed: onGooglePressed ?? () {},
          child: SvgPicture.asset(
            AppAssets.google,
            height: 24.h,
            width: 24.w,
          ),
        ),
      ],
    );
  }
}
