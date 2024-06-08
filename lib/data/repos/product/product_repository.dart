import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/shop/models/car/car_model.dart';
import 'package:pfeprojectcar/utils/exceptions/firebase_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/format_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance ;


    // Function to save CarData from firestore 

    Future<void> saveCarRecord(CarModels car) async {
      try {
        await _db.collection('products').doc(car.id).set(car.toJson());

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
  //Function to fetch car's data
  Future<List<CarModels>> fetchCarData() async{
    try {
      final snapshot = await _db.collection('products').where('isFeatured' , isEqualTo : true).limit(4).get() ;
      return snapshot.docs.map((e) => CarModels.fromSnapshot(e)).toList();
      
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_) {
      throw const TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
    throw 'Something went wrong , please try again ${e.toString()}' ;
    }
  }

}