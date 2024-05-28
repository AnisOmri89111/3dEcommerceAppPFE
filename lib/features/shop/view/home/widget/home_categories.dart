import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/shimmer/category_shimmer.dart';
import 'package:pfeprojectcar/features/shop/controller/category/category_controller.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/categories_detail.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});
  @override
  Widget build(BuildContext context) {
      final categoryController = Get.put(CategoryController());

    return   Obx(() {
      if (categoryController.isLoading.value) return const CustomCategoryShimmer() ;
      if (categoryController.featuredCategory.isEmpty) {
        return Center(child: Text('no Data Found ' , style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }
      return SizedBox(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: categoryController.allCategories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_ , index) {
                            return CategoriesDetails(image: ImageString.icon1, text: 'first category' , onTap: () {},) ;
                          }),
                      );
    });
  }
}

