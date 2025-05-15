import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  Future<UserCredential> signInWithGoogle() async {
    try {
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
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      if (e is PlatformException && e.code == 'sign_in_canceled') {
        return Future.error('Sign-in canceled');
      } else if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'account-exists-with-different-credential':
            return Future.error(
              'This email is already associated with another account',
            );
          case 'invalid-credential':
            return Future.error('Unable to sign in. Please try again');
          case 'user-disabled':
            return Future.error('This account has been disabled');
          case 'operation-not-allowed':
          case 'user-not-found':
          case 'wrong-password':
          default:
            return Future.error('Authentication failed. Please try again.');
        }
      }
      // Generic error for all other cases
      return Future.error('Unable to sign in. Please try again later.');
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
