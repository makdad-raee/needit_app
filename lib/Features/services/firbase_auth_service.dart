import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:needit_app/core/error/custom_exception.dart';

class FirbaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log(
          'error in FirbaseAuthService of createUserWithEmailAndPassword is $e',
        );
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
      } else {
        throw CustomException('An error occured try again');
      }
    } catch (e) {
      log(
        'error in FirbaseAuthService of createUserWithEmailAndPassword is $e',
      );
      throw CustomException('An error occured try again');
    }
  }

  //loginWithEmailAndPassword
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        throw CustomException('user-not-found');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        throw CustomException('Wrong password provided for that user.');
      } else {
        throw CustomException('An error occured try again');
      }
    } catch (e) {
      throw CustomException('An error occured try again');
    }
  }
}
