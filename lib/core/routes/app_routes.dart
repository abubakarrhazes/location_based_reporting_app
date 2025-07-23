import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/error/exceptions.dart';
import 'package:location_based_reporting_app/core/routes/routes_entry.dart';
import 'package:location_based_reporting_app/features/auth/views/login_screen.dart';
import 'package:location_based_reporting_app/features/auth/views/onboarding_screen.dart';
import 'package:location_based_reporting_app/features/auth/views/splash_screen.dart';
import 'package:location_based_reporting_app/features/main/dash_board_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesEntry.loginAccount:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesEntry.initialRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesEntry.createAccount:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

      case RoutesEntry.dashBoardScreen:
        return MaterialPageRoute(builder: (context) => DashboardScreen());

      default:
        throw RouteException('Route Not Found');
    }
  }
}
