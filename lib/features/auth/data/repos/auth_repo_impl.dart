import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/core/errors/exceptions.dart';
import 'package:fruit_hub_app/core/errors/failures.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/core/services/firebase_auth_service.dart';
import 'package:fruit_hub_app/core/services/shared_prefrences_singleton.dart';
import 'package:fruit_hub_app/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/models/user_model.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuth;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.databaseService, required this.firebaseAuth});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuth.createUserWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      UserEntity userEntity = UserEntity(
        uid: user.uid,
        name: name,
        email: user.email ?? 'No Email',
      );
      addUserData(userEntity: userEntity);
      saveUserData(userEntity: userEntity);

      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuth.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    User? user;
    try {
      user = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      addUserData(userEntity: userEntity);
      try {
        getUserData(user.uid);
        print(
            "User data fetched successfully: ${(UserModel.fromEntity(userEntity).toJson())}");
      } on Exception catch (e) {
        log('Exception in getUserData: ${e.toString()}');
        // TODO
      }
// Fetch user data after sign-in
      saveUserData(userEntity: userEntity);

      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuth.signInWithGoogle();
      if (await checkIfUserExists(user.uid)) {
        UserEntity userEntity = await getUserData(user.uid);
        log('User data already exists: ${(UserModel.fromEntity(userEntity).toJson())}');
        saveUserData(userEntity: userEntity);

        return Right(userEntity);
      } else {
        UserEntity userData = UserModel.fromFirebaseUser(user);
        addUserData(userEntity: userData);

        return Right(userData);
      }
    } catch (e) {
      await deleteUser(user);
      log('Exception in signInWithGoogle: ${e.toString()}');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuth.signInWithFacebook();
      UserEntity userEntity = UserModel.fromFirebaseUser(user!);
      if (await checkIfUserExists(user.uid)) {
        UserEntity existingUser = await getUserData(userEntity.uid);
        log('User data already exists: ${(UserModel.fromEntity(existingUser).toJson())}');
        saveUserData(userEntity: userEntity);
        return Right(existingUser);
      } else {
        addUserData(userEntity: userEntity);
        log('New user data added: ${(UserModel.fromEntity(userEntity).toJson())}');

        return Right(userEntity);
      }
    } catch (e) {
      await deleteUser(user);
      log('Exception in signInWithFacebook: ${e.toString()}');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }

  @override
  Future<void> addUserData({
    required UserEntity userEntity,
  }) async {
    await databaseService.addData(
        path: BackEndEndpoints.addUserData,
        data: UserModel.fromEntity(userEntity).toJson(),
        documentId: userEntity.uid);
  }

  @override
  Future<UserEntity> getUserData(String uid) async {
    var userData = await databaseService.getData(
        documentId: uid, path: BackEndEndpoints.getUserData);
    print("User data fetched successfully: $userData");
    return userData;
  }

  Future<bool> checkIfUserExists(String uid) async {
    return await databaseService.checkIfDataExists(
        path: BackEndEndpoints.checkIfDataExists, documentId: uid);
  }

  @override
  saveUserData({required UserEntity userEntity}) async {
    Pref.setString(BackEndEndpoints.savedUserData,
        jsonEncode(UserModel.fromEntity(userEntity).toJson()));
  }
}
