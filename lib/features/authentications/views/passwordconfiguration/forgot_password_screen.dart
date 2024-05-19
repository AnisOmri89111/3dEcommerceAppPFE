import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/authentications/controllers/forget_password/forgetpassword_controller.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';
import 'package:pfeprojectcar/utils/validators/validation.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
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
          Form(
            key: controller.forgetPasswordFormKey,
            child: TextFormField(
              controller: controller.email,
              validator: TValidator.validateEmail,
              decoration: const InputDecoration(labelText: TTexts.email , prefixIcon: Icon(Icons.arrow_right_sharp)),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections,),
          //Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail() , child: const Text(TTexts.submit)))
          ],
        ),
      ),
    );
  }
}