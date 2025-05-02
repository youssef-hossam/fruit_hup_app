import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/helper_function/build_error_bar.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_app/core/widgets/password_field.dart';
import 'package:fruit_hub_app/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/term_and_condition_widget.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isTermsAccepted = false;
  late String email;
  late String password;
  late String fullName;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: khorizontalPadding.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            CustomTextField(
              hintText: S.of(context).fullName,
              keyboardType: TextInputType.name,
              onSaved: (value) {
                fullName = value!;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: S.of(context).email,
              onSaved: (value) {
                email = value!;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordField(
              hintText: S.of(context).password,
              onSaved: (value) {
                password = value!;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            TermAndConditionWidget(
              onChanged: (value) {
                setState(() {
                  isTermsAccepted = value;
                });
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
                text: S.of(context).createNewAccount,
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    if (isTermsAccepted) {
                      formKey.currentState!.save();
                      BlocProvider.of<SignUpCubit>(context).signUp(
                          email: email, password: password, name: fullName);
                    } else {
                      buildErrorBar(context, S.of(context).pleaseAcceptTerms);
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                }),
            SizedBox(
              height: 26.h,
            ),
            const HaveAccountWidget()
          ],
        ),
      ),
    ));
  }
}
