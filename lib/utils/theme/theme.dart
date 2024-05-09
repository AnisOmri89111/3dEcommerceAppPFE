import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/theme/customthemes/text_theme.dart';
import 'package:pfeprojectcar/utils/theme/customthemes/chip_theme.dart';
import 'package:pfeprojectcar/utils/theme/customthemes/appbar_theme.dart';
import 'package:pfeprojectcar/utils/theme/customthemes/bottomsheet_theme.dart';
import 'package:pfeprojectcar/utils/theme/customthemes/checkbox_theme.dart';
import 'package:pfeprojectcar/utils/theme/customthemes/elevatedbutton_theme.dart';
import 'package:pfeprojectcar/utils/theme/customthemes/outlinebutton_theme.dart';
import 'package:pfeprojectcar/utils/theme/customthemes/textfield_theme.dart';
class TAppTheme  {
  TAppTheme._();

static ThemeData lightTheme = ThemeData(
  useMaterial3: true ,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TTextTheme.lightTextTheme,
  chipTheme: CustomChipTheme.lightChipTheme,
  appBarTheme: CustomAppBar.lightAppBarTheme,
  checkboxTheme: CustomCheckBoxTheme.lightCheckboxTheme,
  bottomSheetTheme: CustomBottomSheet.lightBottomSheetTheme,
  elevatedButtonTheme: CustomElevatedTheme.lightElevatedButtonTheme,
  outlinedButtonTheme: CustomoutlineButton.lightOutlinedButtonTheme,
  inputDecorationTheme: CustomTextField.lightInputDecorationTheme,
) ;
static ThemeData darkTheme = ThemeData(
  useMaterial3: true ,
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TTextTheme.darkTextTheme,
  chipTheme: CustomChipTheme.darkChipTheme,
  appBarTheme: CustomAppBar.darkAppBarTheme,
  checkboxTheme: CustomCheckBoxTheme.darkCheckboxTheme,
  bottomSheetTheme: CustomBottomSheet.darkBottomSheetTheme,
  elevatedButtonTheme: CustomElevatedTheme.darkElevatedButtonTheme,
  outlinedButtonTheme: CustomoutlineButton.darkOutlinedButtonTheme,
  inputDecorationTheme: CustomTextField.darkInputDecorationTheme,
) ;

}