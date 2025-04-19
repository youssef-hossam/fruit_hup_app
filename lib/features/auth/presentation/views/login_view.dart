import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          context: context, title: S.of(context).login, canBack: false),
      body: const LoginViewBody(),
    );
  }
}
