import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/generated/assets.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage(Assets.imagesLanding),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
      ),
    );
  }
}
