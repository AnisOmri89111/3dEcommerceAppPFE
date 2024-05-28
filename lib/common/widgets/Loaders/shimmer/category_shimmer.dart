import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/shimmer/shimmer.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({super.key, 
   this.itemCount = 4});

  final int  itemCount ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_,__) => const SizedBox(width: TSizes.spaceBtwItems,), 
        itemBuilder:(context, index) {
          return const Column(
            children: [
              ShimmerLoader(width: 55, height: 55 , radius: 55,),
              SizedBox(height: TSizes.spaceBtwItems/2,),
              ShimmerLoader(width: 55, height: 8)
            ],
          );
        }, 
        
       ),
    );
  }
}