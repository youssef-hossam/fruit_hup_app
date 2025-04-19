import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          title: S.of(context).newAccount, context: context, canBack: true),
      body: const RegisterViewBody(),
    );
  }
}
