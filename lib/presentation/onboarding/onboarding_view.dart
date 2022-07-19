import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  late final List<SliderObject> _sliderList = _getSliderData();

  final PageController _pageController = PageController();

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

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        itemCount: _sliderList.length,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingItem(_sliderList[index]);
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
                  Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
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
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
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
                  _getPreviousPage(),
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
              for (int i = 0; i < _sliderList.length; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _getNextPage(),
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

  int _getPreviousPage() {
    int previousIndex = --_currentPageIndex;
    if (previousIndex == -1) {
      previousIndex = _sliderList.length - 1;
    }
    return previousIndex;
  }

  int _getNextPage() {
    int nextIndex = ++_currentPageIndex;
    if (nextIndex == _sliderList.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentPageIndex) {
      return SvgPicture.asset(ImageAssetsManager.hollowCircleIC);
    } else {
      return SvgPicture.asset(ImageAssetsManager.solidCircleIC);
    }
  }
}

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
