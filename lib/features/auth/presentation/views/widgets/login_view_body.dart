import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/register_view.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/social_register_button.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/social_register_buttons.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: khorizontalPadding.w),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: S.of(context).email,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              hintText: S.of(context).password,
              suffixIcon: GestureDetector(
                  child: const Icon(Icons.visibility_rounded,
                      color: Color(0xffC9CECF))),
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).forgotPassword,
                  style: AppStyles.bodySmallBold.copyWith(
                      fontWeight: FontWeight.w600, color: AppColors.green1600),
                ),
              ),
            ),
            SizedBox(
              height: 33.h,
            ),
            CustomButton(
              text: S.of(context).login,
              onPress: () {},
            ),
            SizedBox(
              height: 33.h,
            ),
            const DontHaveAccountWidget(),
            SizedBox(
              height: 37.h,
            ),
            Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 1, // thickness
                  color: const Color(0xffDDDFDF), // line color
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Text(
                  S.of(context).or,
                  style: AppStyles.bodyBaseBold.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.grayscale950),
                ),
              ),
              Expanded(
                child: Container(
                  height: 1, // thickness
                  color: const Color(0xffDDDFDF), // line color
                ),
              ),
            ]),
            SizedBox(
              height: 16.h,
            ),
            const SocialRegisterButtons()
          ],
        ),
      ),
    );
  }
}
