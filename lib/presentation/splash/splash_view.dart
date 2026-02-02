import 'package:tut_app/app/app_imports.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _prefs = instance<AppPreferences>();

  void _startDelay() {
    _timer = Timer(
      Duration(seconds: AppConstants.splashDelay),
      () => goNext(context),
    );
  }

  void goNext(context) async {
    // final isOnBoardingView = await instance<AppPreferences>()
    //     .getOnBoardingKey();
    // final isLoginView = await instance<AppPreferences>().getLoginKey();
    // if (isLoginView == true) {
    //   Navigator.pushReplacementNamed(context, RoutesManager.mainRoute);
    // } else {
    //   if (isOnBoardingView == true) {
    //     Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
    //
    //   }else{
    //     Navigator.pushReplacementNamed(context, RoutesManager.onBoardingRoute);
    //   }
    //}
    // دا حل الكورس
    // _prefs.getLoginKey().then((isUserLoggedIn) => {
    //   if (isUserLoggedIn)
    //     {
    //       // navigate to main screen
    //       Navigator.pushReplacementNamed(context, RoutesManager.mainRoute)
    //     }
    //   else
    //     {
    //       _prefs
    //           .getOnBoardingKey()
    //           .then((isOnBoardingScreenViewed) => {
    //         if (isOnBoardingScreenViewed)
    //           {
    //             // navigate to login screen
    //
    //             Navigator.pushReplacementNamed(
    //                 context, RoutesManager.loginRoute)
    //           }
    //         else
    //           {
    //             // navigate to onboarding screen
    //
    //             Navigator.pushReplacementNamed(
    //                 context, RoutesManager.onBoardingRoute)
    //           }
    //       })
    //     }
    // });
    Navigator.pushReplacementNamed(context, RoutesManager.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primary,
      body: Center(child: Image.asset(ImageAssets.splashLogo)),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
