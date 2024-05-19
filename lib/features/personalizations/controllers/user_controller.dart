import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/data/repos/users/user_repository.dart';
import 'package:pfeprojectcar/features/authentications/models/user_model.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository()) ; 

  Future<void> saveUserRecords (UserCredential? userCredential) async{
      try {
        if (userCredential != null) {
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredential.user!.displayName ?? '') ;

          final user = UserModel(
            id: userCredential.user!.uid, 
            firstName: nameParts[0], 
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '', 
            username: username, 
            email: userCredential.user!.email ?? '', 
            phoneNumber: userCredential.user!.phoneNumber ?? '', 
            profilePicture: userCredential.user!.photoURL ?? "") ;

          await userRepository.saveUserRecord(user) ;
        } 
      } catch (e) {
        TLoader.errorSnackBar(title: 'Data Not saved ' , message:  'something went wrong please do check your data you provided') ;
      }
  }
}