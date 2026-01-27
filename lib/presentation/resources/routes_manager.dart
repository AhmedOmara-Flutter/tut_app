import 'package:flutter/material.dart';
import 'package:tut_app/app/di.dart';
import 'package:tut_app/presentation/onBoarding/view/onBoarding_view.dart';
import 'package:tut_app/presentation/resources/string_manager.dart';
import '../auth/forget_password/forget_password_view.dart';
import '../auth/login/view/login_view.dart';
import '../auth/register/register_view.dart';
import '../main/main_view.dart';
import '../splash/splash_view.dart';

class RoutesManager {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case RoutesManager.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutesManager.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case RoutesManager.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      case RoutesManager.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case RoutesManager.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(StringManager.error)),
          body: Center(child: Text(StringManager.somethingWentWrong)),
        );
      },
    );
  }
}
