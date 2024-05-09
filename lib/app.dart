import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/bindings/general_binding.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
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
      initialBinding: GeneralBinding(),
      home: const Scaffold(backgroundColor: TColors.primary, 
      body: Center(
        child: CircularProgressIndicator(color: Colors.white,),
      ),
      ),
    );
  }
}