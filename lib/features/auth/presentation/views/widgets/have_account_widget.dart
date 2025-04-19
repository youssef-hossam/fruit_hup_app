import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAnAccount,
          style: AppStyles.bodyBaseBold.copyWith(
            color: AppColors.grayscale400,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            S.of(context).login,
            style: AppStyles.bodyBaseBold.copyWith(
              color: AppColors.green1500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
