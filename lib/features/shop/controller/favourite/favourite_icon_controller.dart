import 'dart:convert';

import 'package:get/get.dart';
import 'package:pfeprojectcar/data/repos/product/product_repository.dart';
import 'package:pfeprojectcar/features/shop/models/car/car_model.dart';
import 'package:pfeprojectcar/utils/local_storage/localstoragehelper.dart';
import 'package:pfeprojectcar/utils/popups/loader.dart';

class FavouriteIconController extends GetxController {
  static FavouriteIconController get instance => Get.find();
  final favourites = <String , bool>{}.obs ; 
   
  @override
  void onInit() {

    super.onInit();
    initFavourite();
  }
  void initFavourite()  {
    final json = TLocalStorage.instance().readData('favourites') ;
    if (json !=null) {
      final storedFavourites = jsonDecode(json) as Map<String , dynamic> ;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));

    }
  }
  bool isFavourite(String productId) {
      return favourites[productId] ?? false ;
  }
  void toggleFavouriteProduct (String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true ;
      saveFavouriteToStotage() ; 
      TLoader.customToast(message: 'Product Has been added to Wishlist') ;
    }else {
      TLocalStorage.instance().removeData(productId) ;
      favourites.remove(productId);
      saveFavouriteToStotage() ; 
      favourites.refresh() ;
      TLoader.customToast(message: 'Product Has been removed from Wishlist') ;

    }
  }
  void saveFavouriteToStotage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', encodedFavourites);
  }
  Future <List<CarModels>> favouriteCars() async {
   
      return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList()) ;
  }
}