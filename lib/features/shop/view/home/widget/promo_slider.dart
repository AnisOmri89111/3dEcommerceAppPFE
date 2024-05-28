import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:pfeprojectcar/features/shop/controller/home_controller.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/rounded_image.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key, required this.banner});

  final List<String> banner ;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index , _) => controller.updatePageIndicator(index)
                      ), 
                        items:banner.map((url) => RoundedImage(imgUrl: url)).toList() ,
                      ),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    Center(
                      child: Obx(
                        () => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for(int i = 0 ; i< banner.length ; i++) 
                             CustomContainer(
                              width: 20,
                              height: 4,
                              margin: const EdgeInsets.only(right: 10), 
                              backgroundColor: controller.carousselCurrentIndex.value == i ? TColors.primary : TColors.grey,)
                          ],
                        ),
                      ),
                    )
                    ],
                  );
  }
}