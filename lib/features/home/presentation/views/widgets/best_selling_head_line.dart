import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class BestSellingHeadline extends StatelessWidget {
  const BestSellingHeadline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(S.of(context).mostSelled, style: AppStyles.bodyBaseBold),
        Text(
          S.of(context).more,
          style: AppStyles.bodySmallRegular
              .copyWith(color: AppColors.grayscale400),
        ),
      ],
    );
  }
}
