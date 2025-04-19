import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/register_view.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).DontHaveAnAccount,
          style: AppStyles.bodyBaseBold.copyWith(
              fontWeight: FontWeight.w600, color: AppColors.grayscale400),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(RegisterView.routeName);
          },
          child: Text(S.of(context).createAccount,
              style: AppStyles.bodyBaseBold.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.green1500)),
        ),
      ],
    );
  }
}
