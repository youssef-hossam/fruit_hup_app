import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key, required this.hintText, this.keyboardType, this.onSaved});

  final String hintText;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isObscure,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).PleaseEnterSomeText;
          }
          return null;
        },
        onSaved: widget.onSaved,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:
              AppStyles.bodySmallBold.copyWith(color: AppColors.grayscale400),
          border: buildBorder(),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: isObscure
                  ? const Icon(Icons.visibility_rounded,
                      color: Color(0xffC9CECF))
                  : const Icon(Icons.visibility_off_rounded,
                      color: Color(0xffC9CECF))),
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
