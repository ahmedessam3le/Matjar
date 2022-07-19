import 'package:flutter/material.dart';
import 'package:matjar/presentation/forgot_password/forgot_password_view.dart';
import 'package:matjar/presentation/home/home_view.dart';
import 'package:matjar/presentation/login/login_view.dart';
import 'package:matjar/presentation/onboarding/onboarding_view.dart';
import 'package:matjar/presentation/register/register_view.dart';
import 'package:matjar/presentation/resources/strings_manager.dart';
import 'package:matjar/presentation/splash/splash_view.dart';
import 'package:matjar/presentation/store_details/store_details_view.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/home';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => SplashView());

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());

      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());

      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.noRouteFound),
          ),
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        );
      },
    );
  }
}
