import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pfeprojectcar/features/authentications/views/login/login.dart';
import 'package:pfeprojectcar/features/authentications/views/onboarding/onboarding.dart';
import 'package:pfeprojectcar/features/authentications/views/signup/widgets/emailverif_screen.dart';
import 'package:pfeprojectcar/navigation_bar.dart';
import 'package:pfeprojectcar/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/firebase_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/format_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/platform_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthenticationRepository extends GetxController {
static AuthenticationRepository get instance => Get.find() ;

//variables 
final deviceStorage = GetStorage() ;
final _auth = FirebaseAuth.instance;

@override 
void onReady() {
  FlutterNativeSplash.remove();
  screenRedirect();
}
screenRedirect() async{
  final  user = _auth.currentUser ;
  if (user != null) {
    if (user.emailVerified) {
      Get.offAll(() => const NavigationScreen());
    }else{
      Get.offAll(() =>  EmailVerificationScreen(email:_auth.currentUser?.email  ,));
    }
  }else{
     //local storage

 deviceStorage.writeIfNull('firstTimeOnly', true);
 deviceStorage.read('firstTimeOnly') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
  }
 
}
//Login
Future <UserCredential> loginWithEmailAndPassword(String email , String password) async{
  try {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  }catch(e){
    throw 'something went wrong , please try again !';
  }
}

//Registration 
Future <UserCredential> registerWithEmailAndPassword(String email , String password) async{
  try {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  }catch(e){
    throw 'something went wrong , please try again !';
  }
}
//Verification Email sent 
 Future<void> sendVerificationEmail () async {
      try {
        return await _auth.currentUser?.sendEmailVerification();
      } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
      throw const TFormatException();
      } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
      }catch(e){
      throw 'something went wrong , please try again !';
  }
    }
    //PAssword Reset
   Future<void> sendPasswordResetEmail (String email) async {
      try {
        return _auth.sendPasswordResetEmail(email: email);
      } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
      throw const TFormatException();
      } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
      }catch(e){
      throw 'something went wrong , please try again !';
  }
    }
  //logout functionality
  Future <void> logOut () async{
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
      throw const TFormatException();
      } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
      }catch(e){
      throw 'something went wrong , please try again !';
  }
  }
// Google Sign In
Future<UserCredential?> signInWithGoogle () async {
  try {
    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn() ;
    final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
      ) ;
      return await _auth.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
      throw const TFormatException();
      } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
      }catch(e){
      throw 'something went wrong , please try again !';
  }
}
}

