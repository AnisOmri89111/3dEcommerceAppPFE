
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/shimmer/vertical_shimmer.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:pfeprojectcar/common/widgets/layouts/grid_layouts.dart';
import 'package:pfeprojectcar/features/shop/controller/products/product_controller.dart';
import 'package:pfeprojectcar/features/shop/view/home/home_appbar.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/categories_widget.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/home_categories.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/product_card/product_card_vertical.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/promo_slider.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/search_widget.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carController = Get.put(ProductController()) ;
    return  Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
           const  CustomHeader(child: Column(
              children: [
                 HomeAppBar(),
                 SizedBox(height : TSizes.spaceBtwSections),
                 SearchWidget(text: 'Search in Car Store' , showBorder: false, ),
                 SizedBox(height : TSizes.spaceBtwSections),
                 Padding(
                  padding:  EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children:   [
                       CategoriesWidgets(title: 'Popular Categories' , showActionButton: false,textColor: Colors.white,),
                       SizedBox(height : TSizes.spaceBtwItems),
                       HomeCategories(),
                  

                    ],
                  ),
                  ),
              ],
            ),
            
            ),
             Padding(
                  padding:  const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      const PromoSlider(banner: [ImageString.banner1 ,ImageString.banner2 , ImageString.banner3 ]),
                      const SizedBox(height: TSizes.spaceBtwSections,),
                      Obx(() {
                        if (carController.isLoading.value) return const CustomVerticalShimmer();
                        if (carController.productCars.isEmpty) {
                          return Center(child: Text('data not found' , style: Theme.of(context).textTheme.bodyMedium,),);
                        }
                        return CustomGridLayouts(intemCounts: carController.productCars.length, itemBuilder: (_,index) =>  CustomProductCardVertical(carProducts: carController.productCars[index],));
                      })
                      
                    ],
                  ),
                  )        
            ],
          )
        ),
      );
    
  }
}