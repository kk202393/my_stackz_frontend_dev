// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/utils/input_validator.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/app_form_field.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/dialoge.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../../../utils/utils.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LoginProvider controller =
        Provider.of<LoginProvider>(context, listen: false);

    return Consumer<HomeProvider>(
      builder:
          (BuildContext context, HomeProvider homeController, Widget? child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: ValueListenableBuilder(
              valueListenable: homeController.isLoading,
              builder: (BuildContext context, value, Widget? child) {
                return Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(children: [
                          InkWell(
                            onTap: () {
                              homeController
                                  .callLogoutApi(context)
                                  .then((value) {
                                if (value) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.LOGIN,
                                    (route) => false,
                                  );
                                } else {}
                              });
                            },
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.logout,
                                  color: AppColors.brandeisblue, size: 30),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImages.newLogo,
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppFormField(
                                  controller: controller.emailController,
                                  hintText: StringConstants.enterEmail,
                                  validator: (value) =>
                                      InputValidator.isValidEmail(value),
                                ),
                                const SizedBox(height: 20),
                                AppFormField(
                                  controller: controller.passwordController,
                                  obscureText: controller.obscureText.value,
                                  hintText: StringConstants.enterPassword,
                                  onTapSuffixIcon: () =>
                                      controller.onChangePasswordVisibility(),
                                  validator: (value) =>
                                      InputValidator.validateFields(
                                          "password", value),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () =>
                                            controller.onClickRememberMe(),
                                        child: Icon(
                                            controller.rememberMe.value
                                                ? Icons.check_box_outlined
                                                : Icons.check_box_outline_blank,
                                            size: 15),
                                      ),
                                      const SizedBox(width: 7),
                                      TextWidget(
                                          text: StringConstants.rememberMe,
                                          style: context.bodySmall),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.FORGOT_PASSWORD);
                                        },
                                        child: TextWidget(
                                            text:
                                                StringConstants.forgotPassword,
                                            style: context.bodySmall),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 50),
                                ButtonWidget(
                                  buttonText: StringConstants.login,
                                  onTap: () async {
                                    homeController.isLoading.value = true;

                                    bool _isSuccess =
                                        await controller.validateFields(
                                            formKey, homeController, context);
                                    if (_isSuccess) {
                                      bool another = await homeController
                                          .callGetViewHomePageApi(context);

                                      homeController.isLoading.value = false;

                                      if (another) {
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          Routes.HOME,
                                          (route) => false,
                                        );
                                      } else {
                                        String msg = "Failed to fetch data";
                                        DialogHelper().showSnackBar(
                                          context: context,
                                          msg: msg,
                                          backgroundColor: Colors.red.shade600,
                                        );
                                      }
                                    } else {
                                      homeController.isLoading.value = false;
                                    }
                                  },
                                ),

                                // ButtonWidget(
                                //   buttonText: StringConstants.login,
                                //   onTap: () async {
                                //     homeController.isLoading.value = true;
                                //     bool isSuccess =
                                //         await controller.validateFields(
                                //             formKey, homeController);
                                //     if (isSuccess) {
                                //       bool another = await homeController
                                //           .callGetViewHomePageApi(context);
                                //       homeController.isLoading.value = false;
                                //       if (another) {
                                //         Navigator.pushNamed(
                                //             context, Routes.HOME);
                                //       } else {
                                //         String msg = "Failed to fetch data";
                                //         DialogHelper().showSnackBar(
                                //           context: context,
                                //           msg: msg,
                                //           backgroundColor: Colors.red.shade600,
                                //         );
                                //       }
                                //     } else {
                                //       homeController.isLoading.value = false;
                                //       String msg = "Validation failed";
                                //       DialogHelper().showSnackBar(
                                //         context: context,
                                //         msg: msg,
                                //         backgroundColor: Colors.red.shade600,
                                //       );
                                //     }
                                //   },
                                // ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: StringConstants.notHaveAccount,
                                  style: context.titleMedium,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "${StringConstants.signUp}!",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context, Routes.SIGN_UP);
                                          },
                                        style: context.titleMedium.copyWith(
                                            color: AppColors.cyanBlue,
                                            fontWeight: FontWeight.w700)),
                                  ])),
                          const SizedBox(height: 20)
                        ])),
                    const SizedBox(height: 20),
                    homeController.isLoading.value
                        ? Utils.getLoadingUI(context)
                        : const SizedBox(),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
