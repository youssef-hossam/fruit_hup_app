import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/term_and_condition_widget.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
          CustomTextField(hintText: S.of(context).fullName),
          SizedBox(
            height: 16.h,
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
          const TermAndConditionWidget(),
          SizedBox(
            height: 30.h,
          ),
          CustomButton(text: S.of(context).createNewAccount, onPress: () {}),
          SizedBox(
            height: 26.h,
          ),
          HaveAccountWidget()
        ],
      ),
    ));
  }
}
