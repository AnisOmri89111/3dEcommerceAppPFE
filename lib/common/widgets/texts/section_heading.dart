import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    
    super.key, 
    required this.title, 
    this.smallSize = false, 
    this.finalLines = 2, 
    this.textAlign = TextAlign.left
    });
  final String title ;
  final bool smallSize ;
  final int finalLines ;
  final TextAlign? textAlign ;
  @override
  Widget build(BuildContext context) {
    return   Text(
                title,
                style: smallSize? Theme.of(context).textTheme.labelLarge:Theme.of(context).textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: finalLines,
                textAlign: textAlign,
              );
  }
}