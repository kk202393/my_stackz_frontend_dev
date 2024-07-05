import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/payment_Provider.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
Widget build(BuildContext context) {
    PaymentProvider controller = Provider.of<PaymentProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                        text: StringConstants.payment,
                        style: context.headlineSmall),
                    const Spacer(),
                    Image.asset(AppImages.paymentIconCall, width: 24)
                  ],
                ),
                SizedBox(height: size.height *0.05),
                Row(
                  children: [
                    const Icon(Icons.check,
                        size: 20, color: AppColors.princeTonOrange),
                    SizedBox(width: size.width * 0.02),
                    TextWidget(
                        text: StringConstants.advancePayment,
                        style: context.titleSmall),
                    const Spacer(),
                    TextWidget(
                        text: "S\$. 1,810",
                        style: context.titleSmall),
                  ],
                ),
                SizedBox(height: size.height*0.02),
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
                SizedBox(height: size.height*0.02),
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
                SizedBox(height: size.height*0.02),
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
                SizedBox(height: size.height*0.02),
                AppDivider(width: size.width, color: AppColors.gray),
                SizedBox(height: size.height*0.02),
                Row(
                  children: [
                    TextWidget(
                        text: StringConstants.paymentToBeDone,
                        style: context.headlineMedium.copyWith(color: AppColors.yellowOrange)),
                    const Spacer(),
                    TextWidget(
                        text: "S\$. 9,000",
                        style: context.titleSmall),
                  ],
                ),
                SizedBox(height: size.height*0.05),
                TextWidget(
                    text: StringConstants.choosePaymentMethod,
                    style: context.titleMedium.copyWith(color: AppColors.graniteGray, fontWeight: FontWeight.w700)),
                SizedBox(height: size.height*0.02),
                Row(
                  children: [
                    InkWell(
                      onTap: () => controller.onClickPayment(),
                      child: Icon(
                          controller.payVia.value
                              ? Icons.check_circle_outline
                              : Icons.circle_outlined,
                          size: 20, color: AppColors.gray,),
                    ),
                    SizedBox(width: size.width*0.02),
                    TextWidget(
                        text: StringConstants.payViaCreditCard,
                        style: context.titleSmall.copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
                SizedBox(height: size.height*0.01),
                Row(
                  children: [
                    InkWell(
                      onTap: () => controller.onClickPayment(),
                      child: Icon(
                          controller.payVia.value
                              ? Icons.check_circle_outline
                              : Icons.circle_outlined,
                          size: 20, color: AppColors.gray,),
                    ),
                    SizedBox(width: size.width*0.02),
                    TextWidget(
                        text: StringConstants.payViaCreditCard,
                        style: context.titleSmall.copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
                SizedBox(height: size.height*0.01),
                Row(
                  children: [
                    InkWell(
                      onTap: () => controller.onClickPayment(),
                      child: Icon(
                          controller.payVia.value
                              ? Icons.check_circle_outline
                              : Icons.circle_outlined,
                          size: 20, color: AppColors.gray,),
                    ),
                    SizedBox(width: size.width*0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: StringConstants.payViaCreditCard,
                            style: context.titleSmall.copyWith(fontWeight: FontWeight.w700)),
                        RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: StringConstants.balance,
                                style: context.titleSmall.copyWith(
                                  fontSize: 14,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "-(S\$.0)",
                                      style: context.titleSmall.copyWith(
                                          color: AppColors.brightYellowCrayola,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                ])),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.yellowOrange),
                        color: AppColors.white
                      ),
                      child: TextWidget(
                          text: StringConstants.transferMoney,
                          style: context.labelMedium.copyWith(
                              color: AppColors.graniteGray, fontWeight: FontWeight.w700)),
                    )
                  ],
                ),
                SizedBox(height: size.height*0.01),
                Row(
                  children: [
                    InkWell(
                      onTap: () => controller.onClickPayment(),
                      child: Icon(
                          controller.payVia.value
                              ? Icons.check_circle_outline
                              : Icons.circle_outlined,
                          size: 20, color: AppColors.gray,),
                    ),
                    SizedBox(width: size.width*0.02),
                    TextWidget(
                        text: StringConstants.payViaCreditCard,
                        style: context.titleSmall.copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
                SizedBox(height: size.height*0.04),
                ButtonWidget(
                  buttonText: 'Pay Now',
                  onTap: () => Navigator.pushNamed(context,Routes.PAYMENT),
                )
              ],
            ),
          )),
    );
  }
}