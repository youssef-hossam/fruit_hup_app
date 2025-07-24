import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class ActineItem extends StatelessWidget {
  const ActineItem({super.key, required this.icon, required this.title});
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        height: 30.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: const Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 30.h,
              width: 30.w,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              title,
              style: AppStyles.bodyXSmallSemiBold.copyWith(
                color: AppColors.green1500,
              ),
            ),
            SizedBox(
              width: 7.w,
            ),
          ],
        ));
  }
}
