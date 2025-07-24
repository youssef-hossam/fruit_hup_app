import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        icon,
        height: 20.h,
        width: 20.w,
      ),
    );
  }
}
