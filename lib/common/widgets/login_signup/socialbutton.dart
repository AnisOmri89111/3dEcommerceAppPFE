import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/authentications/controllers/login/login_controller.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({super.key});
  @override
  Widget build(BuildContext context) {
      final controller = Get.put(LoginController()) ;

    return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.grey ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () => controller.googleSignIn(),
                      icon: const Image(
                        width: TSizes.iconMd,
                        height: TSizes.iconMd,
                        image: AssetImage(ImageString.google)),
                    ),
                  )
                ],
              );
  }
}