import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/common/widgets/icons/circular_icon.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class CustomAddButtonToCart extends StatelessWidget {
  const CustomAddButtonToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context) ;
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace , vertical: TSizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        )
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(children: [
        const CustomCircularIcon(
        icon: Iconsax.minus,
        backGroundColor: TColors.darkGrey,
        width: 40,
        height: 40,
        color: TColors.white,
       ),
       const SizedBox(width: TSizes.spaceBtwItems,),
       Text('2' , style: Theme.of(context).textTheme.titleSmall,),
       const SizedBox(width: TSizes.spaceBtwItems,),
        const CustomCircularIcon(
        icon: Iconsax.add,
        backGroundColor: TColors.darkGrey,
        width: 40,
        height: 40,
        color: TColors.white,
       )       

      ],
      ),
      ElevatedButton(
        onPressed: () {}, 
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: TColors.black,
          side: const BorderSide(color: TColors.black)
        ),
        child: const  Text('Add to Cart'))
        ],
      ),

    );
  }
}