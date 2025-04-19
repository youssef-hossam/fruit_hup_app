import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class TermAndConditionWidget extends StatefulWidget {
  const TermAndConditionWidget({
    super.key,
  });

  @override
  State<TermAndConditionWidget> createState() => _TermAndConditionWidgetState();
}

class _TermAndConditionWidgetState extends State<TermAndConditionWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Transform.translate(
        offset: const Offset(12, -5),
        child: Transform.scale(
          scale: 1.3,
          child: Checkbox.adaptive(
            side: const BorderSide(color: Color(0xffDDDFDF)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r)),
            value: isChecked,
            onChanged: (value) {
              value = !isChecked;
              setState(() {
                isChecked = value!;
              });
              // Handle checkbox state change
            },
          ),
        ),
      ),
      Expanded(
        child: Text.rich(TextSpan(
          children: [
            TextSpan(
                text: S.of(context).acceptTerms,
                style: AppStyles.bodySmallBold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.grayscale400)),
            TextSpan(
              text: S.of(context).termsAndConditions,
              style: AppStyles.bodySmallBold.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.green1600,
              ),
            ),
          ],
        )),
      )
    ]);
  }
}
