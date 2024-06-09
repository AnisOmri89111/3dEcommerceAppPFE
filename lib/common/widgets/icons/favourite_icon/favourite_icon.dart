import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/icons/circular_icon.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/features/shop/controller/favourite/favourite_icon_controller.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';

class FavouriteIcons extends StatelessWidget {
  const FavouriteIcons({super.key, required this.productId});
  final   String productId ;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteIconController());
    return Obx(() =>  CustomCircularIcon(
                        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart ,
                        color: controller.isFavourite(productId) ? TColors.error : null,
                        onPressed: () => controller.toggleFavouriteProduct(productId) ,
                      )
                      );
  }
}