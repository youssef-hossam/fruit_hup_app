import 'package:flutter/widgets.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class BottomNaavigationBarEntity {
  final String activeIcon;
  final String inActiveIcon;
  final String title;

  BottomNaavigationBarEntity(
      {required this.activeIcon,
      required this.inActiveIcon,
      required this.title});
}

List<BottomNaavigationBarEntity> bottomNavigationItems(BuildContext context) => [
      BottomNaavigationBarEntity(
          activeIcon: Assets.imagesActiveHomeIcon,
          inActiveIcon: Assets.imagesHomeIcon,
          title: S.of(context).home),
      BottomNaavigationBarEntity(
          activeIcon: Assets.imagesActiveProductsIcon,
          inActiveIcon: Assets.imagesProductsIcon,
          title: S.of(context).products),
      BottomNaavigationBarEntity(
          activeIcon: Assets.imagesActiveShoppingCartIcon,
          inActiveIcon: Assets.imagesShoppingCardIcon,
          title: S.of(context).cart),
      BottomNaavigationBarEntity(
          activeIcon: Assets.imagesActiveUserIcon,
          inActiveIcon: Assets.imagesUserIcon,
          title: S.of(context).profile),
    ];
