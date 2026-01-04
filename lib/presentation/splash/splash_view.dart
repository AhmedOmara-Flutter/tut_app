import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manger.dart';
import '../resources/constants_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(Duration(seconds: AppConstants.splashDelay), () {
      Navigator.pushReplacementNamed(context, RoutesManager.onBoardingRoute);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }
}
