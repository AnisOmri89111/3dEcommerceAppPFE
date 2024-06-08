import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/shop/models/car/car_model.dart';
import 'package:pfeprojectcar/features/shop/view/3D/3d_work.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/product_card/bottom_add_to_cart_widget.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/product_card_detail/widget/product-detail_image.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/product_card_detail/widget/product_detail_data.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/product_card_detail/widget/rating_share.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.carProducts});
  final CarModels carProducts ;

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      bottomNavigationBar: const CustomAddButtonToCart(),
      body: SingleChildScrollView(
        child : Column(
          children: [
            const CustomProductImageSlider(),
           //Product Details
           Padding(
            padding:const EdgeInsets.only(right: TSizes.defaultSpace , left:  TSizes.defaultSpace , bottom:  TSizes.defaultSpace),
            child: Column(
              children: [
                //Rating and sharing button
              const CustomRatingandSharing(),
               //Price Title Stack and Brand
              const ProductDetailData(),

                //Description 
  

       //Buy and preview Button
      const SizedBox(height: 12,) ,
      Column(
        children: [
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {} , child: const Text('buy'),),),
        const SizedBox(height: 12,) ,
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const PreviewScreen()) , child: const Text('Preview'),),)


        ],
       ),
      const SizedBox(height: 12,) ,
     const ReadMoreText(
        'Engine: The 2WD Trooper typically came with various engine options over its production span, including both gasoline and diesel engines. Common engines included a 2.6-liter inline-four and a 3.2-liter V6 Transmission: It was available with both manual and automatic transmissions  Design: The Trooper had a boxy, rugged design, emphasizing practicality and durability. It featured a high roofline, which provided excellent headroom and cargo capacity.\n Interior: The interior was designed for functionality, with straightforward controls and materials that could withstand rough use. It could seat five to seven passengers, depending on the configuration. Performance: While the 2WD version lacked the off-road capability of its 4WD counterpart, it still offered a comfortable ride and decent handling for a vehicle of its size. It was suitable for urban driving and long-distance travel. Utility: The Trooper was known for its spacious cargo area, making it a popular choice for families and those needing to haul gear or equipment. Safety: Later models included safety features such as airbags and anti-lock brakes, although earlier versions had more basic safety equipment.',
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'show more',
        trimExpandedText: 'Less',
        moreStyle: TextStyle(fontSize: 14 , fontWeight: FontWeight.w800),
        lessStyle: TextStyle(fontSize: 14 , fontWeight: FontWeight.w800),

      ),
              ],
            ),
           )
          ],
        )
      )
    );
  }
}


