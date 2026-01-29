import 'package:tut_app/app/app_imports.dart';

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
