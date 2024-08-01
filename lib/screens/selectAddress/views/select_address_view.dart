import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/dialoge.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../login/provider/login_provider.dart';

class SelectAddressView extends StatelessWidget {
  const SelectAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    BookingProvider bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.chevron_left_outlined,
                      size: 30, color: AppColors.pineTree),
                ),
                SizedBox(width: width * 0.15),
                TextWidget(text: "Select Address", style: context.headlineSmall)
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: const Icon(Icons.add,
                        color: AppColors.black, size: 15)),
                const SizedBox(width: 20),
                TextWidget(
                    text: StringConstants.addNewAddress,
                    style: context.headlineSmall),
              ],
            ),
            const SizedBox(height: 10),
            AppDivider(width: width),
            const SizedBox(height: 10),
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final address =
                      loginProvider.logInAPIResponse.userAddress[index];
                  final addressText = address["address"];
                  final city = address["city"];
                  final pincode = address["pincode"];

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.circle_outlined,
                          color: AppColors.gray, size: 20),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text:
                                  loginProvider.logInAPIResponse.user.firstName,
                              style: context.headlineSmall),
                          const SizedBox(height: 10),
                          TextWidget(
                              text: loginProvider
                                  .logInAPIResponse
                                  .userAddress[index]["addresses"][index]
                                      ["address"]
                                  .toString(),
                              style: context.headlineSmall
                                  .copyWith(color: AppColors.spanishGray)),
                        ],
                      ),
                      const Icon(Icons.edit_outlined,
                          color: AppColors.black, size: 18),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: loginProvider.logInAPIResponse.userAddress.length),
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.circle_outlined,
                            color: AppColors.gray, size: 20),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                  text: loginProvider
                                      .logInAPIResponse.user.firstName,
                                  style: context.headlineSmall),
                              const SizedBox(height: 10),
                              TextWidget(
                                  text: loginProvider.logInAPIResponse != true
                                      ? loginProvider.logInAPIResponse
                                          .userAddress.first["addresses"]
                                      : "528 ANG MO KIO AVENUE 10\nFLOOR 01 UNIT 2385 CHENG SAN CENTRE Singapore 560528",
                                  // ["address"],
                                  // "528 ANG MO KIO AVENUE 10\nFLOOR 01 UNIT 2385 CHENG SAN CENTRE Singapore 560528",
                                  style: context.headlineSmall
                                      .copyWith(color: AppColors.spanishGray)),
                            ],
                          ),
                        ),
                        const Icon(Icons.edit_outlined,
                            color: AppColors.black, size: 18)
                      ],
                    ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: loginProvider.addressList.length),

            /*Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.circle_outlined,
                    color: AppColors.gray, size: 20),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "John Doe", style: context.headlineSmall),
                      const SizedBox(height: 10),
                      TextWidget(
                          text:
                              "528 ANG MO KIO AVENUE 10\nFLOOR 01 UNIT 2385 CHENG SAN CENTRE",
                          style: context.headlineSmall
                              .copyWith(color: AppColors.spanishGray)),
                      TextWidget(
                          text: "Singapore 560528",
                          style: context.headlineSmall
                              .copyWith(color: AppColors.spanishGray)),
                    ],
                  ),
                ),
                const Icon(Icons.edit_outlined, color: AppColors.black, size: 18)
              ],
            ),
            const SizedBox(height: 20),
            AppDivider(width: width),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.circle_outlined,
                    color: AppColors.gray, size: 20),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "John Doe", style: context.headlineSmall),
                      const SizedBox(height: 10),
                      TextWidget(
                          text:
                          "528 ANG MO KIO AVENUE 10\nFLOOR 01 UNIT 2385 CHENG SAN CENTRE",
                          style: context.headlineSmall
                              .copyWith(color: AppColors.spanishGray)),
                      TextWidget(
                          text: "Singapore 560528",
                          style: context.headlineSmall
                              .copyWith(color: AppColors.spanishGray)),
                    ],
                  ),
                ),
                const Icon(Icons.edit_outlined, color: AppColors.black, size: 18)
              ],
            ),*/
            const SizedBox(height: 50),
            InkWell(
              onTap: () async {
                /*homeProvider.isLoading.value = true;

                bool success =
                    await bookingProvider.callBookingPageApi(context);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Booking Successful!')),
                  );
                  homeProvider.isLoading.value = false;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Booking Failed!')),
                  );
                  homeProvider.isLoading.value = false;
                }*/
              },
              child: ButtonWidget(
                buttonText: 'Continue',
                onTap: () => Navigator.pushNamed(context, Routes.CART_SUMMARY),
              ),
            )
          ],
        ),
      )),
    );
  }
}
