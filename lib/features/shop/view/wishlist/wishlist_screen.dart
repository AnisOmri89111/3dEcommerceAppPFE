import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/animation_loader.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/shimmer/vertical_shimmer.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/common/widgets/icons/circular_icon.dart';
import 'package:pfeprojectcar/common/widgets/layouts/grid_layouts.dart';
import 'package:pfeprojectcar/features/shop/controller/favourite/favourite_icon_controller.dart';
import 'package:pfeprojectcar/features/shop/models/car/car_model.dart';
import 'package:pfeprojectcar/features/shop/view/home/home_screen.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/product_card/product_card_vertical.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/cloud_helper_functions.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteIconController.instance ;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: false,
        title:Text('Wishlist', style : Theme.of(context).textTheme.headlineMedium),
        actions: [CustomCircularIcon(icon: Iconsax.add , onPressed: () => Get.to(() => const HomeScreen()),)],
         ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Obx(
              () =>FutureBuilder(
                future: controller.favouriteCars(),
                builder: (context, snapshot) {
                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'wishList is empty', 
                    animation: ImageString.docerAnimation ,
                    actionText: 'lets add some',
                    onActionPressed: () => Get.off(() => const HomeScreen()),
                    );
                  const loader = CustomVerticalShimmer(countItem: 6,);
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot , loader: loader , nothingFound: emptyWidget);
                  if (widget != null) return widget ;
                  final products = snapshot.data!;
                  return CustomGridLayouts(
                    intemCounts: products.length, 
                    itemBuilder: (__ , index) =>  CustomProductCardVertical(carProducts: products[index],)
                    );
                }
              ),
            ),
            ),
        ),
      
      );
  }
}