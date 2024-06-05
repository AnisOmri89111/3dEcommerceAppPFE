import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:pfeprojectcar/common/widgets/texts/section_heading.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/product_card/product_price.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';
class ProductDetailData extends StatelessWidget {
  const ProductDetailData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context) ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Row(
        children: [
          CustomContainer(
          radius: TSizes.sm,
          backgroundColor: TColors.secondary.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(horizontal: TSizes.sm , vertical: TSizes.xs),
          child: Text('25%' , style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        //Price 
        Text('\$29,065' , style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
        const SizedBox(width: TSizes.spaceBtwItems,),
        const ProductPriceText(price: '7266.25' , isLarge: true,),
        ],
       ),
       const SizedBox(width: TSizes.spaceBtwItems/1.5,),
       //Title
       const ProductTitleText(title: 'isuzu Trooper 2WD'),
       const SizedBox(width: TSizes.spaceBtwItems/1.5,),
       //Stock Status
       Row(
        children: [
          const ProductTitleText(title: ('Status')),
          const SizedBox(width: TSizes.spaceBtwItems,),
          Text('In Stock' , style: Theme.of(context).textTheme.titleMedium,)
        ],
       ),
      

      ],
    );
  }
}