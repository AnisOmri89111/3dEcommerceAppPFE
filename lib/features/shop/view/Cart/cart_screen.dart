import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/features/shop/view/Cart/widgets/cart_items.dart';
import 'package:pfeprojectcar/features/shop/view/Cart/widgets/purchases/purchase_screen.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall,), showBackArrow: true,),
      body: const Padding(
        padding:   EdgeInsets.all(TSizes.defaultSpace),
        child: CustomCartItems(),
        ),
        bottomNavigationBar: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=> Get.to(() => const PurchaseScreen()) , child: const Text('Salary  : \$14,532.5')),
        ),
    );
  }
}
