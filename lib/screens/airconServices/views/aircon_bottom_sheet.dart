import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/screens/airconServices/provider/aircon_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/string_constants.dart';
import '../../../../widgets/text_widget.dart';
import 'aircon_dialogue_box.dart';

openAirconOptions(AirconProvider controller, context) {
  final width = MediaQuery.of(context).size.width;
  // final airconSubcategories = controller.getFilteredSubcategories();

  Get.bottomSheet(BottomSheet(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20))),
    builder: (builder) {
        HomeProvider homeProvider = Provider.of<HomeProvider>(context , listen: false);
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.3,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.silverSand),
                    color: AppColors.silverSand),
              ),
              const SizedBox(height: 10),
              const TextWidget(
                text: StringConstants.airConRepair,
              ),
              const SizedBox(height: 20),
               SizedBox(
              height: MediaQuery.of(context).size.height*0.7,
              child: GridView.builder(
                itemCount: controller.subcategories.value.length,
                // itemCount: controller.subcategories.lemght,
                 shrinkWrap: true,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {  
                  return InkWell(/*
                          onTap: () => openScheduleAirconService(controller,context,
                              categoryID,
                              index,
                              subcategories.first.subcategories[index]),*/
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.darkGray),
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.white),
                                child: Image.asset(
                                  AppImages.room,
                                  width: width * 0.45,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const SizedBox(width: 10),
                                                     
                            TextWidget(
                              text:"no name",
                              //  airconSubcategories[index].subcategoryName ?? 'No Name',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            )
                            ],
                          ),
                        );
                     
                     },
               ),
            ),
            
              Row(
                children: [
                  Expanded(
                    child: InkWell(
/*
                      onTap: () => openScheduleAirconService(controller,context),
*/
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.darkGray),
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.white),
                            child: Image.asset(
                              AppImages.room,
                              width: width * 0.5,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextWidget(
                            text: "HBD",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.darkGray),
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.white),
                          child: Image.asset(
                            AppImages.room,
                            width: width * 0.5,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextWidget(
                          text: StringConstants.condominium,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.darkGray),
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.white),
                          child: Image.asset(AppImages.room,
                              width: width * 0.5, fit: BoxFit.fitWidth),
                        ),
                        const SizedBox(height: 20),
                        TextWidget(
                          text: StringConstants.landedHouse,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.darkGray),
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.white),
                          child: Image.asset(AppImages.room,
                              width: width * 0.5, fit: BoxFit.fitWidth),
                        ),
                        const SizedBox(height: 20),
                        TextWidget(
                          text: StringConstants.other,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
    onClosing: () {},
  ));
}
