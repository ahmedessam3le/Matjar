class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class SliderViewObject {
  SliderObject sliderObject;
  int slidesLength;
  int currentSlideIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.slidesLength,
    required this.currentSlideIndex,
  });
}
