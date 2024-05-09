import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context) ;

    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                  height: 150,  
                  image: AssetImage(dark ?ImageString.darkAppLogo : ImageString.lightAppLogo)),
                  Text(TTexts.loginTitle , style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: TSizes.sm,),
                  Text(TTexts.loginSubTitle , style: Theme.of(context).textTheme.bodyMedium,)

                ],
              );
  }
}