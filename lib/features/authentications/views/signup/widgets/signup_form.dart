import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/features/authentications/controllers/signup/signup_controller.dart';
import 'package:pfeprojectcar/features/authentications/views/signup/widgets/term_condition_checkbox.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';
import 'package:pfeprojectcar/utils/validators/validation.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Form(
      key: controller.signUpFormKey,
      child: Column(
      children: [
        Row(
          children: [
            //TextField For the first and last name
            Expanded(
              child: TextFormField(
                controller: controller.firstname,
                validator:(value) => TValidator.validateEmptyText('First name', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwInputFields,
            ),
            Expanded(
              child: TextFormField(
                  controller: controller.lastname,
                  validator:(value) => TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Icons.person))),
            )
          ],
        ),
        //Username
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        TextFormField(
            controller: controller.username,
            validator:(value) => TValidator.validateEmptyText('Username', value),

            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.username, prefixIcon: Icon(Icons.person_2))),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        //Email
        TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Icons.email))),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        //Phone Number
        TextFormField(
            controller: controller.phoneno,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Icons.phone))),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        //Password
        Obx(
         () => TextFormField(
              controller: controller.password,
              validator:(value) => TValidator.validatePassword(value),
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration:  InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                  onPressed: () =>controller.hidePassword.value = !controller.hidePassword.value, 
                  icon: Icon(controller.hidePassword.value ? Icons.remove_red_eye : Iconsax.eye_slash))
                  )),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        //Term and condition checkbox
        const TermConditionCheckBox(),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        //SignUp Button
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signUp(), child: const Text(TTexts.createAccount)))
      ],
    ));
  }
}
