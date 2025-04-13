import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backGroundImage,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.isVisible,
  });
  final String backGroundImage;
  final String image;
  final Widget title;
  final String subTitle;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(backGroundImage, fit: BoxFit.fill),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SvgPicture.asset(image),
            ),
            Visibility(
              visible: isVisible,
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: TextButton(
                      style: const ButtonStyle(
                          splashFactory: NoSplash.splashFactory),
                      onPressed: () {},
                      child: Text(S.of(context).skip,
                          style: AppStyles.bodySmallRegular)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 64.h),
        title,
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Text(subTitle,
              textAlign: TextAlign.center, style: AppStyles.bodySmallRegular),
        ),
        SizedBox(height: 65.h),
      ],
    );
  }
}
