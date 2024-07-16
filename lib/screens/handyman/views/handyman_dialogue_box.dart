import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/screens/handyman/provider/handyman_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/divider.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../routes/app_pages.dart';

openScheduleHandymanService(HandymanProvider controller, BuildContext context,
    int subcategoriesIndex, ServiceCategory serviceCategory) {
  HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);

  List<AllCategories> subcategories =
      homeProvider.homeAPIResponse.allCategories.where((element) {
    return element.categoryId == homeProvider.categoryId.value;
  }).toList();
  showDialog(
      context: context,
      useSafeArea: true,
      builder: (builder) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
          title: null,
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Material(
              color: AppColors.white,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          text: serviceCategory.servicecategoryName,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close_outlined,
                              size: 30, color: AppColors.darkGray),
                        )
                      ],
                    ),
                    const HorizontalAppDivider(color: AppColors.darkGray),
                    Column(
                      children: [
                        Row(
                          children: [
                            TextWidget(
                              text: StringConstants.price,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            TextWidget(
                              text: '${serviceCategory.price}',
                              style: GoogleFonts.montserrat(
                                  color: AppColors.princeTonOrange,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        const HorizontalAppDivider(color: AppColors.darkGray),
                        Row(
                          children: [
                            TextWidget(
                              text: StringConstants.number,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () => controller.onClickRemoveRooms(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryButtonColor),
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.primaryButtonColor),
                                child: TextWidget(
                                  text: "-",
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            ValueListenableBuilder(
                                valueListenable: controller.numberOfRooms,
                                builder: (context, value, child) {
                                  return TextWidget(
                                    text: "${controller.numberOfRooms.value}",
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  );
                                }
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () => controller.onClickAddRooms(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryButtonColor),
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.primaryButtonColor),
                                child: TextWidget(
                                  text: "+",
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        ButtonWidget(
                            buttonText: "Check Out >>",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.ADDITIONAL_DETAILS);
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

