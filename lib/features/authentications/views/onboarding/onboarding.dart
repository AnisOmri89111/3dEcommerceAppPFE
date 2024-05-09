import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/authentications/controllers/onboarding_controller.dart';
import 'package:pfeprojectcar/features/authentications/views/onboarding/widgets/onboarding_navigation.dart';
import 'package:pfeprojectcar/features/authentications/views/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:pfeprojectcar/features/authentications/views/onboarding/widgets/onboarding_page.dart';
import 'package:pfeprojectcar/features/authentications/views/onboarding/widgets/onboarding_skip.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return  Scaffold(
     body:  Stack(
        children: [
          //horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children:  const [
              OnBoardingPage(image: ImageString.onboardingScreen2, title: TTexts.onBoardingTitle1, subtitle: TTexts.onBoardingSubTitle1),
              OnBoardingPage(image: ImageString.onboardingScreen1, title: TTexts.onBoardingTitle2, subtitle: TTexts.onBoardingSubTitle2),
            ],
          ),
          //Skip Text
            const OnBoardingSkip(),
            //smooth Scrolling
            const OnBoardingNavigation(),
            const OnBoardingNextButton()
        ],
    )
    );
  }
  
}
