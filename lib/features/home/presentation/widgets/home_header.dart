import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:budget/features/auth/data/models/user_model.dart';

class HomeHeader extends StatelessWidget {
  final UserModel? user;

  const HomeHeader({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.lightGrey,
            backgroundImage: user?.profileImage != null
                ? NetworkImage(user!.profileImage!)
                : null,
            child: user?.profileImage == null
                ? const Icon(Icons.person, color: Colors.grey, size: 28)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.welcome_name(user?.name ?? ''),
                  style: AppStyles.heading2,
                ),
                Text(
                  l10n.home_subtitle,
                  style: AppStyles.body1.copyWith(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_none, size: 28),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
