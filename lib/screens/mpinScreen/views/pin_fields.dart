// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/dialoge.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:smart_auth/smart_auth.dart';

class PinputExample extends StatefulWidget {
  const PinputExample({Key? key}) : super(key: key);

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();

    /// In case you need an SMS autofill feature
    smsRetriever = SmsRetrieverImpl(
      SmartAuth(),
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppColors.philippineOrange;
    const fillColor = AppColors.white;
    const borderColor = AppColors.primaryButtonColor;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              smsRetriever: smsRetriever,
              controller: pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                final intValue = int.tryParse(value);
                if (intValue == null) {
                  return 'Please enter a valid integer';
                }
                return null; // Input is valid
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) async {
                HomeProvider homeController =
                    Provider.of(context, listen: false);
                String? mpin = await Utils().ReadMPIN() ?? "";
                if (mpin.trim().isEmpty) {
                  Utils().storeMPIN(pin);
                  bool another =
                      await homeController.callGetViewHomePageApi(context);
                  homeController.isLoading.value = false;
                  if (another) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.HOME,
                      (route) => false,
                    );
                  }
                } else {
                  if (mpin.trim() == pin.trim()) {
                    bool another =
                        await homeController.callGetViewHomePageApi(context);
                    homeController.isLoading.value = false;
                    if (another) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.HOME,
                        (route) => false,
                      );
                    }
                  } else {
                    homeController.isLoading.value = false;
                    String msg = "Invalid Mpin";
                    DialogHelper().showSnackBar(
                      context: context,
                      msg: msg,
                      backgroundColor: Colors.red.shade600,
                    );
                    homeController.isLoading.value = false;
                  }
                }
              },
              onChanged: (value) {
                // debugPrint('onChanged: $value');
              },
              // cursor: Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       margin: const EdgeInsets.only(bottom: 9),
              //       width: 22,
              //       height: 1,
              //       color: focusedBorderColor,
              //     ),
              //   ],
              // ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: AppColors.chromeYellow),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // TextButton(
          //   onPressed: () {
          //     focusNode.unfocus();
          //     formKey.currentState!.validate();
          //   },
          //   child: const Text(
          //     'Validate',
          //     style: TextStyle(
          //       color: AppColors.selectiveYellow,
          //       fontSize: 18,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final signature = await smartAuth.getAppSignature();
    debugPrint('App Signature: $signature');
    final res = await smartAuth.getSmsCode(
      useUserConsentApi: true,
    );
    if (res.succeed && res.codeFound) {
      return res.code!;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}
