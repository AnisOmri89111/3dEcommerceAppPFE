import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    super.key, 
    this.color, 
    required this.width, 
    required this.height, 
    this.radius = 15
    });
  final double width , height , radius ;
  final Color? color ;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color?? (dark ? TColors.darkGrey : TColors.white) ,
          borderRadius: BorderRadius.circular(radius)
        ),
      ),
    );
  }
}