import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/authentications/views/login/login.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body:  SingleChildScrollView(
        child:  Padding(
          padding:const  EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage(ImageString.deliveredEmailIllustration) , width: THelperFunctions.screenWidth()*0.6,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            
            //Text and SubTitle
            Text(TTexts.changeYourPasswordTitle , style: Theme.of(context).textTheme.headlineMedium, textAlign:TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign:TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),

            //button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(()=> const LoginScreen()) , child: const Text(TTexts.done))),
            const SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {} , child: const Text(TTexts.resendEmail))),

            ],
          ),
        ),
      ),
    );
  }
}