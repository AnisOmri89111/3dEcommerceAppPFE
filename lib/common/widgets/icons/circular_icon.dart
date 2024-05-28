import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({
    
    super.key, 
    this.width, 
    this.height, 
    this.size =TSizes.lg, 
    required this.icon, 
    this.color, 
    this.backGroundColor, 
    this.onPressed
    
    });
  final double? width , height , size ;
  final IconData icon ;
  final Color? color ;
  final Color? backGroundColor ;
  final VoidCallback? onPressed ;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context) ;
    return Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: backGroundColor != null 
                    ?backGroundColor! :
                    dark ? TColors.black.withOpacity(0.9) 
                    : TColors.white.withOpacity(0.9)
                  ),
                  child: IconButton(onPressed: onPressed,  icon: Icon(icon , color: color , size: size, ), ),
                );
  }
}