import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/core/errors/exceptions.dart';
import 'package:fruit_hub_app/core/errors/failures.dart';
import 'package:fruit_hub_app/core/services/firebase_auth_service.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/models/user_model.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuth;

  AuthRepoImpl({required this.firebaseAuth});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      User user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      User user = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      User user = await firebaseAuth.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in signInWithGoogle: ${e.toString()}');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      User user = await firebaseAuth.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in signInWithFacebook: ${e.toString()}');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }
}
