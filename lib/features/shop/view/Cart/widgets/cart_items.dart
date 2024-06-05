import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/carts/add_remove_button.dart';
import 'package:pfeprojectcar/common/widgets/carts/cart_item.dart';
import 'package:pfeprojectcar/features/shop/view/home/widget/product_card/product_price.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class CustomCartItems extends StatelessWidget {
  const CustomCartItems({super.key,  this.showAddRemoveButton =true});
  final bool showAddRemoveButton ;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          shrinkWrap: true,
          separatorBuilder :(_, __) =>const SizedBox(height: TSizes.spaceBtwSections,), 
      
          itemBuilder:(_, index) =>   Column(
            children: [
           const CustomCartItem(),
            if (showAddRemoveButton)const SizedBox(height: TSizes.spaceBtwItems,),
             if (showAddRemoveButton)const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 90,),
                    ProductCartAddAndRemoveButton()
      
                  ],
                ),
                ProductPriceText(price: '7266.25')
      
              ],
            )
            ],
          ), 
          itemCount: 2); 
          }
}