import 'dart:developer';
import 'package:dopa_fit/core/errors/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServies {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("errorFromSiginFirebase: ${e.message}}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'Email already in use');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Network request failed');
      } else {
        throw CustomException(message: 'Something went wrong');
      }
    } catch (e) {
      log("error: ${e.toString()}");
      throw CustomException(message: 'Something went wrong');
    }
  }

  Future<User> loginWithEmailAndPassword({
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
      log("errorFromLoginFirebase: ${e.message}}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'User not found');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'Wrong password');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Network request failed');
      } else {
        throw CustomException(message: 'Something went wrong');
      }
    } catch (e) {
      log("error: ${e.toString()}");
      throw CustomException(message: 'Something went wrong');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  static bool isSignedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  
}
