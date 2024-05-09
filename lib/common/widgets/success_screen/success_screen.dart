import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/styles/spacing_style.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key , required this.image , required this.title , required this.subtitle , required this.onPressed});
  final String subtitle , title , image ;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddingWithAppBarHeight *2,
          child:  Column(
            children: [
          //Image
            Image(image: AssetImage(image) , width: THelperFunctions.screenWidth()*0.6,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            
            //Text and SubTitle
            Text(title , style: Theme.of(context).textTheme.headlineMedium, textAlign:TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(subtitle, style: Theme.of(context).textTheme.labelMedium, textAlign:TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),

            //button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(TTexts.tContinue))),

            ],
          ),
        ),
      ),
    );
  }
}