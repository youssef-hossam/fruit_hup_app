import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

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
}
