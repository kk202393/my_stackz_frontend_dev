import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/additionalDetails/provider/additional_details_provider.dart';
import 'package:my_stackz/screens/airconServices/provider/aircon_provider.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/bookingDetails/provider/booking_details_provider.dart';
import 'package:my_stackz/screens/cartSummary/provider/chart_summary_provider.dart';
import 'package:my_stackz/screens/cleaning/provider/cleaning_provider.dart';
import 'package:my_stackz/screens/dateAndTime/provider/date_and_time_provider.dart';
import 'package:my_stackz/screens/handyman/provider/handyman_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/screens/payments/provider/payment_Provider.dart';
import 'package:my_stackz/screens/selectAddress/provider/select_address_provider.dart';
import 'package:my_stackz/screens/signUp/provider/sign_up_Provider.dart';
import 'package:my_stackz/utils/utils.dart';

import 'package:provider/provider.dart';
import 'themes/themes.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => CleaningProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => AirconProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => HandymanProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => PaymentProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => CartSummaryProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => AdditionalDetailsProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => DateAndTimeProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => SelectAddressProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => BookingProvider(),
        lazy: true,
      ),
    ], child: const MyStackz()),
  );
}

class MyStackz extends StatefulWidget {
  const MyStackz({super.key});

  @override
  State<MyStackz> createState() => _MyStackzState();
}

class _MyStackzState extends State<MyStackz> {
  late bool? token;
  @override
  void initState() {
    super.initState();
    token = false;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        token = await Utils().userInitialRoute();
        if (token != null && token!) {
          Navigator.pushNamed(context, Routes.HOME);
        } else {
          Navigator.pushNamed(context, Routes.LOGIN);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      builder: (context, child) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
        ));
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [
            SystemUiOverlay.top,
          ],
        );
        return MaterialApp(
          // showPerformanceOverlay: true,
          title: "Application",
          initialRoute: token! ? Routes.HOME : Routes.LOGIN,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          onGenerateRoute: AppPages.generateRoutes,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [],
          builder: (context, child) {
            return Stack(children: [
              MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1)),
                child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: child),
              ),
            ]);
          },
        );
      },
    );
  }
}
