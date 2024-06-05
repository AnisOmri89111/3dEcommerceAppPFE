import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/common/widgets/icons/circular_icon.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class ProductCartAddAndRemoveButton extends StatelessWidget {
  const ProductCartAddAndRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     CustomCircularIcon(
                    icon: Iconsax.minus,
                    width: 32,
                    height: 32,
                    size: TSizes.md,
                    color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                    backGroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems,),
                    Text('1' , style: Theme.of(context).textTheme.titleSmall,),
                    const SizedBox(width: TSizes.spaceBtwItems,),
                   const CustomCircularIcon(
                    icon: Iconsax.add,
                    width: 32,
                    height: 32,
                    size: TSizes.md,
                    color: TColors.white,
                    backGroundColor: TColors.primary)
                    ],
                  );
  }
}