import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/authentications/views/onboarding/onboarding.dart';
import 'package:pfeprojectcar/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}