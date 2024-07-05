import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/airconServices/provider/aircon_provider.dart';
import 'package:my_stackz/screens/cartSummary/provider/chart_summary_provider.dart';
import 'package:my_stackz/screens/cleaning/provider/cleaning_provider.dart';
import 'package:my_stackz/screens/handyman/provider/handyman_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/screens/payments/provider/payment_Provider.dart';
import 'package:my_stackz/screens/signUp/provider/sign_up_Provider.dart';


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
      ),ChangeNotifierProvider(
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

    ], child: const MyStackz()),
  );
}

class MyStackz extends StatelessWidget {
  const MyStackz({super.key});

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
          initialRoute: Routes.LOGIN,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          onGenerateRoute: AppPages.generateRoutes,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [],
          builder: (context, child) {
            return Stack(children: [
              MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
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

  // Widget build(BuildContext context) {
  //   return GetMaterialApp(
  //     title: "Application",
  //     initialRoute: AppPages.INITIAL,
  //     getPages: AppPages.routes,
  //     debugShowCheckedModeBanner: false,
  //     theme: Themes().lightTheme,
  //     darkTheme: Themes().darkTheme,
  //     themeMode: ThemeService().getThemeMode(),
  //   );
  // }
}
