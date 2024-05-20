import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({

  super.key, 
  this.fit = BoxFit.cover, 
  required this.image, 
  this.isNetworkImage = false, 
  this.overlayColor, 
  this.backGroundColor, 
  this.width = 56, 
  this.height = 56, 
  this.padding = TSizes.sm});

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage ;
  final Color? overlayColor ;
  final Color? backGroundColor ;
  final double width , height , padding ;  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backGroundColor ??(THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}