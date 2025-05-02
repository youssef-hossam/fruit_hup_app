import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/helper_function/build_error_bar.dart';
import 'package:fruit_hub_app/core/widgets/custom_loading_indicator.dart';
import 'package:fruit_hub_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
            loading: state is SignInLoading, child: const LoginViewBody());
      },
    );
  }
}
