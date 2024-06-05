import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/texts/section_heading.dart';
import 'package:pfeprojectcar/common/widgets/titles/brand_title_with_vetified_icon.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/rounded_image.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
                  children: [
                    RoundedImage(
                      imgUrl: ImageString.car4,
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.white,
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          const  BrandTitleWithVerifiedICon(title: 'isuzu Trooper 2WD'),
                          const Flexible(child: ProductTitleText(title: 'Reliable, spacious, economical SUV' , finalLines: 1,)),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(text: 'Price: ' , style: Theme.of(context).textTheme.bodySmall) , 
                                TextSpan(text: '\$7266.25' , style: Theme.of(context).textTheme.bodyLarge) , 

                              ])
                            )
                          ],
                        ),
                      )
                  ],
                );
  }
}