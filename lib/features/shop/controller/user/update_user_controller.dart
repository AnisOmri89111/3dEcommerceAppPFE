import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/connectionchecker/network_manager.dart';
import 'package:pfeprojectcar/data/repos/users/user_repository.dart';
import 'package:pfeprojectcar/features/personalizations/controllers/user_controller.dart';
import 'package:pfeprojectcar/features/shop/view/profile/widget/profile_screen_edit.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/popups/full_screen_loader.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class UpdateUserController extends GetxController {
  static UpdateUserController get instance => Get.find() ;
  GlobalKey<FormState> updateNameGlobal = GlobalKey<FormState>();

  final firstName = TextEditingController() ;
  final lastName = TextEditingController() ;
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());


  @override 
  void onInit() {
    initializeNames();
  super.onInit();
  }

  Future<void> initializeNames () async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;

  }
  Future<void> updateUserName() async{
    try {
    TFullScreenLoader.openLoadingDialog("we are updating your information ...", ImageString.docerAnimation);
    //Connectivity Check
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();

      return ;
    }
    //Form Validation
    if (!updateNameGlobal.currentState!.validate()) {
      TFullScreenLoader.stopLoading();

      return;
    }
    Map<String , dynamic> name = {'firstName'  : firstName.text.trim() , 'lastName' : lastName.text.trim()};
    await userRepository.updateSingleFieldUserData(name);

    userController.user.value.firstName = firstName.text.trim();
    userController.user.value.lastName = lastName.text.trim();

    TFullScreenLoader.stopLoading();

    //Success Message

    TLoader.successSnackBar(title: 'Congratulations !!' , message: "your acoount has been created please do verify your email and thank you");

    Get.off(() => const ProfileScreenEdit());
    } catch (e) {
    TFullScreenLoader.stopLoading();
    TLoader.errorSnackBar(title: 'on snaps !! ' , message: e.toString());
    }

  }
}