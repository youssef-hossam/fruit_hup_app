import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';

AppBar buildCustomAppBar(
        {required String title,
        required BuildContext context,
        required bool canBack}) =>
    AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles.bodyLargeBold,
      ),
      leading: canBack
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : const SizedBox(),
    );
