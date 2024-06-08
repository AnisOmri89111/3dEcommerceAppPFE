import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/shimmer/shimmer.dart';
import 'package:pfeprojectcar/common/widgets/layouts/grid_layouts.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class CustomVerticalShimmer extends StatelessWidget {
  const CustomVerticalShimmer({super.key,  this.countItem = 4});

  final int countItem ;
  @override
  Widget build(BuildContext context) {
    return CustomGridLayouts(
    intemCounts: countItem, itemBuilder: (_,__) => const SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoader(width: 180, height: 180),
          SizedBox(height: TSizes.spaceBtwItems,),
          ShimmerLoader(width: 160, height: 15),
          SizedBox(height: TSizes.spaceBtwItems / 2,),
          ShimmerLoader(width: 110, height: 15),

        ],
      ),
    ));
  }
}