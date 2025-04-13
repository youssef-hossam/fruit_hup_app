import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/on_boarding/presentation/views/widget/page_view_item.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      reverse: true,
      children: [
        PageViewItem(
          isVisible: true,
          backGroundImage: Assets.imagesOnBoardingBackground1Image,
          image: Assets.imagesOnBoarding1Image,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).onBoardingTitle1,
                style: AppStyles.heading5Bold,
              ),
              Text(
                " Hub",
                style: AppStyles.heading5Bold.copyWith(
                  color: const Color(0xffF4A91F),
                ),
              ),
              Text(
                "Fruit",
                style: AppStyles.heading5Bold.copyWith(
                  color: AppColors.green1500,
                ),
              ),
            ],
          ),
          subTitle: S.of(context).onBoardingSubTitle1,
        ),
        PageViewItem(
          isVisible: false,
          backGroundImage: Assets.imagesOnBoardingBackground2Image,
          image: Assets.imagesOnBoarding2Image,
          title: Text(
            S.of(context).onBoardingTitle2,
            style: AppStyles.heading5Bold,
          ),
          subTitle: S.of(context).onBoardingSubTitle2,
        ),
      ],
    );
  }
}
