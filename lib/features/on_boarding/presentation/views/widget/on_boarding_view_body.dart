import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: PageView(children: [
              Column(
                children: [
                  Stack(children: [
                    SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        Assets.imagesOnBoardingBackground1Image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: SvgPicture.asset(Assets.imagesOnBoarding1Image)),
                    SafeArea(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        S.of(context).skip,
                        style: AppStyles.textStyle13,
                      ),
                    ))
                  ]),
                  SizedBox(
                    height: 64.h,
                  ),
                ],
              )
            ])),
      ],
    );
  }
}
