import 'package:flutter/material.dart';
import 'package:pfeprojectcar/features/authentications/controllers/onboarding_controller.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/devices/deviceutils.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
            top:TDeviceUtils.getAppBarHeight(), 
            right: TSizes.defaultSpace, 
            child :TextButton(onPressed: () {
              OnBoardingController.instance.skipPage();
            }, 
            child: const Text("skip")
            )
            );
  }
}