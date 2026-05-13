import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/features/profile/presentation/widgets/profile_list_card.dart';
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
    return ProfileListCard(
      onTap: onTap,
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
    );
  }
}
