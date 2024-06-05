import 'package:pfeprojectcar/features/shop/models/category/category_model.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';

class DummyData {
  //category dummy data 
  static final List<CategoryModel> categories = [
    CategoryModel(image: ImageString.icon2, id: '1', name: "model", isFeatured: true),
    CategoryModel(image: ImageString.icon3, id: '2', name: "price", isFeatured: true),
    CategoryModel(image: ImageString.icon4, id: '3', name: "market", isFeatured: true),

  ];
}