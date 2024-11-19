// ignore_for_file: prefer_const_constructors, unused_field, slash_for_doc_comments, unused_local_variable, body_might_complete_normally_nullable, unnecessary_nullable_for_final_variable_declarations

import 'package:bongo_mart/data/repositories/user/user_repo.dart';
import 'package:bongo_mart/features/authentication/screens/login/login.dart';
import 'package:bongo_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bongo_mart/features/authentication/screens/signup/vertify_email.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/firebase_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/format_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/platform_exceptions.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VertifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoarding());
    }
  }

/******************************** //EMAIL AND PASSWORD SIGN-IN *********************************/
// [Email authentication] - Log In

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

// [Email authentication] - Register

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

// [Email Verification] - Mail Verified
  
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

// [Reauthentication] - Re-authentication
   
    Future<void> reAuthenticateEmailAndPassword(
        String email, String password) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

// [Email authentication] - Forgot Password
 Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

/******************************** //Fedarate Identity for Social SIGN-IN *********************************/
// [Google Authentication] - Google
  Future<UserCredential?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
    if (userAccount == null) {
      throw 'Sign-in aborted by user';
    }

    final GoogleSignInAuthentication? googleAuth =
        await userAccount.authentication;
    if (googleAuth == null) {
      throw 'Failed to authenticate with Google';
    }

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw e.toString(); // Provides more context for the specific error encountered
  }
}

// [Facebook Authentication] - Facebook

/******************************** ///.end Fedarate Identity for Social SIGN-IN  *********************************/
// [Logout] - Logout
  Future<void> logout() async {
    try {
      TFullScreenLoader.openLoadingDialog("Signing You Out...", TImages.processingAnimation);
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

// [Delete Account] - Delete Account

  Future<void> deleteAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog("Deleting your account...", TImages.processingAnimation);
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }
}
