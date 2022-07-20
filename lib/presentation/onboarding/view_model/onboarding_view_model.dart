import 'dart:async';

import 'package:matjar/domain/models.dart';
import 'package:matjar/presentation/base/base_view_model.dart';
import 'package:matjar/presentation/resources/assets_manager.dart';
import 'package:matjar/presentation/resources/strings_manager.dart';

abstract class OnBoardingViewModelInputs {
  int goToPreviousSlide();
  int goToNextSlide();
  void onSlideChanged(int index);

  Sink get sliderViewObjectInput;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get sliderViewObjectOutput;
}

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _sliderList;
  int _currentSlideIndex = 0;

  @override
  void start() {
    _sliderList = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goToNextSlide() {
    int nextIndex = ++_currentSlideIndex;
    if (nextIndex == _sliderList.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goToPreviousSlide() {
    int previousIndex = --_currentSlideIndex;
    if (previousIndex == -1) {
      previousIndex = _sliderList.length - 1;
    }
    return previousIndex;
  }

  @override
  void onSlideChanged(int index) {
    _currentSlideIndex = index;
    _postDataToView();
  }

  @override
  Sink get sliderViewObjectInput => _streamController.sink;

  @override
  Stream<SliderViewObject> get sliderViewObjectOutput =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObject> _getSliderData() {
    return [
      SliderObject(
        title: AppStrings.onBoardingFirstTitle,
        subTitle: AppStrings.onBoardingFirstSubTitle,
        image: ImageAssetsManager.onBoardingFirstLogo,
      ),
      SliderObject(
        title: AppStrings.onBoardingSecondTitle,
        subTitle: AppStrings.onBoardingSecondSubTitle,
        image: ImageAssetsManager.onBoardingSecondLogo,
      ),
      SliderObject(
        title: AppStrings.onBoardingThirdTitle,
        subTitle: AppStrings.onBoardingThirdSubTitle,
        image: ImageAssetsManager.onBoardingThirdLogo,
      ),
      SliderObject(
        title: AppStrings.onBoardingFourthTitle,
        subTitle: AppStrings.onBoardingFourthSubTitle,
        image: ImageAssetsManager.onBoardingFourthLogo,
      ),
    ];
  }

  void _postDataToView() {
    sliderViewObjectInput.add(
      SliderViewObject(
        sliderObject: _sliderList[_currentSlideIndex],
        slidesLength: _sliderList.length,
        currentSlideIndex: _currentSlideIndex,
      ),
    );
  }
}
