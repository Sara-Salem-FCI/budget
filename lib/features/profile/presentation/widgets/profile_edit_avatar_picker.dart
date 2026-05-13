import 'dart:io';

import 'package:budget/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Circular avatar with optional local preview, network fallback, and edit affordance.
class ProfileEditAvatarPicker extends StatelessWidget {
  final String? networkImageUrl;
  final String? localImagePath;
  final VoidCallback onPickPressed;
  final double radius;

  const ProfileEditAvatarPicker({
    super.key,
    required this.networkImageUrl,
    required this.localImagePath,
    required this.onPickPressed,
    this.radius = 72,
  });

  ImageProvider? get _image {
    final path = localImagePath;
    if (path != null && path.isNotEmpty) {
      return FileImage(File(path));
    }
    final url = networkImageUrl;
    if (url != null && url.isNotEmpty) {
      return NetworkImage(url);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final r = radius.r;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: r,
          backgroundColor: AppColors.lightGrey,
          backgroundImage: _image,
          child: _image == null
              ? Icon(Icons.person, size: r * 1.1, color: AppColors.grey)
              : null,
        ),
        Positioned(
          right: -2.w,
          bottom: -2.h,
          child: Material(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10.r),
            child: InkWell(
              onTap: onPickPressed,
              borderRadius: BorderRadius.circular(10.r),
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Icon(
                  Icons.photo_library_outlined,
                  color: AppColors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
