import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialCard extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback onPressed;
  final Widget child;

  const SocialCard({
    super.key,
    required this.backgroundColor,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: 50.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
