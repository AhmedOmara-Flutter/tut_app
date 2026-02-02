import 'package:tut_app/app/app_imports.dart';
const String ONBOARDING_KEY = "ONBOARDING_KEY";
const String LOGIN_KEY = "LOGIN_KEY";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  ///set onboarding key
  Future<void> setOnBoardingKey() async {
    _sharedPreferences.setBool(ONBOARDING_KEY, true);
  }

  ///get onboarding key
  Future<bool> getOnBoardingKey() async {
    return _sharedPreferences.getBool(ONBOARDING_KEY) ?? false;
  }

  ///set login key
  Future<void> setLoginKey() async {
    _sharedPreferences.setBool(LOGIN_KEY, true);
  }

  ///get login key
  Future<bool> getLoginKey() async {
    return _sharedPreferences.getBool(LOGIN_KEY) ?? false;
  }
}
