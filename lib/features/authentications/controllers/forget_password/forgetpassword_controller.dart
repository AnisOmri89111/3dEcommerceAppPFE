import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/connectionchecker/network_manager.dart';
import 'package:pfeprojectcar/data/repos/authentication_repository.dart';
import 'package:pfeprojectcar/features/authentications/views/passwordconfiguration/reset_password_screen.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/popups/full_screen_loader.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class ForgetPasswordController extends GetxController {
 static ForgetPasswordController get instance => Get.find() ;

  final email = TextEditingController() ;
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //Password Reset email 
  sendPasswordResetEmail () async{
    try {
      TFullScreenLoader.openLoadingDialog('processing your request ', ImageString.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();

      return ;
    }
    if (!forgetPasswordFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();

      return;
    }
    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
     TFullScreenLoader.stopLoading();

    //Success Message

    TLoader.successSnackBar(title: 'Email Sent ! ' , message: "Email sent to reset your password");
    Get.to(() =>  ResetPassword(email: email.text.trim(),));
    } catch (e) {
   TFullScreenLoader.stopLoading();
   TLoader.errorSnackBar(title: 'on snaps !! ' , message: e.toString());
    }
}
  resendPasswordResetEmail (String email) async{
    try {
    TFullScreenLoader.openLoadingDialog('processing your request ', ImageString.docerAnimation);
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();

      return ;
    }
    await AuthenticationRepository.instance.sendPasswordResetEmail(email);
    TFullScreenLoader.stopLoading();

    //Success Message

    TLoader.successSnackBar(title: 'Email Sent ! ' , message: "Email sent to reset your password");

    } catch (e) {
    TFullScreenLoader.stopLoading();
   TLoader.errorSnackBar(title: 'on snaps !! ' , message: e.toString());  
    }
}


}