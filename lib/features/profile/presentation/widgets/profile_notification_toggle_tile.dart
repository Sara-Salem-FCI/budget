import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/features/profile/presentation/widgets/profile_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Profile row with a title and a Cupertino-style notification switch.
class ProfileNotificationToggleTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isBusy;

  const ProfileNotificationToggleTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.isBusy = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileListCard(
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppStyles.body2,
            ),
          ),
          const SizedBox(width: 12),
          IgnorePointer(
            ignoring: isBusy,
            child: Opacity(
              opacity: isBusy ? 0.5 : 1,
              child: CupertinoSwitch(
                value: value,
                activeTrackColor: AppColors.primary,
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
