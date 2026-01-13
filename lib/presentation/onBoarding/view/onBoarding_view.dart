import 'package:flutter/material.dart';
import 'package:tut_app/presentation/onBoarding/view_model/onBoarding_view_model.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manger.dart';
import 'package:tut_app/presentation/resources/constants_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/string_manager.dart';
import 'package:tut_app/presentation/resources/style_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';
import '../../../domain/models.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.outPutSliderObject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getContentWidget(snapshot.data!);
        }
        return Scaffold(
          body: Center(child: Text(StringManager.somethingWentWrong)),
        );
      },
    );
  }

  Widget getContentWidget(SliderViewObject sliderViewObject) {
    return Scaffold(
      bottomSheet: Container(
        color: ColorManger.white,
        child: Column(
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
            _getBottomSheetWidget(sliderViewObject),
          ],
        ),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) =>
            OnBoardingObject(sliderObject: sliderViewObject.sliderObject),
        controller: _pageController,
        onPageChanged: (index) {
          _viewModel.onPageChanged(index);
        },
        itemCount: sliderViewObject.numOfSlides,
      ),
    );
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      height: AppSizeManager.s70,
      color: ColorManger.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goPrevious(),
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
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPaddingManager.p8),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goNext(),
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

  Widget _getProperCircle(int index, int currentIndex) {
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

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
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
