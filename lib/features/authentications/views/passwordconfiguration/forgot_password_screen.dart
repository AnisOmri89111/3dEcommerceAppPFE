import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/authentications/views/passwordconfiguration/reset_password_screen.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
          Text(TTexts.forgetPasswordTitle , style: Theme.of(context).textTheme.headlineMedium ),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text(TTexts.forgetPasswordSubTitle , style: Theme.of(context).textTheme.labelMedium ),
          const SizedBox(height: TSizes.spaceBtwSections *2,),

            //TextField
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.email , prefixIcon: Icon(Icons.arrow_right_sharp)),
          ),

          const SizedBox(height: TSizes.spaceBtwSections,),
          //Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const ResetPassword()), child: const Text(TTexts.submit)))
          ],
        ),
      ),
    );
  }
}