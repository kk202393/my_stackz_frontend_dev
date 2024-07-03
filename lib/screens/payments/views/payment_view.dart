import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.chevron_left_outlined,
                        size: 30, color: AppColors.pineTree),
                  ),
                  SizedBox(width: width * 0.3),
                  TextWidget(
                      text: StringConstants.payment,
                      style: context.headlineSmall),
                  const Spacer(),
                  Image.asset(AppImages.paymentIconCall, width: 24)
                ],
              ),
              SizedBox(height: height *0.05),
              Row(
                children: [
                  const Icon(Icons.check,
                      size: 15, color: AppColors.princeTonOrange),
                  SizedBox(width: width * 0.02),
                  TextWidget(
                      text: StringConstants.advancePayment,
                      style: context.titleSmall),
                  const Spacer(),
                  TextWidget(
                      text: "S\$. 1,810",
                      style: context.titleSmall),
                ],
              ),
              SizedBox(height: height*0.02),
              Row(
                children: [
                  TextWidget(
                      text: StringConstants.secondInstallment,
                      style: context.titleSmall.copyWith(color: AppColors.princeTonOrange)),
                  const Spacer(),
                  TextWidget(
                      text: "S\$. 9,000",
                      style: context.titleSmall..copyWith(color: AppColors.princeTonOrange)),
                ],
              ),
              SizedBox(height: height*0.02),
              Row(
                children: [
                  TextWidget(
                      text: StringConstants.thirdInstallment,
                      style: context.titleSmall.copyWith(color: AppColors.gray)),
                  const Spacer(),
                  TextWidget(
                      text: "S\$. 9,000",
                      style: context.titleSmall.copyWith(color: AppColors.gray)),
                ],
              ),
              SizedBox(height: height*0.02),
              Row(
                children: [
                  TextWidget(
                      text: StringConstants.finalInstallment,
                      style: context.titleSmall.copyWith(color: AppColors.gray)),
                  const Spacer(),
                  TextWidget(
                      text: "S\$. 9,000",
                      style: context.titleSmall.copyWith(color: AppColors.gray)),
                ],
              ),
              SizedBox(height: height*0.02),
              AppDivider(width: width, color: AppColors.gray),
              SizedBox(height: height*0.05),
              Row(
                children: [
                  TextWidget(
                      text: StringConstants.paymentToBeDone,
                      style: context.headlineSmall),
                  const Spacer(),
                  TextWidget(
                      text: "S\$. 9,000",
                      style: context.titleSmall),
                ],
              ),
              SizedBox(height: height*0.03),
              TextWidget(
                  text: StringConstants.choosePaymentMethod,
                  style: context.titleSmall.copyWith(color: AppColors.gray)),
              SizedBox(height: height*0.05),
              ButtonWidget(
                buttonText: 'Pay Now',
                onTap: () => Navigator.pushNamed(context,Routes.PAYMENT),
              )
            ],
          ),
        ));
  }
}