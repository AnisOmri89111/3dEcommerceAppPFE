import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfeprojectcar/data/repos/authentication_repository.dart';
import 'package:pfeprojectcar/features/authentications/models/user_model.dart';
import 'package:pfeprojectcar/utils/exceptions/firebase_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/format_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance ;


  // Function to save userData from firestore 

  Future<void> saveUserRecord(UserModel user) async{
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
    throw 'Something went wrong , please try again' ;
    }
  }

  //Function to fetch USer's data
  Future<UserModel> fetchUserData() async{
    try {
      final documentSnapshot = await _db.collection('users').doc(AuthenticationRepository.instance.authUser?.uid).get() ;
      if (documentSnapshot.exists) {
       return UserModel.fromSnapshot(documentSnapshot) ;
      } else {
       return UserModel.empty(); 
      }
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
    throw 'Something went wrong , please try again' ;
    }
  }

  //Function to Update User Data in firestore

   Future<void> updateUserData(UserModel updateUser) async{
    try {
      await _db.collection('users').doc(updateUser.id).update(updateUser.toJson()) ;  
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
    throw 'Something went wrong , please try again' ;
    }
  }

   Future<void> updateSingleFieldUserData(Map<String , dynamic > json) async{
    try {
      await _db.collection('users').doc(AuthenticationRepository.instance.authUser?.uid).update(json) ;  
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
    throw 'Something went wrong , please try again' ;
    }
  }

  //Remove data from fireStore
    Future<void> deleteUserData(String userData) async{
    try {
      await _db.collection('users').doc(userData).delete() ;  
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
    throw 'Something went wrong , please try again' ;
    }
  }

  //Upload Any Image 
 Future<String> uploadImage (String path , XFile image) async {
  try {
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
    throw 'Something went wrong , please try again' ;
    }
 }

}