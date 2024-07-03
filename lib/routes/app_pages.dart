import 'package:flutter/material.dart';
import 'package:my_stackz/screens/additionalDetails/views/additional_details_view.dart';
import 'package:my_stackz/screens/airconServices/views/aircon_view.dart';
import 'package:my_stackz/screens/cleaning/views/cleaning_view.dart';
import 'package:my_stackz/screens/handyman/views/handyman_view.dart';
import 'package:my_stackz/screens/login/views/login_view.dart';
import 'package:my_stackz/screens/signUp/views/sign_up_view.dart';
import '../screens/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static String? _lastRoute = "/";
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    _lastRoute = setting.name;
    switch (setting.name) {
      case Routes.HOME:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const HomeView(),
        );
      case Routes.LOGIN:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const LoginView(),
        );
      case Routes.SIGN_UP:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const SignUpView(),
        );
      case Routes.CLEANING:
        final arguments = setting.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => CleaningView(categoryID: arguments["subcategories"]),
        );


       
      case Routes.AIRCON_SERVICES:
        final arguments = setting.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => AirconView(categoryID: arguments["subcategories"]),
        );
      case Routes.HANDYMAN:
        final arguments = setting.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => HandymanView(categoryID: arguments["subcategories"]),
        );

      case Routes.ADDITIONAL_DETAILS:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const AdditionalDetailsView(),
        );
      case Routes.DATE_AND_TIME:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const AdditionalDetailsView(),
        );
      default:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const LoginView(),
        );
    }
  }

  static String? get lastRoute => _lastRoute;
}
