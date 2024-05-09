import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/styles/spacing_style.dart';
import 'package:pfeprojectcar/common/widgets/login_signup/form_divider.dart';
import 'package:pfeprojectcar/common/widgets/login_signup/socialbutton.dart';
import 'package:pfeprojectcar/features/authentications/views/login/widgets/login_form.dart';
import 'package:pfeprojectcar/features/authentications/views/login/widgets/login_header.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo and header
              const LoginHeader(),
              //Form
              const LoginForm(),
              //divider  
              CustomFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections,),
              //Footer
              const CustomSocialButton()

            ],
            
          ),
          ),
        
      ),
    );
  }
}