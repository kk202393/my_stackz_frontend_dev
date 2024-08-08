// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/dialoge.dart';
import 'package:provider/provider.dart';

class SplaceScreen extends StatelessWidget {
  const SplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 350.0, end: 160.0),
                duration: const Duration(milliseconds: 3000),
                curve: Easing.standardAccelerate,
                builder: (BuildContext context, double value, Widget? child) {
                  return Image.asset(
                    AppImages.newLogo,
                    fit: BoxFit.fill,
                    width: value,
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FutureBuilder<void>(
              future: _handleLoading(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLoading(BuildContext context) async {
    // await Future.delayed(const Duration(milliseconds: 1500));
    await ReadToken(context);
  }

  Future ReadToken(BuildContext context) async {
    try {
      String? token = await Utils().ReadToken();
      HomeProvider homeController =
          Provider.of<HomeProvider>(context, listen: false);
      LoginProvider loginProvider =
          Provider.of<LoginProvider>(context, listen: false);
      if (token != null && token.isNotEmpty) {
        await loginProvider.getMyProfile().then(
          (value) async {
            if (value) {
              await homeController.callGetViewHomePageApi(context).then(
                (value) async {
                  if (value) {
                    homeController.isLoading.value = false;
                    Navigator.pushNamed(
                      context,
                      Routes.HOME,
                    );
                  }
                },
              );
            }
          },
        );
      } else {
        Navigator.pushNamed(context, Routes.LOGIN);
      }
    } catch (e) {
      print("Error during loading: $e");
    }
  }
}
