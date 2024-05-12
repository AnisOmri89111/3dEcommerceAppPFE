import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/features/authentications/controllers/login/login_controller.dart';
import 'package:pfeprojectcar/features/authentications/views/passwordconfiguration/forgot_password_screen.dart';
import 'package:pfeprojectcar/features/authentications/views/signup/signup.dart';
import 'package:pfeprojectcar/navigation_bar.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';
import 'package:pfeprojectcar/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator:(value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email), labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validateEmptyText('Password' , value),
              obscureText: controller.hidePassword.value,
              decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () =>controller.hidePassword.value = !controller.hidePassword.value, 
                    icon: Icon(controller.hidePassword.value ? Icons.remove_red_eye : Iconsax.eye_slash))),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields * 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //remember me
              Obx(
                () => Checkbox(
                  value: controller.rememberMe.value,
                  onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                ),
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
                  onPressed: () => controller.signIn(), child: const Text(TTexts.signIn))),
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
