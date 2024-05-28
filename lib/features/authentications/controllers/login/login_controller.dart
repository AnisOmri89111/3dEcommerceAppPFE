import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pfeprojectcar/common/widgets/connectionchecker/network_manager.dart';
import 'package:pfeprojectcar/data/repos/authentication_repository.dart';
import 'package:pfeprojectcar/features/personalizations/controllers/user_controller.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/popups/full_screen_loader.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find() ;
  final userController = Get.put(UserController());
  final localStorage = GetStorage() ;
  final hidePassword = false.obs ;
  final rememberMe = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
   /* email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');*/
    super.onInit();
  }

  void signIn() async{
  try {
    //Start Loading
    TFullScreenLoader.openLoadingDialog("we are processing your information ...", ImageString.docerAnimation);
    //Connectivity Check
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();

      return ;
    }
    //Form Validation
    if (!loginFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();

      return;
    }
    //rememberMe storing data
    /*if (rememberMe.value) {
      localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());

    }*/
    //firebase Authentication login 
   final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

    //remove Loader
    TFullScreenLoader.stopLoading();

    //Success Message

    TLoader.successSnackBar(title: 'Congratulations !!' , message: "your acoount has been created please do verify your email and thank you");
    //redirect
    AuthenticationRepository.instance.screenRedirect();

   

  } catch (e) {
   TFullScreenLoader.stopLoading();
   TLoader.errorSnackBar(title: 'on snaps !! ' , message: e.toString());
  }
 }
 //Goggle Sign In 
 Future <void> googleSignIn () async{
   try {
          //Start Loading
    TFullScreenLoader.openLoadingDialog("logging IN...", ImageString.docerAnimation);
    //Connectivity Check
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();

      return ;
    }

    final userCredential = await AuthenticationRepository.instance.signInWithGoogle();
    await userController.saveUserRecords(userCredential); 
    TFullScreenLoader.stopLoading();
    AuthenticationRepository.instance.screenRedirect();
   } catch (e) {
    TFullScreenLoader.stopLoading();
   TLoader.errorSnackBar(title: 'on snaps !! ' , message: e.toString());
   }

 }
}