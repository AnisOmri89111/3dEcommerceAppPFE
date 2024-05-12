
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/success_screen/success_screen.dart';
import 'package:pfeprojectcar/data/repos/authentication_repository.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class EmailVerifController extends GetxController{
 static EmailVerifController get instance => Get.find();
  @override
  void onInit() {
    sendEmailVerif();
    autoDirectTimer();
    super.onInit();
  }
  //Send email verif 
  sendEmailVerif () async{
    try {
      await AuthenticationRepository.instance.sendVerificationEmail();
      TLoader.successSnackBar(title: 'email sent successfuly' , message: 'please check your inbox and verify your email');
    } catch (e) {
      TLoader.errorSnackBar(title: 'oh snap !!' , message: e.toString());
    }
  }
  autoDirectTimer () {
    Timer.periodic(const Duration(seconds: 1), (timer) async { 
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser ;
        if (user?.emailVerified ?? false)  {
          timer.cancel();
          Get.off(
            ()=> SuccessScreen(
            image: ImageString.verificationComplete, 
            title: TTexts.yourAccountCreatedTitle, 
            subtitle: TTexts.yourAccountCreatedSubTitle, 
            onPressed: () => AuthenticationRepository.instance.screenRedirect())
          );
        }
    });
  }

  checkEmailVerificationStatus () async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
       Get.off(
            ()=> SuccessScreen(
            image: ImageString.verificationComplete, 
            title: TTexts.yourAccountCreatedTitle, 
            subtitle: TTexts.yourAccountCreatedSubTitle, 
            onPressed: () => AuthenticationRepository.instance.screenRedirect())
          );
    }
  }
}