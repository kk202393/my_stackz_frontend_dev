import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/screens/bookingAccepted/provider/booking_accepted_provider.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/text_widget.dart';

openBookingDialogueBox(BookingAcceptedProvider controller) {
  Get.dialog(AlertDialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 30),
    contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
    content: SizedBox(
      width: MediaQuery.of(Get.context!).size.width,
      child: Material(
        color: AppColors.white,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.close_outlined,
                            color: AppColors.black, size: 20)),
                  ),
                  const SizedBox(height: 30),
                  TextWidget(
                    text: "AC service",
                    style: GoogleFonts.montserrat(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 5),
                  TextWidget(
                    text: "12 June, 2:30pm",
                    style: GoogleFonts.montserrat(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 30),
                  TextWidget(
                    text: "Raju Kumar",
                    style: GoogleFonts.montserrat(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    text: "Number: +6598776891",
                    style: GoogleFonts.montserrat(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryButtonColor,
                        border: Border.all(color: AppColors.primaryButtonColor),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.35),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(0, 5),
                          )
                        ]),
                    child: Row(
                      children: [
                        const Icon(Icons.phone, size: 14, color: AppColors.black),
                        const SizedBox(width: 10),
                        TextWidget(
                          text: "Call",
                          style: GoogleFonts.montserrat(
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ClipOval(),
            ],
          ),
        ),
      ),
    ),
  ));
}
