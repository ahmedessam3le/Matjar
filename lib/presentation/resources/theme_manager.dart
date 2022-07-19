import 'package:flutter/material.dart';
import 'package:matjar/presentation/resources/color_manager.dart';
import 'package:matjar/presentation/resources/font_manager.dart';
import 'package:matjar/presentation/resources/text_styles_manager.dart';
import 'package:matjar/presentation/resources/values_manager.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,

  // Main Colors
  primaryColor: ColorManager.primaryColor,
  primaryColorDark: ColorManager.darkPrimaryColor,
  disabledColor: ColorManager.greyColor,
  splashColor: ColorManager.primaryColor,

  // App Bar Theme
  appBarTheme: AppBarTheme(
    centerTitle: true,
    color: ColorManager.primaryColor,
    shadowColor: ColorManager.darkPrimaryColor,
    titleTextStyle: regularTextStyle(
      fontSize: FontSize.sp16,
      color: ColorManager.whiteColor,
    ),
    elevation: AppSize.s4,
  ),

  // Text Theme
  textTheme: TextTheme(
    headlineLarge: semiBoldTextStyle(
      fontSize: FontSize.sp16,
      color: ColorManager.darkGreyColor,
    ),
    titleMedium: mediumTextStyle(
      fontSize: FontSize.sp14,
      color: ColorManager.lightGreyColor,
    ),
    bodyMedium: regularTextStyle(
      fontSize: FontSize.sp14,
      color: ColorManager.greyColor,
    ),
    bodyLarge: semiBoldTextStyle(
      fontSize: FontSize.sp18,
      color: ColorManager.darkGreyColor,
    ),
    displayLarge: boldTextStyle(
      fontSize: FontSize.sp22,
      color: ColorManager.darkGreyColor,
    ),
  ),

  // Text Form Field Theme
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.all(AppPadding.p8),
    hintStyle: regularTextStyle(
      fontSize: FontSize.sp16,
      color: ColorManager.greyColor,
    ),
    labelStyle: mediumTextStyle(
      fontSize: FontSize.sp17,
      color: ColorManager.greyColor,
    ),
    errorStyle: mediumTextStyle(
      fontSize: FontSize.sp16,
      color: ColorManager.redColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.greyColor,
        width: AppSize.s1_5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.s8),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.primaryColor,
        width: AppSize.s1_5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.s8),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.redColor,
        width: AppSize.s1_5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.s8),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.redColor,
        width: AppSize.s1_5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.s8),
      ),
    ),
  ),

  // Button Theme
  buttonTheme: ButtonThemeData(
    shape: StadiumBorder(),
    buttonColor: ColorManager.primaryColor,
    splashColor: ColorManager.primaryColor,
    disabledColor: ColorManager.greyColor,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: regularTextStyle(
        fontSize: FontSize.sp17,
        color: ColorManager.whiteColor,
      ),
      primary: ColorManager.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    ),
  ),

  // Card Theme
  cardTheme: CardTheme(
    color: ColorManager.whiteColor,
    shadowColor: ColorManager.lightGreyColor,
    elevation: AppSize.s4,
  ),
);
