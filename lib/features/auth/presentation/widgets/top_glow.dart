import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_colors.dart';

import 'wave_clipper.dart';

class TopGlow extends StatelessWidget {
  const TopGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightBlue.withAlpha(200),
              AppColors.lightBlue.withAlpha(100),
              AppColors.white.withAlpha(0),
            ],
          ),
        ),
      ),
    );
  }
}
