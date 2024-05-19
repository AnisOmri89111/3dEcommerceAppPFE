import 'package:flutter/cupertino.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
  super.key, 
  this.height= 400, 
  this.width = 400, 
  this.padding = 0, 
  this.radius = 400, 
  this.child,  
  this.backgroundColor = TColors.textWhite});


  final double? height  ;
  final double? width ; 
  final double padding ;
  final double radius ;
  final Widget? child ;
  final Color backgroundColor ;
  @override
  Widget build(BuildContext context) {
    return Container(
                width: width,
                height: height,
                padding:  EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: backgroundColor
                ),
                child: child
                );
  }
}