import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, this.suffixIcon, this.keyboardType});

  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              AppStyles.bodySmallBold.copyWith(color: AppColors.grayscale400),
          border: buildBorder(),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: const Color(0xffF9FAFA),
          enabledBorder: buildBorder(),
          focusedErrorBorder: buildBorder(),
          errorBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ));
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: const Color(0xffE6E9EA), width: 1.w),
    );
  }
}
