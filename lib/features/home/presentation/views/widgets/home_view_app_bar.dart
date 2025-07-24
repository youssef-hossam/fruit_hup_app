import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage, width: 44, height: 44),
      title: Text(
        'صباح الخير !..',
        style:
            AppStyles.bodyBaseRegular.copyWith(color: AppColors.grayscale400),
      ),
      subtitle: Text(
        'يوسف حسام',
        style: AppStyles.bodyBaseBold.copyWith(
          color: AppColors.grayscale950,
        ),
      ),
      trailing: const CircleAvatar(
        radius: 24,
        backgroundColor: Color(0xffEEF8ED),
        child: Image(
          image: Svg(Assets.imagesNotification),
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
