import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/screens/cartSummary/provider/chart_summary_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class chartSummaryView extends StatelessWidget {
  const chartSummaryView({super.key});

  @override
 Widget build(BuildContext context) {
           ChartSummaryProvider controller = Provider.of<ChartSummaryProvider>(context, listen: false);

    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                // onTap: () => Get.back(),
                child: const Icon(Icons.chevron_left_outlined,
                    size: 30, color: AppColors.pineTree),
              ),
              SizedBox(width: width * 0.3),
              TextWidget(
                  text: StringConstants.selectDateAndTime,
                  style: context.headlineSmall)
            ],
          ),
          const SizedBox(height: 20),
          TextWidget(
              text: StringConstants.address, style: context.headlineSmall),
          const SizedBox(height: 10),
          TextWidget(
              text:
                  "528 ANG MO KIO AVENUE 10\nFLOOR 01 UNIT 2385 CHENG SAN CENTRE",
              style:
                  context.headlineSmall.copyWith(color: AppColors.spanishGray)),
          const SizedBox(height: 10),
          TextWidget(
              text: "Singapore 560528",
              style:
                  context.headlineSmall.copyWith(color: AppColors.spanishGray)),
          const SizedBox(height: 25),
          TextWidget(
              text: StringConstants.dateAndTime, style: context.headlineSmall),
          const SizedBox(height: 10),
          TextWidget(
              text: "May 18 2021 at 12:30 PM",
              style:
                  context.headlineSmall.copyWith(color: AppColors.spanishGray)),
          const SizedBox(height: 25),
          TextWidget(
              text: StringConstants.details, style: context.headlineSmall),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(AppImages.repairOrder, width: 60),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "AC Service", style: context.headlineSmall),
                  const SizedBox(height: 10),
                  RichText(
                      text: TextSpan(
                          text: "S\$. 149",
                          style: context.headlineSmall
                              .copyWith(color: AppColors.spanishGray),
                          children: <TextSpan>[
                        TextSpan(text: "S\$. 149", style: context.headlineSmall)
                      ])),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.princeTonOrange),
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.princeTonOrange),
                child: TextWidget(
                  text: "-",
                  style: GoogleFonts.montserrat(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
              const SizedBox(width: 10),
              TextWidget(
                text: "1",
                style: GoogleFonts.montserrat(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.princeTonOrange),
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.princeTonOrange),
                child: TextWidget(
                  text: "+",
                  style: GoogleFonts.montserrat(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              )
            ],
          ),
          const SizedBox(height: 25),
          TextWidget(
              text: StringConstants.discounts, style: context.headlineSmall),
          const SizedBox(height: 10),
          TextWidget(
              text: StringConstants.enterCouponCode,
              style:
                  context.headlineSmall.copyWith(color: AppColors.spanishGray)),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextWidget(
                text: StringConstants.applyCode,
                style: context.headlineSmall
                    .copyWith(color: AppColors.primaryButtonColor)),
          ),
          const SizedBox(height: 10),
          AppDivider(width: width, color: AppColors.black),
          const SizedBox(height: 20),
          TextWidget(
              text: StringConstants.frequentlyAddedTogether,
              style: context.headlineSmall),
          const SizedBox(height: 10),
          ListView.separated(
              controller: controller.scrollController,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.gray),
                      color: AppColors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppImages.acRepair, fit: BoxFit.contain),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                            text: StringConstants.splitAcCheckup,
                            style: context.headlineSmall
                                .copyWith(color: AppColors.spanishGray)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                            text: "S\$. 149", style: context.headlineSmall),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 2),
          const SizedBox(height: 50),
          ButtonWidget(
            buttonText: 'Confirm Order', onTap: () {  },
            // onTap: () => Get.toNamed(Routes.PAYMENT),
          )
        ],
      ),
    ));
  }
}