import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/errors/failures.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>>
      signInWithGoogle(); // Add this line for Google sign-in

  Future<Either<Failure, UserEntity>>
      signInWithFacebook(); // Add this line for Facebook sign-in
}
