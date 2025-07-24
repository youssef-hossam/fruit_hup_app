import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/active_nav_item.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/in_active_nav_item.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem(
      {super.key, required this.item, required this.isSelected});

  final BottomNaavigationBarEntity item;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        child: isSelected
            ? ActineItem(icon: item.activeIcon, title: item.title)
            : InActiveItem(icon: item.inActiveIcon)
        // return ActineItem(
        //   icon: item.activeIcon,
        //   title: item.title,
        // );

        // InActiveItem(
        //   icon: item.inActiveIcon,
        // );
        );
  }
}
