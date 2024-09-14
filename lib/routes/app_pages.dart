import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/screens/additionalDetails/views/additional_details_view.dart';
import 'package:my_stackz/screens/airconServices/views/aircon_view.dart';
import 'package:my_stackz/screens/cartSummary/views/chart_summary_view.dart';
import 'package:my_stackz/screens/cleaning/views/cleaning_view.dart';
import 'package:my_stackz/screens/handyman/views/handyman_view.dart';
import 'package:my_stackz/screens/login/views/login_view.dart';
import 'package:my_stackz/screens/notifications/views/notification_two.dart';
import 'package:my_stackz/screens/notifications/views/notification_view.dart';
import 'package:my_stackz/screens/payments/views/payment_view.dart';
import 'package:my_stackz/screens/signUp/views/sign_up_view.dart';
import 'package:my_stackz/screens/splace_screen/splace.dart';
import '../screens/booking/views/booking_view.dart';
import '../screens/bookingAccepted/views/booking_accepted_view.dart';
import '../screens/bookingDetails/views/booking_details_view.dart';
import '../screens/bookingHomeCleaning/views/booking_home_cleaning_view.dart';
import '../screens/dateAndTime/views/date_and_time_view.dart';
import '../screens/home/views/home_view.dart';
import '../screens/selectAddress/views/select_address_view.dart';

part 'app_routes.dart';

class AppPages {
  static String? _lastRoute = "/";
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    _lastRoute = setting.name;
    switch (setting.name) {
      case Routes.SPLACE:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => SplaceScreen(),
        );
      case Routes.HOME:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const HomeView(),
        );
      case Routes.LOGIN:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => LoginView(),
        );
      case Routes.SIGN_UP:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const SignUpView(),
        );
      case Routes.CLEANING:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => CleaningView(),
        );
      case Routes.AIRCON_SERVICES:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => AirconView(),
        );
      case Routes.HANDYMAN:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => HandymanView(),
        );
      case Routes.ADDITIONAL_DETAILS:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const AdditionalDetailsView(),
        );
      case Routes.DATE_AND_TIME:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const DateAndTimeView(),
        );
      case Routes.BOOKING_DETAILS:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const BookingDetailsView(),
        );
      case Routes.BOOKING:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const BookingView(),
        );
      case Routes.BOOKING_HOME_CLEANING:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const BookingHomeCleaningView(),
        );
      case Routes.BOOKING_ACCEPTED:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const BookingAcceptedView(),
        );
      case Routes.PAYMENT:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const PaymentView(),
        );
      case Routes.CART_SUMMARY:
        final Map<String, dynamic> args =
            setting.arguments as Map<String, dynamic>;

        final Address selectedAddress = args["selectedAddress"] as Address;
        final String selectedTimeSlotId = args["selectedTimeSlotId"] as String;
        final DateTime selectedDate = args["selectedDate"] as DateTime;

        return MaterialPageRoute(
          settings: setting,
          builder: (_) => CartSummaryView(
            selectedAddress: selectedAddress,
            selectedTimeSlotId: selectedTimeSlotId,
            selectedDate: selectedDate,
          ),
        );
      case Routes.SELECT_ADDRESS:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => SelectAddressView(),
        );
      case Routes.NOTIFICATIONS:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => NotificationsView(),
        );
      case Routes.NOTIFICATIONS_TWO:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => NotificationTwo(),
        );
      default:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => LoginView(),
        );
    }
  }

  static String? get lastRoute => _lastRoute;
}
