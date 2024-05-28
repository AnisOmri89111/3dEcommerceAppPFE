import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/shop/models/category/category_model.dart';
import 'package:pfeprojectcar/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/firebase_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/format_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find() ;

  final _db = FirebaseFirestore.instance; 

  //Get all Categories 
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot =  await _db.collection('categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list ;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
      throw const TFormatException();
      }catch(e){
       throw "Something went wrong please try again" ;
          
        
  }
  }
}