import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manger.dart';
import 'package:tut_app/presentation/resources/constants_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/string_manager.dart';
import 'package:tut_app/presentation/resources/style_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<SliderObject> _list = _getSliderData();

  static List<SliderObject> _getSliderData() => [
    SliderObject(
      title1: StringManager.onBoardingTitle1,
      title2: StringManager.onBoardingSubTitle1,
      image: ImageAssets.onBoardingLogo1,
    ),
    SliderObject(
      title1: StringManager.onBoardingTitle2,
      title2: StringManager.onBoardingSubTitle2,
      image: ImageAssets.onBoardingLogo2,
    ),
    SliderObject(
      title1: StringManager.onBoardingTitle3,
      title2: StringManager.onBoardingSubTitle3,
      image: ImageAssets.onBoardingLogo3,
    ),
    SliderObject(
      title1: StringManager.onBoardingTitle4,
      title2: StringManager.onBoardingSubTitle4,
      image: ImageAssets.onBoardingLogo4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: ColorManger.white,
       // height: AppSizeManager.s120,
        child: Column(
          //todo  height انا هنا حذفت
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPaddingManager.p8,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    StringManager.skip,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesManager.loginRoute,
                    );
                  },
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) =>
            OnBoardingObject(sliderObject: _list[index] ),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: _list.length,
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      height: AppSizeManager.s70,
      color: ColorManger.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _getPreviousIndex(),
                duration: Duration(
                  microseconds: AppConstants.sliderAnimationTime,
                ),
                curve: Curves.bounceInOut,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(AppPaddingManager.p12),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: AppSizeManager.s20,
                color: ColorManger.white,
              ),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPaddingManager.p8),
                  child: _getProperCircle(i),
                ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _getNextIndex(),
                duration: Duration(
                  microseconds: AppConstants.sliderAnimationTime,
                ),
                curve: Curves.bounceInOut,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(AppPaddingManager.p12),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: AppSizeManager.s20,
                color: ColorManger.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index) {
    if (index == currentIndex) {
      return Icon(
        Icons.circle_outlined,
        size: AppSizeManager.s12,
        color: ColorManger.white,
      );
    } else {
      return Icon(
        Icons.circle,
        size: AppSizeManager.s12,
        color: ColorManger.white,
      );
    }
  }

  int _getPreviousIndex() {
    //todo خلي يالك انا عملت -- قبل عشان مطغطش مرتين عشان يروح للزرار الي بعده انا كده بقوله اطرح واستخدمه دلوقتي
    int previousIndex = --currentIndex;
    if (previousIndex == -1) {
      return _list.length - 1;
    } else {
      return previousIndex;
    }
  }
  int _getNextIndex() {
    //todo
    int nextIndex = ++currentIndex;
    if (nextIndex == _list.length) {
      return nextIndex=0;
    } else {
      return nextIndex;
    }
  }
}

class OnBoardingObject extends StatelessWidget {
  final SliderObject sliderObject;

  const OnBoardingObject({super.key, required this.sliderObject});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSizeManager.s170),
        Padding(
          padding: const EdgeInsets.all(AppSizeManager.s8),
          child: Text(
            sliderObject.title1,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSizeManager.s8),
          child: Text(
            sliderObject.title2,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppSizeManager.s60),
        Image.asset(sliderObject.image, fit: BoxFit.cover),
      ],
    );
  }
}

class SliderObject {
  final String title1;
  final String title2;
  final String image;

  SliderObject({
    required this.title1,
    required this.title2,
    required this.image,
  });
}
