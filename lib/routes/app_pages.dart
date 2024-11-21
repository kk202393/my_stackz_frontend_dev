import 'package:flutter/material.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/screens/additionalDetails/views/additional_details_view.dart';
import 'package:my_stackz/screens/airconServices/views/aircon_view.dart';
import 'package:my_stackz/screens/cartSummary/views/chart-summary-new.dart';
import 'package:my_stackz/screens/emailverification/views/emailverification.dart';
import 'package:my_stackz/screens/forgetpassword/view/forgetpassword.dart';
import 'package:my_stackz/screens/googleMap/view/google_map.dart';
import 'package:my_stackz/screens/handyman/views/handyman_view.dart';
import 'package:my_stackz/screens/home_provider_screen/views/home_provider_screen_view.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/screens/login/views/login_view.dart';
import 'package:my_stackz/screens/myProfile/views/myprofile_view.dart';
import 'package:my_stackz/screens/payments/views/payment_view.dart';
import 'package:my_stackz/screens/provider_screen/views/provider_screen.dart';
import 'package:my_stackz/screens/setting/views/setting_screen.dart';
import 'package:my_stackz/screens/signUp/views/sign_up_view.dart';
import 'package:my_stackz/screens/splace_screen/splace.dart';
import 'package:my_stackz/widgets/subCatWidget.dart';
import 'package:provider/provider.dart';

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
          builder: (context) {
            LoginProvider loginProvider =
                Provider.of<LoginProvider>(context, listen: false);
            final userRole =
                loginProvider.logInAPIResponse?.user?.userRole ?? 1;
            Widget targetView;

            switch (userRole) {
              case 1:
                targetView = const HomeView();
                break;
              // case 2:
              //   targetView = const AdminDashboardView();
              //   break;
              case 3:
                targetView = const HomeProviderScreen();
                break;
              default:
                targetView = const HomeView();
                break;
            }

            return targetView;
          },
        );
      // case Routes.HOME:
      //   return MaterialPageRoute(
      //     settings: setting,
      //     builder: (_) => const HomeView(),
      //   );
      // case Routes.HOME_PROVIDER:
      //   return MaterialPageRoute(
      //     settings: setting,
      //     builder: (_) => const HomeProvider(),
      //   );
      case Routes.LOGIN:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => LoginView(),
        );
          case Routes.SETTINGS:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => SettingsScreen(),
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
          builder: (_) => SubCatView(
            list: arguments["itemList"],
            onTap: () {},
            imgList: arguments["imgPath"],
            pageTitle: arguments["titleName"],
          ),
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
         case Routes.MY_PROFILE:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const MyProfileView(),
        );
          case Routes.FORGOT_PASSWORD:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const ForgetPassword(),
        );
         case Routes.EMAIL_VERIFICATION:
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => const Emailverification(),
        );
      case Routes.CART_SUMMARY:
        final Map<String, dynamic> args =
            setting.arguments as Map<String, dynamic>;

        final Address selectedAddress = args["selectedAddress"] as Address;
        final String selectedTimeSlotId = args["selectedTimeSlotId"] as String;
        // final DateTime selectedDate = args["selectedDate"] as DateTime;

        return MaterialPageRoute(
          settings: setting,
          builder: (_) => CartSummaryView(
            selectedAddress: selectedAddress,
            selectedTimeSlotId: selectedTimeSlotId,
            // selectedDate: selectedDate,
          ),
        );
      case Routes.SELECT_ADDRESS:
        final arguments = setting.arguments as Map<String, dynamic>;
        final String? selectedSlotId =
            arguments['selectedTimeSlotId'] as String;
        final String? selectedDate = arguments['selectedDate'] as String;
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => SelectAddressView(
            selectedTimeSlotId: arguments['selectedTimeSlotId'],
            selectedDate: arguments['selectedDate'],
          ),
        );
      case Routes.GOOGLE_MAP:
        final arguments = setting.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: setting,
          builder: (_) => GoogleMapView(
            streamController: arguments["streamController"],
            position: arguments["position"],
          ),
        );
      case Routes.PROVIDER_SCREEN:
        final Map<String, dynamic> arguments =
            setting.arguments as Map<String, dynamic>;

        final String? requestId = arguments["requestId"] as String?;
        final String? userName = arguments["userName"] as String?;

        return MaterialPageRoute(
          settings: setting,
          builder: (_) => ProviderScreen(
            requestId: requestId,
            userName: userName,
          ),
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
