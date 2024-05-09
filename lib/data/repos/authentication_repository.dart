import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pfeprojectcar/features/authentications/views/login/login.dart';
import 'package:pfeprojectcar/features/authentications/views/onboarding/onboarding.dart';
import 'package:pfeprojectcar/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/firebase_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/format_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/platform_exceptions.dart';

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
 //local storage
 deviceStorage.writeIfNull('firstTimeOnly', true);
 deviceStorage.read('firstTimeOnly') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
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

}

