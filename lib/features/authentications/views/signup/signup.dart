import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/login_signup/form_divider.dart';
import 'package:pfeprojectcar/common/widgets/login_signup/socialbutton.dart';
import 'package:pfeprojectcar/features/authentications/views/signup/widgets/signup_form.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.signupTitle , style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              //Forms
              const SignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections,),
              //Divider
              CustomFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections,),
              //SocialMedia Button
              const CustomSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}