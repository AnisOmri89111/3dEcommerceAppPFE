import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/data/repos/category/category_repository.dart';
import 'package:pfeprojectcar/data/services/firebase_storage_service.dart';
import 'package:pfeprojectcar/features/shop/models/category/category_model.dart';
import 'package:pfeprojectcar/utils/exceptions/firebase_exceptions.dart';
import 'package:pfeprojectcar/utils/exceptions/format_exceptions.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find() ;
  final isLoading = false.obs ;
  final categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs ; 
  RxList<CategoryModel> featuredCategory = <CategoryModel>[].obs ; 
  final _db = FirebaseFirestore.instance; 



  @override 
  void onInit() {
    fetchCategories() ;
    super.onInit() ; 
  }

  Future<void> fetchCategories() async {
    try {
    isLoading.value  = true ;
    final categories = await categoryRepository.getAllCategories();
    allCategories.assignAll(categories) ; 
    featuredCategory.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(4).toList());
    } catch (e) {
     TLoader.errorSnackBar(title: 'oh SNap something went wrong !!' , message: e.toString()) ;
    }finally{
      //remove the loader
      isLoading.value = false ; 
    }

  }
  Future<void> fetchDummyCategories(List<CategoryModel> categories) async {
    try {
     final storage = Get.put(FirebaseStorageService()) ;
     for (var category in categories) {
      final files = await storage.getImageDataFromAsset(category.image);

      final url = await storage.uploadImageData('categories', files, category.name);
      category.image = url ; 
      await _db.collection('categories').doc(category.id).set(category.toJson()) ;
     }
    }  on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
      throw const TFormatException();
      }catch(e){
       throw "Something went wrong please try again" ;
          
        
  }
  }
}