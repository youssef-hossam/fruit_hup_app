import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/services/shared_prefrences_singleton.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub_app/features/on_boarding/presentation/views/widget/on_boarding_page_view.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController controller;
  var currentIndex = 0;
  @override
  void initState() {
    controller = PageController();
    controller.addListener(() {
      currentIndex = controller.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(controller: controller)),
        DotsIndicator(
          animate: true,
          position: currentIndex.toDouble(),
          dotsCount: 2,
          reversed: true,
          decorator: DotsDecorator(
            activeSize: Size(11.w, 11.h),
            activeColor: AppColors.green1500,
            size: Size(9.w, 9.h),
          ),
        ),
        SizedBox(height: 32.h),
        AnimatedOpacity(
          opacity: currentIndex == 1 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: currentIndex == 1 ? true : false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                text: S.of(context).startNow,
                onPress: () {
                  Pref.setBool(kIsOnbardingViewSeen, true);
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 35.h),
      ],
    );
  }
}
