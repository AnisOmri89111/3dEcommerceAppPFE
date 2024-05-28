import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/shimmer/shimmer.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage ?
          CachedNetworkImage(
            fit: fit,
            color: overlayColor,
            imageUrl: image,
            progressIndicatorBuilder:(context, url, progress) => const ShimmerLoader(width: 55, height: 55 , radius: 55,),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            )
            :Image(
            fit: fit,
            image:  AssetImage(image) as ImageProvider,
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}