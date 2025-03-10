import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/screens/airconServices/provider/aircon_provider.dart';
import 'package:my_stackz/screens/airconServices/views/aircon_bottom_sheet.dart';
import 'package:my_stackz/screens/airconServices/views/aircon_dialogue_box.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class AirconView extends StatelessWidget {
  AirconView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    BookingProvider bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);

    AirconProvider airconController =
        Provider.of<AirconProvider>(context, listen: false);
    List<AllCategory> subcategories =
        homeProvider.homeAPIResponse.allCategories.where((element) {
      return element.categoryId == homeProvider.categoryId.value;
    }).toList();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: 220,
              child: Stack(
                children: [
                  Image.asset(
                    AppImages.airconBanner,
                    width: size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.chevron_left_outlined, size: 50)),
                  ),
                  Positioned(
                    bottom: 15,
                    left: size.width * 0.1,
                    child: TextWidget(
                        text: StringConstants.airconAllServices,
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white)),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: StringConstants.selectCategory,
                  ),
                  SizedBox(height: size.height * 0.05),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        // Subcategories item = controller.subcategories[index];
                        return InkWell(
                          onTap: () {
                            bookingProvider.subCategoryId.value = homeProvider
                                .homeAPIResponse
                                .allCategories[bookingProvider.categoryId.value]
                                .subcategories[index]
                                .subcategoryId!;
                            print(
                                "bookingProvider.sub=${bookingProvider.subCategoryId.value}");
                           openAirconOptions(airconController, context, index,
                                subcategories.first.subcategories[index]);
                            // openAirconOptions(controller, context);
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
                                      ? AppImages.acRepair
                                      : index == 1
                                          ? AppImages.acRepair
                                          : index == 2
                                              ? AppImages.acRepair
                                              : AppImages.acRepair,
                                  width: size.width * 0.5,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextWidget(
                                text: subcategories.first.subcategories[index]
                                    .subcategoryName!,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              TextWidget(
                                text:
                                    '${subcategories.first.subcategories[index].price}',

                                // homeProvider
                                //     .homeAPIResponse
                                //     .allCategories[categoryID]
                                //     .subcategories[index]
                                //     .subcategoryName,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              /*TextWidget(
                                text:homeProvider.homeAPIResponse.allCategories[1].subcategories[0].subcategoryName,
                                //  "item.subcategoryName!",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),*/
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     const Icon(Icons.star,
                              //         color: AppColors.primaryButtonColor),
                              //     TextWidget(
                              //       text: " 4.83 (18.3K reviews)",
                              //       style: GoogleFonts.montserrat(
                              //           fontWeight: FontWeight.w500,
                              //           fontSize: 14),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        );
                      }),
                  /*const SizedBox(height: 20),
                  Row(
                    children: [
                      const TextWidget(
                        text: "Reviews (1000)",
                      ),
                      SizedBox(width: width * 0.4),
                      InkWell(
                        onTap: () => openAirconOptions(airconController,context),
                        child: TextWidget(
                          text: "View All",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.princeTonOrange),
                        ),
                      ),
                    ],
                  )*/
                ],
              ),
            ),
            SizedBox(height: size.height * 0.4),
          ],
        ),
      ),
    );
  }
}
