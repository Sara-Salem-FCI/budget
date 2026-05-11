import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesEmptyState extends StatelessWidget {
  const FavoritesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.noFavorites,
            width: 200.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 32.h),
          Text(
            l10n.no_favorites_title,
            style: AppStyles.heading3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              l10n.no_favorites_subtitle,
              style: AppStyles.body1.copyWith(color: Colors.grey.shade400),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
