import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_stackz/api/fcm_service.dart';
import 'package:my_stackz/firebase_options.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/additionalDetails/provider/additional_details_provider.dart';
import 'package:my_stackz/screens/airconServices/provider/aircon_provider.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/cartSummary/provider/chart_summary_provider.dart';
import 'package:my_stackz/screens/cleaning/provider/cleaning_provider.dart';
import 'package:my_stackz/screens/dateAndTime/provider/date_and_time_provider.dart';
import 'package:my_stackz/screens/handyman/provider/handyman_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/screens/payments/provider/payment_Provider.dart';
import 'package:my_stackz/screens/selectAddress/provider/select_address_provider.dart';
import 'package:my_stackz/screens/signUp/provider/sign_up_Provider.dart';
import 'package:provider/provider.dart';

import 'themes/themes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: 'AIzaSyDZ-paolYuS-KMUqv9IfTJ0LPm4Kjk_5kA',
  //         appId: '1:892441686585:android:0b4d06d1f4dcdde13793e8',
  //         messagingSenderId: '892441686585',
  //         projectId: 'mystackz-2a351'));
  // initializeSettings();
  // await FirebaseApi().initNotifications();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

// void initializeSettings() async {
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true, sound: true, badge: true);
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   const AndroidInitializationSettings androidInitializationSettings =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   const DarwinInitializationSettings darwinInitializationSettings =
//       DarwinInitializationSettings();
//   const InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: darwinInitializationSettings);
//   flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }

class MyStackz extends StatefulWidget {
  const MyStackz({super.key});

  @override
  State<MyStackz> createState() => _MyStackzState();
}

class _MyStackzState extends State<MyStackz> {
  late bool? token;
  final FcmService _fcmService = FcmService();

  @override
  void initState() {
    super.initState();
    // token = false;
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) async {
    //     token = await Utils().userInitialRoute();
    //     // if (token != null && token!) {
    //     //   Navigator.pushNamed(context, Routes.HOME);
    //     // } else {
    //     //   Navigator.pushNamed(context, Routes.LOGIN);
    //     // }
    //   },
    // );
    _fcmService.initialize(context);
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
          initialRoute: Routes.SPLACE,
          // initialRoute: token! ? Routes.HOME : Routes.LOGIN,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          onGenerateRoute: AppPages.generateRoutes,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [],
          navigatorKey: navigatorKey,
          builder: (context, child) {
            return Stack(children: [
              MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1)),
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
