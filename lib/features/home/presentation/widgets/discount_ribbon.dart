import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiscountRibbon extends StatelessWidget {
  final String label;

  const DiscountRibbon({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      right: -30,
      child: Transform.rotate(
        angle: math.pi / 4,
        child: Container(
          width: 120,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: const BoxDecoration(
            color: Color(0xFF053E94),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppStyles.captionLight.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
