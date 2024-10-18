// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:provider/provider.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    _handleLoading(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 180.0, end: 420.0),
              duration: const Duration(milliseconds: 2400),
              curve: Curves.bounceOut,
              builder: (BuildContext context, double value, Widget? child) {
                return Image.asset(
                  AppImages.newLogo,
                  fit: BoxFit.fill,
                  width: value,
                );
              },
            ),
      ),
    );
  }

  Future<void> _handleLoading(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2500)).then(
      (value) {
        _readTokenAndNavigate(context);
      },
    );
  }

  Future<void> _readTokenAndNavigate(BuildContext context) async {
    try {
      String? token = await Utils().ReadToken();
      HomeProvider homeController =
          Provider.of<HomeProvider>(context, listen: false);
      LoginProvider loginProvider =
          Provider.of<LoginProvider>(context, listen: false);

      if (token != null && token.isNotEmpty) {
        bool profileLoaded = await loginProvider.getMyProfile(context);
        if (profileLoaded) {
          bool homePageLoaded =
              await homeController.callGetViewHomePageApi(context);
          if (homePageLoaded) {
            homeController.isLoading.value = false;
            Navigator.pushReplacementNamed(context, Routes.HOME);
          }
        }
      } else {
        Navigator.pushReplacementNamed(context, Routes.LOGIN);
      }
    } catch (e) {
      debugPrint("Error during loading: $e");
    }
  }
}
