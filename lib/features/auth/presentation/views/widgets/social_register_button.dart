import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';

class SocialRegisterButton extends StatelessWidget {
  const SocialRegisterButton({
    super.key,
    required this.socialIcon,
    required this.socialText,
    required this.onPress,
  });

  final String socialIcon;
  final String socialText;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFDDDFDF), width: 1),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 18.w,
              ),
              SvgPicture.asset(socialIcon),
              const Spacer(),
              Text(
                socialText,
                style: AppStyles.bodyBaseBold.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.grayscale400),
              ),
              const Spacer(),
            ],
          )),
    );
  }
}
