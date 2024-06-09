import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/curvedshape/curved_edge_widget.dart';
import 'package:pfeprojectcar/common/widgets/icons/favourite_icon/favourite_icon.dart';
import 'package:pfeprojectcar/features/shop/models/car/car_model.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class CustomProductImageSlider extends StatelessWidget {
  const CustomProductImageSlider({super.key, required this.products});
  final CarModels products ;
  @override
  Widget build(BuildContext context) {
        final dark = THelperFunctions.isDarkMode(context) ;

    return  CurvedEdgeWidget(
              child: Container(
                color: dark ? TColors.darkGrey : TColors.light ,
                child:  Stack(
                  children: [
                    const SizedBox(
                      height: 400,
                      child: Padding(
                      padding: EdgeInsets.all(TSizes.productImageRadius *2),
                      child: Center(child: Image(image: AssetImage(ImageString.car4)),),
                      
                      ),
                    ),
                    CustomAppBar(
                      showBackArrow: true,
                      actions: [FavouriteIcons(productId: products.id,)],
                    )
                  ],
                ),
              ),
            );
  }
}