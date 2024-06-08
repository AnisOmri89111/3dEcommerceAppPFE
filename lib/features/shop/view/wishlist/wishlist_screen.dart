import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/common/widgets/icons/circular_icon.dart';
import 'package:pfeprojectcar/common/widgets/layouts/grid_layouts.dart';
import 'package:pfeprojectcar/features/shop/view/home/home_screen.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/product_card/product_card_vertical.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: false,
        title:Text('Wishlist', style : Theme.of(context).textTheme.headlineMedium),
        actions: [CustomCircularIcon(icon: Iconsax.add , onPressed: () => Get.to(() => const HomeScreen()),)],
         ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
          /*  child: Column(
              children: [
                CustomGridLayouts(
                  intemCounts: 4, 
                  itemBuilder: (__ , index) => const CustomProductCardVertical(carProducts: null,)
                  )
              ],
            ),*/
            ),
        ),
      
      );
  }
}