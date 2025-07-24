import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/services/firebase_auth_service.dart';
import 'package:fruit_hub_app/core/services/shared_prefrences_singleton.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub_app/features/home/presentation/views/home_view.dart';
import 'package:fruit_hub_app/features/on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excutNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagesPlantSplah),
          ],
        ),
        SvgPicture.asset(Assets.imagesFruitSplash),
        SvgPicture.asset(
          Assets.imagesCirclesBottomSplah,
          fit: BoxFit.fitWidth,
        )
      ],
    );
  }

  void excutNavigation() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      if (FirebaseAuthService().isLoggedIn()) {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      } else {
        bool isOnbardingViewSeen = Pref.getBool(kIsOnbardingViewSeen) ?? false;

        if (isOnbardingViewSeen) {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
          // print('"///////////////////////////////"');
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }

        // print('"///////////////////////////////"');
      }
    });
  }
}
