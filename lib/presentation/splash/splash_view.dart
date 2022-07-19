import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matjar/presentation/resources/assets_manager.dart';
import 'package:matjar/presentation/resources/color_manager.dart';
import 'package:matjar/presentation/resources/constants_manager.dart';
import 'package:matjar/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _goNext() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  _startDelay() {
    _timer = Timer(Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: Image(
          image: AssetImage(
            ImageAssetsManager.splashLogo,
          ),
        ),
      ),
    );
  }
}
