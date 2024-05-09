import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/authentications/views/passwordconfiguration/forgot_password_screen.dart';
import 'package:pfeprojectcar/features/authentications/views/signup/signup.dart';
import 'package:pfeprojectcar/navigation_bar.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email), labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: TTexts.password,
                suffixIcon: Icon(Icons.remove_red_eye)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields * 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //remember me
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              const Text(TTexts.rememberMe),
              //forgot password
              TextButton(
                  onPressed: () => Get.to(() => const ForgotPasswordScreen()), child: const Text(TTexts.forgetPassword))
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          //SignInButton
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() =>const NavigationScreen()), child: const Text(TTexts.signIn))),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          //CreateAccount
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () =>Get.to(() => const SignUpScreen()), child: const Text(TTexts.createAccount))),
        ],
      ),
    ));
  }
}
