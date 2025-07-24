import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/helper_function/build_error_bar.dart';
import 'package:fruit_hub_app/core/widgets/custom_loading_indicator.dart';
import 'package:fruit_hub_app/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/widgets/register_view_body.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          buildErrorBar(context, state.errormessage);
        } else if (state is SignUpSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
          loading: state is SignUpLoading,
          child: const RegisterViewBody(),
        );
      },
    );
  }
}
