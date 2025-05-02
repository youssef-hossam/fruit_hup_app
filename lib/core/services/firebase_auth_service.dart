import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub_app/core/errors/exceptions.dart';
import 'package:fruit_hub_app/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in authService.createUserWithEmailAndPassword: ${e.toString()} , ${e.code}');

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw CustomException(S.current.weakPassword);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw CustomException(S.current.emailAlreadyInUse);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(S.current.checkYourConection);
      } else if (e.code == 'invalid-email') {
        throw CustomException(S.current.invalidEmail);
      } else {
        throw CustomException(S.current.errorOccurredTryAgain);
      }
    } catch (e) {
      print(e);
      throw CustomException(S.current.errorOccurredTryAgain);
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in authService.signInWithEmailAndPassword: ${e.toString()} , e.code  ${e.code}');

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw CustomException(S.current.noUserFoundForThatEmail);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw CustomException(S.current.wrongPasswordProvidedForThatUser);
      } else if (e.code == 'invalid-credential') {
        log('The email address is badly formatted///////////////////////////////////////////////////////.');
        throw CustomException(S.current.wrongEmailOrPassword);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(S.current.checkYourConection);
      } else {
        throw CustomException(S.current.errorOccurredTryAgain);
      }
    } catch (e) {
      print(e);
      throw CustomException(S.current.errorOccurredTryAgain);
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await (FirebaseAuth.instance.signInWithCredential(credential));

    return userCredential.user!;
  }

  signInWithFacebook() async {
    // Trigger the authentication flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    return userCredential.user!;
  }
}
