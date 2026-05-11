import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/constants/app_assets.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsEmptyState extends StatelessWidget {
  const NotificationsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.noNotifications,
            width: 150.w,
            height: 150.h,
          ),
          SizedBox(height: 30.h),
          Text(
            l10n.no_notifications_yet,
            style: AppStyles.body1.copyWith(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
