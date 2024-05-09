import 'package:flutter/material.dart';
import 'package:pfeprojectcar/features/authentications/controllers/onboarding_controller.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/devices/deviceutils.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';
class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
      final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
    right: TSizes.defaultSpace,
    bottom: TDeviceUtils.getBottomNavigationBarHeight(),
    child: ElevatedButton(
      onPressed:(){
        OnBoardingController.instance.nextPage();
      } , 
      style: ElevatedButton.styleFrom(
      shape: const CircleBorder(), 
      backgroundColor: dark ? TColors.primary : Colors.black),
      child: const Icon(Icons.keyboard_arrow_right_outlined),
      )
    );
  }
}