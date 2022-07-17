import 'package:flutter/material.dart';
import 'package:matjar/presentation/resources/color_manager.dart';
import 'package:matjar/presentation/resources/font_manager.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamily,
    color: color,
  );
}

TextStyle lightTextStyle({
  double fontSize = FontSize.sp14,
  Color color = ColorManager.greyColor,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.light, color: color);
}

TextStyle regularTextStyle({
  double fontSize = FontSize.sp14,
  Color color = ColorManager.greyColor,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.regular, color: color);
}

TextStyle mediumTextStyle({
  double fontSize = FontSize.sp14,
  Color color = ColorManager.greyColor,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.medium, color: color);
}

TextStyle semiBoldTextStyle({
  double fontSize = FontSize.sp14,
  Color color = ColorManager.greyColor,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.semiBold, color: color);
}

TextStyle boldTextStyle({
  double fontSize = FontSize.sp14,
  Color color = ColorManager.greyColor,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.bold, color: color);
}
