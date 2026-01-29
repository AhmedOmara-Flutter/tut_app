import 'package:tut_app/app/app_imports.dart';

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
        //text under login
        titleSmall: getMediumTextStyle(
          color: ColorManger.primary,
          fontSize: AppSizeManager.s14,
        ),
        //body
        bodyLarge: getRegularTextStyle(
          color: ColorManger.lightGrey,
          fontSize: FontSizeManager.s14,
        ),
      ),
      //input decoration
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPaddingManager.p20),
        labelStyle: getRegularTextStyle(
          color: ColorManger.grey,
          fontSize: FontSizeManager.s16,
        ),
        hintStyle: getRegularTextStyle(
          color: ColorManger.grey,
          fontSize: FontSizeManager.s16,
        ),
        errorStyle: getRegularTextStyle(color: ColorManger.error),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.lightGrey),
          borderRadius: BorderRadius.circular(AppSizeManager.s12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.primary),
          borderRadius: BorderRadius.circular(AppSizeManager.s12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.grey),
          borderRadius: BorderRadius.circular(AppSizeManager.s12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.primary),
          borderRadius: BorderRadius.circular(AppSizeManager.s12),
        ),
      ),
    );
  }
}
