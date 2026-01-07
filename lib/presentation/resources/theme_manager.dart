import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/style_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';
import 'color_manger.dart';
import 'font_manager.dart';

class ThemeManager {
  static ThemeData getThemeDataApplication() {
    return ThemeData(
      //main colors
      primaryColor: ColorManger.primary,
      primaryColorLight: ColorManger.lightPrimary,
      primaryColorDark: ColorManger.darkPrimary,
      disabledColor: ColorManger.grey1,
      splashColor: ColorManger.lightPrimary,
      fontFamily: FontFamilyManager.fontFamily,
      scaffoldBackgroundColor: ColorManger.white,
      //appbar
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManger.primary,
        centerTitle: true,
        elevation: FontSizeManager.s4,
        titleTextStyle: getSemiBoldTextStyle(
          color: ColorManger.white,
          fontSize: FontSizeManager.s16,
        ),
      ),
      //card
      cardTheme: CardThemeData(
        color: ColorManger.white,
        shadowColor: ColorManger.grey,
        elevation: FontSizeManager.s4,
      ),
      //elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManger.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeManager.s16),
          ),
          textStyle: getRegularTextStyle(
            color: ColorManger.white,
            fontSize: FontSizeManager.s17,
          ),
          foregroundColor: Colors.white,
        ),
      ),
      //text
      textTheme: TextTheme(
        //onBoarding headline
        headlineLarge: getSemiBoldTextStyle(
          color: ColorManger.darkGray,
          fontSize: FontSizeManager.s16,
        ),
        //onBoarding subHeadline
        headlineMedium: getRegularTextStyle(
          color: ColorManger.darkGray,
          fontSize: FontSizeManager.s14,
        ),
        //skip
        titleLarge: getMediumTextStyle(
          color: ColorManger.primary,
          fontSize: AppSizeManager.s16,
        ),
        //body
        bodyLarge: getRegularTextStyle(
          color: ColorManger.lightGrey,
          fontSize: FontSizeManager.s14,
        ),
      ),
      //input decoration
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPaddingManager.p12),
        labelStyle: getRegularTextStyle(
          color: ColorManger.grey,
          fontSize: FontSizeManager.s14,
        ),
        hintStyle: getRegularTextStyle(
          color: ColorManger.grey,
          fontSize: FontSizeManager.s14,
        ),
        errorStyle: getRegularTextStyle(color: ColorManger.error),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.grey),
          borderRadius: BorderRadius.circular(AppSizeManager.s8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.grey),
          borderRadius: BorderRadius.circular(AppSizeManager.s8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.grey),
          borderRadius: BorderRadius.circular(AppSizeManager.s8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.primary),
          borderRadius: BorderRadius.circular(AppSizeManager.s8),
        ),
      ),
    );
  }
}
