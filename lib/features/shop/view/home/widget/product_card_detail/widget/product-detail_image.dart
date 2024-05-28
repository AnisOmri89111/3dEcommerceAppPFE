import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/curvedshape/curved_edge_widget.dart';
import 'package:pfeprojectcar/common/widgets/icons/circular_icon.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class CustomProductImageSlider extends StatelessWidget {
  const CustomProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
        final dark = THelperFunctions.isDarkMode(context) ;

    return  CurvedEdgeWidget(
              child: Container(
                color: dark ? TColors.darkGrey : TColors.light ,
                child: const Stack(
                  children: [
                    SizedBox(
                      height: 400,
                      child: Padding(
                      padding: EdgeInsets.all(TSizes.productImageRadius *2),
                      child: Center(child: Image(image: AssetImage(ImageString.car4)),),
                      
                      ),
                    ),
                    CustomAppBar(
                      showBackArrow: true,
                      actions: [CustomCircularIcon(icon: Iconsax.heart5 , color: Colors.red,)],
                    )
                  ],
                ),
              ),
            );
  }
}