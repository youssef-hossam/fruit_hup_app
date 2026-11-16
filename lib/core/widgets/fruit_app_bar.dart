import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/notification_button.dart';

AppBar buildFruitAppBar(
  BuildContext context, {
  required String title,
  bool showBack = true,
  bool showNotification = false,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Text(title,
        style: AppStyles.bodyLargeBold.copyWith(color: AppColors.grayscale950)),
    leading: showBack
        ? Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => Navigator.maybePop(context),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xffF1F1F5)),
                ),
                child: const Icon(Icons.arrow_back_ios_new,
                    size: 16, color: AppColors.grayscale950),
              ),
            ),
          )
        : null,
    actions: [
      ...?actions,
      if (showNotification) const NotificationButton(),
      const SizedBox(width: 16),
    ],
  );
}
