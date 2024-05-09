import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/authentications/views/signup/widgets/emailverif_screen.dart';
import 'package:pfeprojectcar/features/authentications/views/signup/widgets/term_condition_checkbox.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {

    return Form(
        child: Column(
      children: [
        Row(
          children: [
            //TextField For the first and last name
            Expanded(
              child: TextFormField(
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
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.username, prefixIcon: Icon(Icons.person_2))),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        //Email
        TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Icons.email))),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        //Phone Number
        TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Icons.phone))),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        //Password
        TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Icons.password),
                suffixIcon: Icon(Icons.remove_red_eye))),
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
                onPressed: () => Get.to(() => const EmailVerificationScreen()), child: const Text(TTexts.createAccount)))
      ],
    ));
  }
}
