import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/services/get_it_service.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub_app/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/register_view_body_bloc_consumer.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildCustomAppBar(
            title: S.of(context).newAccount, context: context, canBack: true),
        body: const RegisterViewBodyBlocConsumer(),
      ),
    );
  }
}
