// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/screens/cleaning/provider/cleaning_provider.dart';
import 'package:my_stackz/screens/cleaning/views/cleaning_bottom_sheet.dart';
import 'package:my_stackz/screens/cleaning/views/cleaning_dialogue_box.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CleaningView extends StatelessWidget {
  int categoryID;
  CleaningView({super.key, required this.categoryID});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    CleaningProvider cleaningController =
        Provider.of<CleaningProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    List<AllCategories>  subcategories = homeProvider.homeAPIResponse.allCategories
        .where((element){
          return element.categoryId == categoryID;
        }).toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: 220,
              child: Stack(
                children: [
                  Image.asset(
                    AppImages.cleaningBanner,
                    width: width,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top: 15,
                    left: 10,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child:
                            const Icon(Icons.chevron_left_outlined, size: 50)),
                  ),
                  Positioned(
                    bottom: 15,
                    left: width * 0.1,
                    child: TextWidget(
                      text: StringConstants.homeAndOfficeCleaning,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: StringConstants.selectCategory,
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            openScheduleCleaningService(
                                cleaningController, context,categoryID,index);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.darkGray),
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.white),
                                child: Image.asset(
                                  index == 0
                                      ? AppImages.homeCleaning
                                      : index == 1
                                          ? AppImages.officeCleaning
                                          : index == 2
                                              ? AppImages.springCleaning
                                              : AppImages.movingInOutCleaning,
                                  width: width * 0.5,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextWidget(
                                text: subcategories.first.subcategories[index].subcategoryName,

                                // homeProvider
                                //     .homeAPIResponse
                                //     .allCategories[categoryID]
                                //     .subcategories[index]
                                //     .subcategoryName,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                      color: AppColors.primaryButtonColor),
                                  TextWidget(
                                    text: " 4.83 (18.3K reviews)",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const TextWidget(
                        text: "Reviews (1000)",
                      ),
                      SizedBox(width: width * 0.4),
                      InkWell(
                        onTap: () =>
                            openCleaningOptions(cleaningController, context),
                        child: TextWidget(
                          text: "View All",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.princeTonOrange),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: width * 0.4),
          ],
        ),
      ),
    );
  }
}
