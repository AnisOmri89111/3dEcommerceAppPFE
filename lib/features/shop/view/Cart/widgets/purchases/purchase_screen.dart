import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:pfeprojectcar/common/widgets/success_screen/success_screen.dart';
import 'package:pfeprojectcar/features/shop/view/Cart/widgets/cart_items.dart';
import 'package:pfeprojectcar/features/shop/view/Cart/widgets/purchases/billing_amount.dart';
import 'package:pfeprojectcar/features/shop/view/Cart/widgets/purchases/billing_methods.dart';
import 'package:pfeprojectcar/navigation_bar.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context) ;
    return  Scaffold(
      appBar: CustomAppBar(title: Text('Purchases', style: Theme.of(context).textTheme.headlineSmall,), showBackArrow: true,),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const CustomCartItems(showAddRemoveButton: false,),
             const SizedBox(height: TSizes.spaceBtwItems,),
              CustomContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    //Price
                    BillingInfoScreen() , 
                    SizedBox(height: TSizes.spaceBtwItems,),
                    Divider() ,
                    SizedBox(height: TSizes.spaceBtwItems,),
                    BiliingMethods()


                  ],
                ),
              )
            ],
          ),
         ),
      ),
              bottomNavigationBar: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
        onPressed: ()=> Get.to(() => 
         SuccessScreen(
         image: ImageString.successfulPaymentIcon,
         title: 'payment successfuly done',
         subtitle: 'your car is ready to be picked',
         onPressed: () => Get.offAll(() => const NavigationScreen()),
        )) , child: const Text('Salary  : \$14,548.5')),
    )
    );
  }
}