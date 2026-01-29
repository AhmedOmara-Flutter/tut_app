import 'package:tut_app/app/app_imports.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontFamilyManager.fontFamily,
    color: color,
  );
}

//light
TextStyle getLightTextStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

//regular
TextStyle getRegularTextStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

//medium
TextStyle getMediumTextStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

//semiBold
TextStyle getSemiBoldTextStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}

//bold
TextStyle getBoldTextStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}
