import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';

import 'package:budget/l10n/app_localizations.dart';

class AuthPhoneField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final void Function(String)? onCountryChanged;
  final String initialCountryCode;

  const AuthPhoneField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.onCountryChanged,
    this.initialCountryCode = 'SA',
  });

  @override
  State<AuthPhoneField> createState() => _AuthPhoneFieldState();
}

class _AuthPhoneFieldState extends State<AuthPhoneField> {
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            widget.label,
            style: AppStyles.body1.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Material(
          elevation: 8,
          shadowColor: Colors.black.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.white,
          child: IntlPhoneField(
            controller: widget.controller,
            initialCountryCode: widget.initialCountryCode,
            textAlignVertical: TextAlignVertical.center,
            dropdownIconPosition: IconPosition.trailing,
            // Phone numbers are always LTR
            textAlign: TextAlign.left,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            flagsButtonPadding: EdgeInsets.only(left: 12.w),
            showDropdownIcon: true,
            dropdownIcon: Icon(
              Icons.keyboard_arrow_down,
              size: 20.sp,
              color: AppColors.grey,
            ),
            style: AppStyles.body1.copyWith(
              color: Colors.black87,
              fontSize: 16.sp,
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: AppStyles.body1.copyWith(
                color: AppColors.grey.withValues(alpha: 0.4),
                fontSize: 15.sp,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.deepBlue,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ),
              ),
              counterText: '',
              // Hide default error to show custom one below
              errorStyle: const TextStyle(height: 0, fontSize: 0),
            ),
            onChanged: (phone) {
              try {
                final isValid = phone.isValidNumber();
                if (isValid != _isValid) {
                  setState(() {
                    _isValid = isValid;
                  });
                }
              } catch (e) {
                if (_isValid) {
                  setState(() {
                    _isValid = false;
                  });
                }
              }
            },
            onCountryChanged: (country) {
              if (widget.onCountryChanged != null) {
                widget.onCountryChanged!('+${country.dialCode}');
              }
            },
          ),
        ),
        if (!_isValid)
          Padding(
            padding: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w),
            child: Text(
              l10n.invalid_phone_number,
              style: AppStyles.body1.copyWith(
                color: Colors.red,
                fontSize: 12.sp,
              ),
            ),
          ),
      ],
    );
  }
}
