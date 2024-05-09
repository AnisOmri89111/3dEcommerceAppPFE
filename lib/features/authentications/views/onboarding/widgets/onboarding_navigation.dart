import 'package:flutter/material.dart';
import 'package:pfeprojectcar/features/authentications/controllers/onboarding_controller.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/devices/deviceutils.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance ;
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
    bottom: TDeviceUtils.getBottomNavigationBarHeight() +25,
    left: TSizes.defaultSpace,
    child: SmoothPageIndicator(
    controller:controller.pageController,
    onDotClicked: controller.dotNavigationClick,
    count:2,
    effect:  ExpandingDotsEffect(activeDotColor: dark? TColors.light: TColors.dark , dotHeight: 6),
    )
    
    );
  }
}