import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/screens/airconServices/provider/aircon_provider.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/divider.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/string_constants.dart';
import '../../../../widgets/text_widget.dart';
import '../../../models/home_page_response.dart';
import '../../../routes/app_pages.dart';


openScheduleAirconService(AirconProvider controller, BuildContext context,
    int subcategoriesIndex, ServiceCategory serviceCategory) {
  showDialog(
      context: context,
      useSafeArea: true,
      builder: (builder) {
        HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
        AirconProvider airconController =
        Provider.of<AirconProvider>(context, listen: false);
        // List<AllCategories> subcategories =
        // homeProvider.homeAPIResponse.allCategories.where((element) {
        //   return element.categoryId == airconProvider.categoryId.value;
        // }).toList();

        final size = MediaQuery.sizeOf(context);
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
          title: null,
          content: SizedBox(
            width: size.width,
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
                        TextWidget(text: serviceCategory.servicecategoryName!),
                        //  TextWidget(text: airconSubcategories[index.].subcategoryName ?? 'No Name'),
                        const Spacer(),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, Routes.AIRCON_SERVICES),
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
                                }),
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
                        const HorizontalAppDivider(color: AppColors.darkGray),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget(
                                text: StringConstants.additionalServices)),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            TextWidget(
                              text: StringConstants.acInstallationAndCheckUp,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () => controller.onBoxClicked(),
                              child: Container(
                                height: 20,
                                padding: controller.isBoxClicked.value
                                    ? const EdgeInsets.symmetric(horizontal: 2)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.isBoxClicked.value
                                            ? AppColors.spanishBlue
                                            : AppColors.black.withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(3),
                                    color: controller.isBoxClicked.value
                                        ? AppColors.spanishBlue
                                        : AppColors.white),
                                child: controller.isBoxClicked.value
                                    ? const Icon(Icons.check,
                                        color: AppColors.white, size: 16)
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        const HorizontalAppDivider(color: AppColors.darkGray),
                        Row(
                          children: [
                            TextWidget(
                              text: StringConstants.generalCleaning,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () => controller.onBoxClicked(),
                              child: Container(
                                height: 20,
                                padding: controller.isBoxClicked.value
                                    ? const EdgeInsets.symmetric(horizontal: 2)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.isBoxClicked.value
                                            ? AppColors.spanishBlue
                                            : AppColors.black.withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(3),
                                    color: controller.isBoxClicked.value
                                        ? AppColors.spanishBlue
                                        : AppColors.white),
                                child: controller.isBoxClicked.value
                                    ? const Icon(Icons.check,
                                        color: AppColors.white, size: 16)
                                    : null,
                              ),
                            )
                          ],
                        ),
                        const HorizontalAppDivider(color: AppColors.darkGray),
                        Row(
                          children: [
                            TextWidget(
                              text: StringConstants.condenserCleaning,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () => controller.onBoxClicked(),
                              child: Container(
                                height: 20,
                                padding: controller.isBoxClicked.value
                                    ? const EdgeInsets.symmetric(horizontal: 2)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.isBoxClicked.value
                                            ? AppColors.spanishBlue
                                            : AppColors.black.withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(3),
                                    color: controller.isBoxClicked.value
                                        ? AppColors.spanishBlue
                                        : AppColors.white),
                                child: controller.isBoxClicked.value
                                    ? const Icon(Icons.check,
                                        color: AppColors.white, size: 16)
                                    : null,
                              ),
                            )
                          ],
                        ),
                        const HorizontalAppDivider(color: AppColors.darkGray),
                        const SizedBox(height: 10),
                        ButtonWidget(
                            buttonText: "Check Out >>",
                            onTap: () {
                              //  Navigator.pushNamed(context, Routes.HOME);
                              Navigator.pushNamed(
                                  context, Routes.DATE_AND_TIME);
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


// openScheduleAirconService(AirconProvider controller,index) {
//        final airconSubcategoriesPrice = controller.getFilteredSubcategoriesPrice(index);
//             final airconSubcategories = controller.getFilteredSubcategories(index);
//   Get.dialog(AlertDialog(
//     insetPadding: const EdgeInsets.symmetric(horizontal: 10),
//     contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//     content: SizedBox(
//       width: MediaQuery.of(Get.context!).size.width,
//       child: Material(
//         color: AppColors.white,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   TextWidget(text: "no name",),
//                   //  TextWidget(text: airconSubcategories[index.].subcategoryName ?? 'No Name'),
//                   const Spacer(),
//                   InkWell(
//                     onTap: () => Get.back(),
//                     child: const Icon(Icons.close_outlined,
//                         size: 30, color: AppColors.darkGray),
//                   )
//                 ],
//               ),
//               const HorizontalAppDivider(color: AppColors.darkGray),
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       TextWidget(
//                         text: StringConstants.price,
//                         style: GoogleFonts.montserrat(
//                             color: AppColors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                       const Spacer(),
//                       TextWidget(
//                         text: '0.00',
//                         // "\$. ${airconSubcategoriesPrice[index].price ?? '0.00'}",
//                         style: GoogleFonts.montserrat(
//                             color: AppColors.princeTonOrange,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   const HorizontalAppDivider(color: AppColors.darkGray),
//                   Row(
//                     children: [
//                       TextWidget(
//                         text: StringConstants.number,
//                         style: GoogleFonts.montserrat(
//                             color: AppColors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                       const Spacer(),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 8),
//                         decoration: BoxDecoration(
//                             border:
//                                 Border.all(color: AppColors.primaryButtonColor),
//                             borderRadius: BorderRadius.circular(3),
//                             color: AppColors.primaryButtonColor),
//                         child: TextWidget(
//                           text: "-",
//                           style: GoogleFonts.montserrat(
//                               color: AppColors.black,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       TextWidget(
//                         text: "1",
//                         style: GoogleFonts.montserrat(
//                             color: AppColors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                       const SizedBox(width: 20),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 8),
//                         decoration: BoxDecoration(
//                             border:
//                                 Border.all(color: AppColors.primaryButtonColor),
//                             borderRadius: BorderRadius.circular(3),
//                             color: AppColors.primaryButtonColor),
//                         child: TextWidget(
//                           text: "+",
//                           style: GoogleFonts.montserrat(
//                               color: AppColors.black,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16),
//                         ),
//                       )
//                     ],
//                   ),
//                   const HorizontalAppDivider(color: AppColors.darkGray),
//                   const Align(
//                       alignment: Alignment.centerLeft,
//                       child:
//                           TextWidget(text: StringConstants.additionalServices)),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       TextWidget(
//                         text: StringConstants.acInstallationAndCheckUp,
//                         style: GoogleFonts.montserrat(
//                             color: AppColors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                       const Spacer(),
//                       Obx(() => InkWell(
//                         onTap: () => controller.onBoxClicked(),
//                         child: Container(
//                           height: 20,
//                           padding: controller.isBoxClicked.value
//                               ? const EdgeInsets.symmetric(horizontal: 2)
//                               : const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 8),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: controller.isBoxClicked.value
//                                       ? AppColors.spanishBlue
//                                       : AppColors.black.withOpacity(0.8)),
//                               borderRadius: BorderRadius.circular(3),
//                               color: controller.isBoxClicked.value
//                                   ? AppColors.spanishBlue
//                                   : AppColors.white),
//                           child: controller.isBoxClicked.value
//                               ? const Icon(Icons.check,
//                               color: AppColors.white, size: 16)
//                               : null,
//                         ),
//                       ))
//                     ],
//                   ),
//                   const HorizontalAppDivider(color: AppColors.darkGray),
//                   Row(
//                     children: [
//                       TextWidget(
//                         text: StringConstants.generalCleaning,
//                         style: GoogleFonts.montserrat(
//                             color: AppColors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                       const Spacer(),
//                       Obx(() => InkWell(
//                             onTap: () => controller.onBoxClicked(),
//                             child: Container(
//                               height: 20,
//                               padding: controller.isBoxClicked.value
//                                   ? const EdgeInsets.symmetric(horizontal: 2)
//                                   : const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 8),
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: controller.isBoxClicked.value
//                                           ? AppColors.spanishBlue
//                                           : AppColors.black.withOpacity(0.8)),
//                                   borderRadius: BorderRadius.circular(3),
//                                   color: controller.isBoxClicked.value
//                                       ? AppColors.spanishBlue
//                                       : AppColors.white),
//                               child: controller.isBoxClicked.value
//                                   ? const Icon(Icons.check,
//                                       color: AppColors.white, size: 16)
//                                   : null,
//                             ),
//                           ))
//                     ],
//                   ),
//                   const HorizontalAppDivider(color: AppColors.darkGray),
//                   Row(
//                     children: [
//                       TextWidget(
//                         text: StringConstants.condenserCleaning,
//                         style: GoogleFonts.montserrat(
//                             color: AppColors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                       const Spacer(),
//                       Obx(() => InkWell(
//                         onTap: () => controller.onBoxClicked(),
//                         child: Container(
//                           height: 20,
//                           padding: controller.isBoxClicked.value
//                               ? const EdgeInsets.symmetric(horizontal: 2)
//                               : const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 8),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: controller.isBoxClicked.value
//                                       ? AppColors.spanishBlue
//                                       : AppColors.black.withOpacity(0.8)),
//                               borderRadius: BorderRadius.circular(3),
//                               color: controller.isBoxClicked.value
//                                   ? AppColors.spanishBlue
//                                   : AppColors.white),
//                           child: controller.isBoxClicked.value
//                               ? const Icon(Icons.check,
//                               color: AppColors.white, size: 16)
//                               : null,
//                         ),
//                       ))
//                     ],
//                   ),
//                   const HorizontalAppDivider(color: AppColors.darkGray),
//                   const SizedBox(height: 10),
//                   ButtonWidget(
//                       buttonText: "Check Out >>",
//                       onTap: () {
//                         //  Navigator.pushNamed(context, Routes.HOME);
//                         Get.toNamed(Routes.ADDITIONAL_DETAILS);
//                       }),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   ));
// }
