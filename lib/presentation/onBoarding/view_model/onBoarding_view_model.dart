import 'package:tut_app/app/app_imports.dart';


class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
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
    inputSliderObject.add(
      SliderViewObject(
        sliderObject: _list[currentIndex],
        currentIndex: currentIndex,
        numOfSlides: _list.length,
      ),
    );
  }
}

mixin OnBoardingViewModelInputs {
  int goNext();

  int goPrevious();

  void onPageChanged(int index);

  Sink get inputSliderObject;
}

mixin OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outPutSliderObject;
}
