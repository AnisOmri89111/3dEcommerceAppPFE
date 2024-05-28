import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/images/circular_image.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class CategoriesDetails extends StatelessWidget {
  const CategoriesDetails({
    super.key, 
    required this.image, 
    required this.text, 
    this.textColor = TColors.white, 
    this.backGroundColor = TColors.white, 
    this.onTap,  this.isNetworkImage = true});
  final String image , text ;
  final Color textColor ; 
  final Color? backGroundColor ;
  final bool isNetworkImage ;
  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Padding(
                                padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
                                child: Column(
                                  children: [
                                   CustomCircularImage(
                                    fit: BoxFit.fitWidth,
                                    isNetworkImage:isNetworkImage ,
                                    padding: TSizes.sm * 1.4,
                                    backGroundColor: backGroundColor,
                                    overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                                    image: image),
                                    const SizedBox(height: TSizes.spaceBtwItems / 2,),
                                     SizedBox(
                                      width: 55,
                                      child: Text(text,
                                      style: Theme.of(context).textTheme.labelMedium!.apply(color : textColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      ),
      
                                    )
                                  ],
                                ),
                              ),
    );
  }
}