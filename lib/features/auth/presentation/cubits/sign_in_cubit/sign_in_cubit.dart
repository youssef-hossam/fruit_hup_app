import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;
  void signIn({required String email, required String password}) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }

  void signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }

  void signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }
}
