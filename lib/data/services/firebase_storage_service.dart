import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService extends GetxController{

  static FirebaseStorageService get instance => Get.find() ;

  final firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAsset (String path) async{
      try {
        final byteData = await rootBundle.load(path);
        final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes , byteData.lengthInBytes);
        return imageData ;

      } catch (e) {
        throw 'error loading image data $e';
      }
  }
  Future<String> uploadImageFile(String path , XFile image) async{
        final ref = firebaseStorage.ref(path).child(image.name) ;
        await ref.putFile(File(image.path));
        final url = await ref.getDownloadURL();
        return url;
  }
  Future<String> uploadImageData(String path , Uint8List image , String name ) async {
   final ref = firebaseStorage.ref(path).child(name) ; 
      await ref.putData(image) ; 
      final url = await ref.getDownloadURL();
      return url ;
  }
}