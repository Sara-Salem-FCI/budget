import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? textColor;
  final bool showArrow;

  const ProfileMenuTile({
    super.key,
    required this.title,
    this.onTap,
    this.trailing,
    this.textColor,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.body2.copyWith(
                  color: textColor,
                ),
              ),
              const Spacer(),
              if (trailing != null)
                trailing!
              else if (showArrow)
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
