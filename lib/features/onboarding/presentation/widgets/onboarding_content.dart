import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:budget/core/constants/app_assets.dart';
import '../../data/models/onboarding_model.dart';
import '../../../../core/constants/app_styles.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingContent({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Illustration with asset-based frame
        Expanded(
          flex: 3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background Frame Asset
              SvgPicture.asset(
                AppAssets.onboardingFrame,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              // Main Illustration
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: SvgPicture.asset(
                  model.image,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        
        // Text Content
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                Text(
                  model.title,
                  textAlign: TextAlign.center,
                  style: AppStyles.heading1,
                ),
                const SizedBox(height: 16),
                Text(
                  model.description,
                  textAlign: TextAlign.center,
                  style: AppStyles.body1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
