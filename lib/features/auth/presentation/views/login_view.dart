import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/helper_function/build_error_bar.dart';
import 'package:fruit_hub_app/core/services/get_it_service.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildCustomAppBar(
            context: context, title: S.of(context).login, canBack: false),
        body: const LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
