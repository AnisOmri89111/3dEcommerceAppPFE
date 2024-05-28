import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/devices/deviceutils.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key, 
    required this.text, 
    this.icon, 
    this.showBackGround = true, 
    this.showBorder = true, 
    this.onTap 
    });
  final String text ;
  final IconData? icon ; 
  final bool showBackGround , showBorder;
  final VoidCallback? onTap ;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context) ;
    return   GestureDetector(
      onTap: onTap,
      child: Padding(
                    padding : const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                    child: Container(
                      width: TDeviceUtils.getScreenWidth(context),
                      padding: const EdgeInsets.all(TSizes.md),
                      decoration: BoxDecoration(
                        color : showBackGround ? dark ? TColors.dark: TColors.light : Colors.transparent,
                        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                        border: showBorder ? Border.all(color: TColors.grey) : null
                      ),
                      child: Row(
                        children: [
                          Icon(icon , color: TColors.darkerGrey,),
                          const SizedBox(width : TSizes.spaceBtwItems),
                          Text(text , style: Theme.of(context).textTheme.bodySmall,)
      
                        ],
                      ),
                    ),
                  ),
    );
  }
}