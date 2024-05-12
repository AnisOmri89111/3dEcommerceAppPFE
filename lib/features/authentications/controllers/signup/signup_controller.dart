import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/connectionchecker/network_manager.dart';
import 'package:pfeprojectcar/data/repos/authentication_repository.dart';
import 'package:pfeprojectcar/data/repos/users/user_repository.dart';
import 'package:pfeprojectcar/features/authentications/models/user_model.dart';
import 'package:pfeprojectcar/features/authentications/views/signup/widgets/emailverif_screen.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/popups/full_screen_loader.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class SignUpController extends GetxController {
 static SignUpController get instance => Get.find() ;

 // variables
  final hidePassword = true.obs ;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final phoneno = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  void signUp() async{
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
    if (!signUpFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();

      return;
    }
    //Check privacy and policy
    if (!privacyPolicy.value) {
      TLoader.warningSnackBar(title: 'Accept Privacy Policy',
      message: 'in order to create an account , you should accept the privacy policy & term of use'
      );
      return;
    }
    //firebase Authentication registration and firestore storing
   final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

   //store user into the firestore
   final newUser  = UserModel(
    id: userCredential.user!.uid, 
    firstName: firstname.text.trim(), 
    lastName: lastname.text.trim(), 
    username: username.text.trim(), 
    email: email.text.trim(), 
    phoneNumber: phoneno.text.trim(), 
    profilePicture: '');

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser) ;

    TFullScreenLoader.stopLoading();

    //Success Message

    TLoader.successSnackBar(title: 'Congratulations !!' , message: "your acoount has been created please do verify your email and thank you");

    // Move to verify Email Screen

    Get.to(() =>  EmailVerificationScreen(email: email.text.trim(),)) ;



    //Send Verification email 

   

  } catch (e) {
   TFullScreenLoader.stopLoading();
   TLoader.errorSnackBar(title: 'on snaps !! ' , message: e.toString());
  }
 }
}