import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class CustomGridLayouts extends StatelessWidget {
  const CustomGridLayouts({
    super.key, 
    required this.intemCounts, 
    this.mainAxisExtent =288, 
    required this.itemBuilder});
   
  final int intemCounts;
  final double? mainAxisExtent ;
  final Widget? Function(BuildContext , int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
                        itemCount: intemCounts,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                         mainAxisExtent: mainAxisExtent,
                         mainAxisSpacing: TSizes.gridViewSpacing,
                         crossAxisSpacing: TSizes.gridViewSpacing,

                        ), itemBuilder:itemBuilder);
  }
}