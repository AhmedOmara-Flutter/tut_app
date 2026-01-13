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

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.currentIndex,
    required this.numOfSlides,
  });
}
