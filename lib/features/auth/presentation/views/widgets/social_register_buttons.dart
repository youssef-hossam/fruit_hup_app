import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/social_register_button.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class SocialRegisterButtons extends StatelessWidget {
  const SocialRegisterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialRegisterButton(
          onPress: () {},
          socialIcon: Assets.imagesGoogleIcon,
          socialText: S.of(context).registerWithGoogle,
        ),
        SizedBox(
          height: 16.h,
        ),
        SocialRegisterButton(
          onPress: () {},
          socialIcon: Assets.imagesAppleIcon,
          socialText: S.of(context).registerWithApple,
        ),
        SizedBox(
          height: 16.h,
        ),
        SocialRegisterButton(
          onPress: () {},
          socialIcon: Assets.imagesFacebookIcon,
          socialText: S.of(context).registerWithFacebook,
        ),
      ],
    );
  }
}
