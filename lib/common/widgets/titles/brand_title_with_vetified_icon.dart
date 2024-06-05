import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/common/widgets/texts/section_heading.dart';
import 'package:pfeprojectcar/utils/constants/enums.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class BrandTitleWithVerifiedICon
 extends StatelessWidget {
  const BrandTitleWithVerifiedICon
  ({super.key, 
  required this.title, 
  this.maxLines = 1, 
  this.textColor, 
  this.iconColor, 
  this.textAlign = TextAlign.center ,
  this.brandTextSIzes = TextSizes.small
  });
  final String title ;
  final int maxLines ;
  final Color? textColor , iconColor ;
  final TextAlign? textAlign ;
  final TextSizes brandTextSIzes ;
  @override

  Widget build(BuildContext context) {
    return  Row(
      children: [
        Flexible(
        child: 
        ProductTitleText(title: title , textAlign: textAlign, finalLines: maxLines, ),
        ),
        const SizedBox(width: TSizes.xs,),
        Icon(Iconsax.verify , color: iconColor, size: TSizes.iconXs,)
      ],
    );
  }
}