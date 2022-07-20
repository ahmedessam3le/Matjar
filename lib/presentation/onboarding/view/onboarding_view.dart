import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matjar/domain/models.dart';
import 'package:matjar/presentation/onboarding/view_model/onboarding_view_model.dart';
import 'package:matjar/presentation/resources/assets_manager.dart';
import 'package:matjar/presentation/resources/color_manager.dart';
import 'package:matjar/presentation/resources/constants_manager.dart';
import 'package:matjar/presentation/resources/routes_manager.dart';
import 'package:matjar/presentation/resources/strings_manager.dart';
import 'package:matjar/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.sliderViewObjectOutput,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorManager.whiteColor,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.whiteColor,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.slidesLength,
          onPageChanged: (index) {
            _viewModel.onSlideChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingItem(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.primaryColor),
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goToPreviousSlide(),
                  duration:
                      Duration(milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut,
                );
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssetsManager.leftArrowIC),
              ),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.slidesLength; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child:
                      _getProperCircle(i, sliderViewObject.currentSlideIndex),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goToNextSlide(),
                  duration:
                      Duration(milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut,
                );
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssetsManager.rightArrowIC),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentSlideIndex) {
    if (index == currentSlideIndex) {
      return SvgPicture.asset(ImageAssetsManager.hollowCircleIC);
    } else {
      return SvgPicture.asset(ImageAssetsManager.solidCircleIC);
    }
  }
}

class OnBoardingItem extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingItem(
    this._sliderObject, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              _sliderObject.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              _sliderObject.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(height: AppSize.s60),
          SvgPicture.asset(_sliderObject.image),
        ],
      ),
    );
  }
}
