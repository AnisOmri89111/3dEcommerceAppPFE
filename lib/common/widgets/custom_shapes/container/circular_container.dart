import 'package:flutter/cupertino.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
  super.key, 
  this.child,  
  this.height, 
  this.margin,
  this.width, 
  this.padding , 
  this.showBorder = false,
  this.radius = TSizes.cardRadiusLg, 
  this.backgroundColor = TColors.white,
  this.borderColor = TColors.borderPrimary
  });


  final double? height  ;
  final double? width ; 
  final EdgeInsets? padding ;
  final EdgeInsets? margin;
  final double radius ;
  final bool showBorder ;
  final Widget? child ;
  final Color backgroundColor ;
  final Color borderColor ; 
  @override
  Widget build(BuildContext context) {
    return Container(
                width: width,
                height: height,
                padding:  padding,
                margin: margin,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: backgroundColor,
                  border: showBorder ? Border.all(color: borderColor) : null
                ),
                child: child
                );
  }
}