import 'dart:async';

import '../../../domain/model/models.dart';
import '../../base/base_view_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with BaseViewModelInputs, BaseViewModelOutputs {
  final StreamController _streamController = StreamController();
  int currentIndex = 0;

  late final List<SliderObject> _list;

  @override
  void start() {
    _list = _getSliderData();
    postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    // TODO: implement goNext
    int nextIndex = ++currentIndex;
    if (nextIndex == _list.length) {
      return nextIndex = 0;
    } else {
      return nextIndex;
    }
  }

  @override
  int goPrevious() {
    int previousIndex = --currentIndex;
    if (previousIndex == -1) {
      return _list.length - 1;
    } else {
      return previousIndex;
    }
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    postDataToView();
  }

  @override
  Sink<dynamic> get inputSliderObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outPutSliderObject =>
      _streamController.stream.map((slider) => slider);

  //private function
  List<SliderObject> _getSliderData() => [
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

  void postDataToView() {
    _streamController.add(
      SliderViewObject(
        sliderObject: _list[currentIndex],
        currentIndex: currentIndex,
        numOfSlides: _list.length,
      ),
    );
  }
}

mixin BaseViewModelInputs {
  int goNext();

  int goPrevious();

  void onPageChanged(int index);

  Sink get inputSliderObject;
}

mixin BaseViewModelOutputs {
  Stream<SliderViewObject> get outPutSliderObject;
}
