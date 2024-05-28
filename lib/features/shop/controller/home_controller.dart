import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find() ; 

  final carousselCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousselCurrentIndex.value = index ;
  }
}