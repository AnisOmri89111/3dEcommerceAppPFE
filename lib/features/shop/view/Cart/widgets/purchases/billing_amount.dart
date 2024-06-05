import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class BillingInfoScreen extends StatelessWidget {
  const BillingInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       Row(
        children: [
        Text('Total Purchase' ,  style: Theme.of(context).textTheme.bodyMedium,),
        Text('\$7266.25' ,  style: Theme.of(context).textTheme.bodyMedium,),
        ],
       ),
      const SizedBox(height: TSizes.spaceBtwItems/2,),
      //Tax Fee
       Row(
        children: [
        Text('Tax fee' ,  style: Theme.of(context).textTheme.bodyMedium,),
        Text('\$8.00' ,  style: Theme.of(context).textTheme.bodyMedium,),
        ],
       ),
       //Order total
       const SizedBox(height: TSizes.spaceBtwItems/2,),
       Row(
        children: [
        Text('Order fee' ,  style: Theme.of(context).textTheme.bodyMedium,),
        Text('\$8.00' ,  style: Theme.of(context).textTheme.bodyMedium,),
        ],
       ),

      ],
    );
  }
}