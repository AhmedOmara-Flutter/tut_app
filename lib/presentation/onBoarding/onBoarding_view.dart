import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
          ),
          Image(
            image: AssetImage(ImageAssets.onBoardingLogo1),
          )
        ],
      ),
    );
  }
}
