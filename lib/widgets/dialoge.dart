import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/bottom_sheet_widget.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

void closeBox(BuildContext context) {
  Navigator.pop(context);
}

class DialogHelper {
  void onLoading(BuildContext context) {
    final HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    Provider.of<Route>(context, listen: false);

    if (true) {
      if (!homeProvider.isLoading.value) {
        homeProvider.isLoading.value = true;
        // Provider.of<HomeProvider>(context, listen: false)
        //     .setIsLoadingDialogOpened(true);
        showDialog(
          context: context,
          routeSettings: const RouteSettings(name: '/loading'),
          barrierDismissible: false,
          builder: (BuildContext context) {
            systemOverlayDesign(AppColors.black.withOpacity(0.1));
            return Scaffold(
              backgroundColor: AppColors.black.withOpacity(0.1),
              //  backgroundColor: Colors.transparent,
              body: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 100.0, end: 135000.0),
                duration: const Duration(seconds: 4800),
                builder: (BuildContext context, double value, Widget? child) {
                  return Center(
                    child: Transform.rotate(
                      angle: (math.pi * value) / 12,
                      child: Image.asset(
                        AppImages.cleaningBanner,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
        // .then((_) {
        //   isLoadingDialogOpened.value = false;
        // });
      }
    }
  }

  // List<Route> poppedRoutes = [];
//     if (isLoadingDialogOpened.value) {
//       Navigator.of(context, rootNavigator: true).popUntil((route) {
//         bool isNotLoader = ((route.setti ngs.name != "/loading") &&
//             (Navigator.of(context, rootNavigator: true).canPop()));
//         poppedRoutes.add(route);
//         return isNotLoader;
//       });
//       if (Navigator.of(context, rootNavigator: true).canPop()) {
//         Navigator.of(context, rootNavigator: true).pop(context);
//       }
//       for (var proute in poppedRoutes.reversed) {
//         Navigator.pushNamed(context, proute.settings.name ?? "/",
//             arguments: proute.settings.arguments);
//       }
//       isLoadingDialogOpened.value = false;
//     }

  void successNotificationBar(
      {required BuildContext context,
      required String msg,
      String? title,
      IconData iconData = Icons.info,
      Color? backgroundColor,
      bool isDialog = true,
      Function? f}) {
    showDialog(
      context: context,
      routeSettings: const RouteSettings(name: '/alertDialog'),
      builder: (BuildContext context) {
        if (msg.isEmpty) {
          msg = "something went wrong";
        }
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          title: Center(child: title != null ? TextWidget(text: title) : null),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 20.0, end: 80.0),
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceOut,
                  builder: (BuildContext context, double value, Widget? child) {
                    return Image.asset(
                      AppImages.alert,
                      width: 45,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              TextWidget(
                text: msg,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Center(
              child: ButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                  if (f != null) {
                    f();
                  }
                },
                buttonText: 'ok',
              ),
            ),
          ],
        );
      },
    );
  }

  void pendingNotificationBar(
      {required BuildContext context,
      required String msg,
      String? title,
      IconData iconData = Icons.info,
      Color? backgroundColor,
      bool isDialog = true,
      Function? f}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (msg.isEmpty) {
          msg = "somethingWentWrong";
        }
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 20.0, end: 80.0),
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceOut,
                  builder: (BuildContext context, double value, Widget? child) {
                    return Image.asset(
                      AppImages.acRepair,
                      // color: AColors.yellowOrange,
                      width: value,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              TextWidget(
                text: msg.split("-")[0],
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Center(
              child: ButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                  if (f != null) {
                    f();
                  }
                },
                buttonText: 'ok',
                // width: MediaQuery.of(context).size.width * 0.4,
                // label: AppLocalizations.of(context)!.ok,
                // fontSize: 18,
                // fontWeight: FontWeight.w700,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> permissionNotificationBarForMultiLap(
      {required BuildContext context,
      required String msg,
      String? title,
      IconData iconData = Icons.info,
      Color? backgroundColor,
      bool? isCrossShown,
      bool isDialog = true,
      Function? yesFunction,
      Function? noFunction,
      bool barrierDismissible = false,
      void Function(BuildContext) onCrossClicked = closeBox,
      String? yesLabel,
      String? noLabel}) async {
    final Completer<void> completer = Completer<void>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (msg.isEmpty) {
            msg = "somethingWentWrong";
          }
          return AlertDialog(
            surfaceTintColor: AppColors.white,
            // title: Center(child: title != null ? TextWidget(label: title) : null),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        onCrossClicked(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gray.withOpacity(0.1),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 10.0, end: 60.0),
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceOut,
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Image.asset(
                        AppImages.acRepair,
                        // color: AColors.water,
                        width: value,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                TextWidget(
                  text: msg,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  ButtonWidget(
                    buttonText: "",
                    onTap: () async {
                      Navigator.pop(context);
                      if (noFunction != null) {
                        await noFunction();
                      }
                    },
                    // width: MediaQuery.of(context).size.width * 0.25,
                    // label: noLabel ?? AppLocalizations.of(context)!.prsNo,
                    // fontSize: 18,
                    // borderColor: AColors.sunsetOrange,
                    // buttonColor: AColors.sunsetOrange,
                    // fontWeight: FontWeight.w700,
                  ),
                  ButtonWidget(
                    buttonText: "",
                    // padding: const EdgeInsets.all(6),
                    onTap: () async {
                      Navigator.pop(context);
                      if (yesFunction != null) {
                        await yesFunction();
                      }
                      completer.complete();
                    },
                    // width: MediaQuery.of(context).size.width * 0.25,
                    // label: yesLabel ?? AppLocalizations.of(context)!.prsYes,
                    // fontSize: 18,
                    // fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          );
        },
        barrierDismissible: barrierDismissible);
    return completer.future;
  }

  void permissionNotificationBar(
      {required BuildContext context,
      required String msg,
      String? title,
      IconData iconData = Icons.info,
      Color? backgroundColor,
      bool? isCrossShown,
      bool isDialog = true,
      Function? yesFunction,
      Function? noFunction,
      bool barrierDismissible = true,
      void Function(BuildContext) onCrossClicked = closeBox,
      String? yesLabel,
      String? noLabel}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (msg.isEmpty) {
            msg = "somethingWentWrong";
          }
          return AlertDialog(
            surfaceTintColor: AppColors.white,
            // title: Center(child: title != null ? TextWidget(label: title) : null),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        onCrossClicked(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gray.withOpacity(0.1),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 10.0, end: 60.0),
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceOut,
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Image.asset(
                        AppImages.acRepair,
                        // color: AColors.water,
                        width: value,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                TextWidget(
                  text: msg,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  ButtonWidget(
                    buttonText: "ok",
                    onTap: () {
                      Navigator.pop(context);
                      if (noFunction != null) {
                        noFunction();
                      }
                    },
                    // width: MediaQuery.of(context).size.width * 0.25,
                    // label: noLabel ?? AppLocalizations.of(context)!.prsNo,
                    // fontSize: 18,
                    // borderColor: AColors.sunsetOrange,
                    // buttonColor: AColors.sunsetOrange,
                    // fontWeight: FontWeight.w700,
                  ),
                  ButtonWidget(
                    // padding: const EdgeInsets.all(6),
                    onTap: () {
                      Navigator.pop(context);
                      if (yesFunction != null) {
                        yesFunction();
                      }
                    },
                    // width: MediaQuery.of(context).size.width * 0.25,
                    buttonText: yesLabel ?? "yes",
                    // fontSize: 18,
                    // fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          );
        },
        barrierDismissible: barrierDismissible);
  }

  void showInformationDailogBox({
    required BuildContext context,
    required String msg,
    required String firstButtonLabel,
    String secondButtonLabel = "",
    String? title,
    IconData iconData = Icons.info,
    Color? backgroundColor,
    bool isDialog = true,
    Function? firstFunction,
    Function? secondFunction,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (msg.isEmpty) {
          msg = "AppLocalizations.of(context)!.somethingWentWrong";
        }
        if (secondButtonLabel.isEmpty) {
          secondButtonLabel = "AppLocalizations.of(context)!.iWillDoILater";
        }
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          title: Center(
              child: title != null
                  ? TextWidget(
                      text: title,
                      // fontSize: 18,
                      // fontWeight: FontWeight.w600,
                    )
                  : null),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                text: msg,
                textAlign: TextAlign.center,
                // textColor: AColors.catalinaBlue,
              ),
            ],
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonWidget(
                  buttonText: firstButtonLabel,
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  onTap: () {
                    Navigator.pop(context);
                    if (firstFunction != null) {
                      firstFunction();
                    }
                  },
                  // width: MediaQuery.of(context).size.width,
                  // fontSize: 18,
                  // fontWeight: FontWeight.w700,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    if (secondFunction != null) {
                      secondFunction();
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      textAlign: TextAlign.center,
                      secondButtonLabel,
                      style: const TextStyle(
                        color: AppColors.gray,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                // AButton(
                //   padding: const EdgeInsets.all(6),
                //   onTap: () {
                //     Navigator.pop(context);
                //     if (noFunction != null) {
                //       noFunction();
                //     }
                //   },
                //   width: MediaQuery.of(context).size.width * 0.25,
                //   label: StringConstants.no,
                //   fontSize: 18,
                //   fontWeight: FontWeight.w700,
                // )
              ],
            ),
          ],
        );
      },
      barrierDismissible: barrierDismissible,
    );
  }

  void showSnackBar({
    required BuildContext context,
    required String msg,
    String? title,
    IconData? iconData,
    Color? backgroundColor,
    bool isDialog = true,
    Function? f,
    bool barrierDismissible = true,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (msg.isEmpty) {
            msg = "somethingWentWrong";
          }
          return AlertDialog(
            surfaceTintColor: AppColors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 20.0, end: 80.0),
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceOut,
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return iconData == null
                          ? Image.asset(
                              AppImages.alert,
                              width: value,
                            )
                          : Icon(
                              iconData,
                              color: Colors.blue,
                              size: value,
                            );
                    },
                  ),
                ),
                Visibility(
                  visible: title != null,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Center(child: TextWidget(text: title ?? "")),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextWidget(
                  text: msg,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              Center(
                child: ButtonWidget(
                  buttonText: "ok",
                  onTap: () {
                    Navigator.pop(context);
                    if (f != null) {
                      f();
                    }
                  },
                  // width: MediaQuery.of(context).size.width * 0.4,
                  // label: AppLocalizations.of(context)!.ok,
                  // fontSize: 18,
                  // fontWeight: FontWeight.w700,
                ),
              ),
            ],
          );
        },
        barrierDismissible: barrierDismissible);
  }

  size(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  Future showConfirmationDialog(
      {required Function onPressed,
      required BuildContext context,
      required String title,
      required String subtitle,
      required Function onPressed2,
      required String secondButton,
      required String firstButton,
      bool showSecondaryButton = true}) {
    // flutter defined function

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          titlePadding: const EdgeInsets.only(left: 0.0, right: 0.0),
          title: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(ConstValue.BORDER_RADIUS),
                    topRight: Radius.circular(ConstValue.BORDER_RADIUS))),
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 4.0),
              child: Row(
                children: [
                  Expanded(child: Text(title)),
                  IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                      onPressed: () {})
                  // onPressed2 ??
                  //     () {
                  //       Utils.pop(context);
                  //     })
                ],
              ),
            ),
          ),
          content: Text(subtitle),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ConstValue.BORDER_RADIUS)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (onPressed != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 1.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            ConstValue.SMALL_BORDER_RADIUS),
                      ),
                      splashColor: const Color.fromRGBO(245, 189, 32, 1),
                      color: const Color.fromRGBO(245, 189, 32, 1),
                      elevation: ConstValue.ELEVATION,
                      onPressed: () {}
                      // onPressed
                      ,
                      child: Center(
                        child: Text(
                          firstButton ?? "Yes",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: ConstValue.HORIZONTAL_SPACE),
                if (showSecondaryButton)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 1.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            ConstValue.SMALL_BORDER_RADIUS),
                      ),
                      splashColor: const Color.fromRGBO(245, 189, 32, 1),
                      color: const Color.fromRGBO(245, 189, 32, 1),
                      elevation: ConstValue.ELEVATION,
                      onPressed: () {}
                      // onPressed2 ??
                      //     () {
                      //       Utils.pop(context);
                      //     }
                      ,
                      child: Center(
                        child: Text(
                          secondButton ?? "No",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  showBottomSheets(
      {required BuildContext context,
      required String msg,
      Color backgroundColor = Colors.red,
      bool barrierDismissible = true,
      onClosingFunction,
      onClosing,
      Function? f}) {
    if (msg.isEmpty) {
      msg = "somethingWentWrong";
    }
    backgroundColor = backgroundColor;
    getBottomSheet(
      BottomSheet(
        backgroundColor: AppColors.white,
        onClosing: onClosingFunction,
        builder: (BuildContext context) {
          return SafeArea(
            bottom: false,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: AppColors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: onClosing,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2, color: AppColors.brandeisblue)),
                          child: const Icon(Icons.close_rounded,
                              color: AppColors.brandeisblue),
                        ),
                      )
                    ],
                  ),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Semantics(
                  //     label: "AppLocalizations.of(context)!.acc_audioWavegif",
                  //     child: GifView.asset(
                  //       height: 110,
                  //       colorBlendMode: BlendMode.clear,
                  //       fit: BoxFit.cover,
                  //       Image.asset(AppImages.acRepair)
                  //       frameRate: 30,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          );
        },
      ),
      context,
    );
  }

  // to show error and message on bottom;
  showSnackBar2(
      {required BuildContext context,
      required String msg,
      Color backgroundColor = Colors.green,
      bool isDialog = true,
      bool barrierDismissible = true,
      Function? f}) {
    if (msg.isEmpty) {
      msg = "somethingWentWrong";
    }

    backgroundColor = backgroundColor;
    if (!isDialog) {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 10),
        backgroundColor: backgroundColor,
        content: Text(msg),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context)
          .removeCurrentSnackBar(); // to hide the current snackbar
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      showSuccessAlertDialog(
          context: context,
          message: msg,
          f: f,
          barrierDismissible: barrierDismissible);
    }
  }

  hideSnackBar(context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }

  Widget showLoading() {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    );
  }

  Future<void> showLanguageDialog({required BuildContext context}) {
    int _selectedValue = -1;
    StateSetter _stateSetter;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            _stateSetter = setState;
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ConstValue.BORDER_RADIUS),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(ConstValue.ALL_PADDING),
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' AppLocalizations.of(context)!.selectLanguageTitle',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.close,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            final canPop = Navigator.of(context).canPop();
                            if (!canPop) {
                              //DO nothing
                            } else {
                              Navigator.of(context, rootNavigator: true).pop();
                            }
                          },
                        )
                      ],
                    ),
                    const Divider(),
                    Container(
                      height: ConstValue.VERTICAL_SPACE,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _stateSetter(() {
                              _selectedValue = 0;
                            });

                            // _saveToSharedPreference(0);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.28,
                            height: MediaQuery.of(context).size.height * 0.1,
                            constraints: const BoxConstraints(
                                minHeight: 80, maxHeight: 120),
                            padding: const EdgeInsets.symmetric(
                                horizontal: ConstValue.LEFT_PADDING,
                                vertical: 4.0),
                            decoration: BoxDecoration(
                              color: _selectedValue == 0
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: _selectedValue == 0
                                      ? AppColors.primaryColor
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(
                                  ConstValue.BORDER_RADIUS),
                            ),
                            child: FittedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("English",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(color: Colors.grey))),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _stateSetter(() {
                              _selectedValue = 1;
                            });

                            // _saveToSharedPreference(1);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.28,
                            height: MediaQuery.of(context).size.height * 0.1,
                            constraints: const BoxConstraints(
                                minHeight: 80, maxHeight: 120),
                            padding: const EdgeInsets.symmetric(
                                horizontal: ConstValue.LEFT_PADDING,
                                vertical: 4.0),
                            decoration: BoxDecoration(
                              color: _selectedValue == 1
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: _selectedValue == 1
                                      ? AppColors.primaryColor
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(
                                  ConstValue.BORDER_RADIUS),
                            ),
                            child: FittedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "अ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "हिन्दी",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: ConstValue.VERTICAL_SPACE,
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  // _saveToSharedPreference(int index) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try {
  //     Provider.of<LocaleProvider>(navigatorKey.currentContext!, listen: false)
  //         .setLocale(l10n.all[index]);
  //     await prefs.setInt('languageIndex', index);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  void showSuccessAlertDialog(
      {required BuildContext context,
      required String message,
      String? title,
      IconData iconData = Icons.info, // Default icon is info
      Color iconColor = Colors.blue,
      bool barrierDismissible = true,
      Function? f // Default icon color is blue
      }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: title != null ? TextWidget(text: title) : null),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                color: iconColor,
                size: 50.0,
              ),
              const SizedBox(height: 10),
              TextWidget(text: message),
            ],
          ),
          actions: [
            Center(
              child: ButtonWidget(
                buttonText: "",
                onTap: () {
                  Navigator.pop(context);
                  if (f != null) {
                    f();
                  }
                },
                // width: MediaQuery.of(context).size.width * 0.2,
                // label: AppLocalizations.of(context)!.ok,
                // fontSize: 18,
                // fontWeight: FontWeight.w700,
              ),
            ),
          ],
        );
      },
    );
  }

  systemOverlayDesign(Color color) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );
    // if (Platform.isAndroid) {
    //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //       overlays: [SystemUiOverlay.top]);
    // } else if (Platform.isIOS) {
    //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //       overlays: [SystemUiOverlay.top]);
    // }
    return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
  }
}
