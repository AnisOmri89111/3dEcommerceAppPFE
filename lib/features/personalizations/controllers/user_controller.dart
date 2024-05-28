import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfeprojectcar/data/repos/users/user_repository.dart';
import 'package:pfeprojectcar/features/authentications/models/user_model.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  final imageLoading = false.obs;

  Rx<UserModel> user = UserModel.empty().obs ;
  final userRepository = Get.put(UserRepository()) ; 

  @override
  void onInit() {
    super.onInit();
    fetchUserDatas();
  }

  Future<void> fetchUserDatas () async {
    try {
      profileLoading.value = true ;
      final user = await userRepository.fetchUserData();
      this.user(user) ;
    } catch (e) {
      user(UserModel.empty());
    }finally{
      profileLoading.value = false ;

    }
  }

  Future<void> saveUserRecords (UserCredential? userCredential) async{
    //refresh user record 

      try {
        await fetchUserDatas();
      
       if (user.value.id.isNotEmpty) {
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
       }
      } catch (e) {
        TLoader.errorSnackBar(title: 'Data Not saved ' , message:  'something went wrong please do check your data you provided') ;
      }
  }
 uploadUSerProfilePicture () async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery , imageQuality: 70 , maxHeight: 512 , maxWidth: 512) ;
      if (image != null)  {
        imageLoading.value = true ;
        final imageUrl = await userRepository.uploadImage('users/images/Profile/', image);

        Map<String , dynamic> json = {"profilePicture" : imageUrl};
        await userRepository.updateSingleFieldUserData(json) ;
        user.value.profilePicture = imageUrl ;
        user.refresh();
        TLoader.successSnackBar(title: 'Congratulations !!!!' , message: 'your profile image has been updated !!!');
      }
    } catch (e) {
    TLoader.errorSnackBar(title: 'Data Not saved ' , message:  'something went wrong please do check your data you provided') ;

    }finally {
      imageLoading.value = false ;
    }
  }
}