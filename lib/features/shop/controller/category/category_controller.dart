import 'package:get/get.dart';
import 'package:pfeprojectcar/data/repos/category/category_repository.dart';
import 'package:pfeprojectcar/features/shop/models/category/category_model.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find() ;
  final isLoading = false.obs ;
  final categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs ; 
  RxList<CategoryModel> featuredCategory = <CategoryModel>[].obs ; 



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
}