import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/screens/cartSummary/provider/chart_summary_provider.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/login_response.dart';

class CartSummaryView extends StatelessWidget {
  const CartSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    CartSummaryProvider controller =
        Provider.of<CartSummaryProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.cultured,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                SizedBox(width: size.width * 0.3),
                TextWidget(
                    text: StringConstants.cartSummary,
                    style: context.headlineSmall
                        .copyWith(fontWeight: FontWeight.w700))
              ],
            ),
            SizedBox(height: size.height * 0.03),
            // bookingProvider.bookingId.value = bookingProvider
            //         .bookingResponse
            //         .consumerOrderDetails
            //         .bookingId
            //         .isNotEmpty
            //     ? bookingProvider
            //         .bookingResponse.consumerOrderDetails.bookingId
            //         .toString()
            //     : 'No id found';
            // print("BokingIdddd=${bookingProvider.bookingId.value}");

            // bookingProvider.useraddressId.value =
            //     loginProvider.logInAPIResponse.userAddress.isNotEmpty
            //         ? loginProvider.logInAPIResponse.userAddress
            //             .first["addresses"][0]["_id"]
            //         : 'No address found';
            // print(
            //     "Addressssss=${bookingProvider.useraddressId.value}");
            TextWidget(
                text: StringConstants.address, style: context.headlineSmall),
            const SizedBox(height: 10),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Address? address = loginProvider
                      .logInAPIResponse?.userAddress!.first!.addresses?[index];
                  return Column(
                    children: [
                      TextWidget(
                          text: address!.address,
                          style: context.headlineSmall
                              .copyWith(color: AppColors.spanishGray)),
                      const SizedBox(height: 10),
                      TextWidget(
                          text: address.city,
                          style: context.headlineSmall
                              .copyWith(color: AppColors.spanishGray)),
                      const SizedBox(height: 10),
                      TextWidget(
                          text: address.pincode,
                          style: context.headlineSmall
                              .copyWith(color: AppColors.spanishGray)),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: 1),
            const SizedBox(height: 10),

            TextWidget(
                text: "Singapore 560528",
                style: context.headlineSmall
                    .copyWith(color: AppColors.spanishGray)),
            const SizedBox(height: 25),
            TextWidget(
                text: StringConstants.dateAndTime,
                style: context.headlineSmall
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            TextWidget(
                text: "May 18 2021 at 12:30 PM",
                style: context.headlineSmall
                    .copyWith(color: AppColors.spanishGray)),
            const SizedBox(height: 25),
            TextWidget(
                text: StringConstants.details,
                style: context.headlineSmall
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(AppImages.repairOrder, width: 60),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text: "AC Service", style: context.headlineSmall),
                    const SizedBox(height: 10),
                    RichText(
                        text: TextSpan(
                            text: "S\$. 149  ",
                            style: context.headlineSmall
                                .copyWith(color: AppColors.spanishGray),
                            children: <TextSpan>[
                          TextSpan(
                              text: "S\$. 149", style: context.headlineSmall)
                        ])),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () => controller.onClickRemoveServices(),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryButtonColor),
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.primaryButtonColor),
                    child: TextWidget(
                      text: "-",
                      style: GoogleFonts.montserrat(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                TextWidget(
                  text: "${controller.numberOfServices.value}",
                  style: GoogleFonts.montserrat(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () => controller.onClickAddServices(),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryButtonColor),
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.primaryButtonColor),
                    child: TextWidget(
                      text: "+",
                      style: GoogleFonts.montserrat(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            TextWidget(
                text: StringConstants.discounts,
                style: context.headlineSmall
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            TextWidget(
                text: StringConstants.enterCouponCode,
                style: context.headlineSmall
                    .copyWith(color: AppColors.spanishGray)),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextWidget(
                  text: StringConstants.applyCode,
                  style: context.headlineSmall
                      .copyWith(color: AppColors.primaryButtonColor)),
            ),
            const SizedBox(height: 10),
            AppDivider(width: size.width, color: AppColors.black),
            const SizedBox(height: 20),
            TextWidget(
                text: StringConstants.frequentlyAddedTogether,
                style: context.headlineSmall
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            SizedBox(
              height: size.height * 0.4,
              child: ListView.separated(
                  shrinkWrap: true,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.gray),
                            color: AppColors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  child: Image.asset(
                                    AppImages.homeDesign,
                                    width: size.width * 0.6,
                                    height: size.height * 0.3,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors.white.withOpacity(0.2),
                                          AppColors.black.withOpacity(0.9),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.01),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                      text: StringConstants.splitAcCheckup,
                                      style: context.headlineSmall.copyWith(
                                          color: AppColors.spanishGray)),
                                  TextWidget(
                                      text: "S\$. 149",
                                      style: context.headlineSmall)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: size.width * 0.02,
                    );
                  },
                  itemCount: 5),
            ),
            const SizedBox(height: 50),
            ButtonWidget(
              buttonText: 'Confirm Order', onTap: () {},
              // onTap: () => Get.toNamed(Routes.PAYMENT),
            )
          ],
        ),
      )),
    );
  }
}
