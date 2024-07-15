
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/screens/cleaning/provider/cleaning_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/divider.dart';
import '../../../routes/app_pages.dart';

//   final filteredSubcategoriesPrice = controller.getFilteredSubcategoriesPrice();
// final filteredSubcategories = controller.getFilteredSubcategories();
openScheduleCleaningService(CleaningProvider controller, BuildContext context,
     int subcategoriesIndex, Subcategories subcategory) {
  showDialog(
      context: context,
      useSafeArea: true,
      builder: (builder) {
        HomeProvider homeProvider =
            Provider.of<HomeProvider>(context, listen: false);
        CleaningProvider cleaningProvider =
        Provider.of<CleaningProvider>(context, listen: false);

        List<AllCategories> subcategories =
            homeProvider.homeAPIResponse.allCategories.where((element) {
          return element.categoryId == cleaningProvider.categoryId.value;
        }).toList();
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
          title: null,
          content: SizedBox(
            width: double.infinity,
            child: Material(
              color: AppColors.white,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          text: subcategories.isNotEmpty
                              ? subcategories[0].subcategories[subcategoriesIndex].subcategoryName
                              : 'No Name',
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, Routes.CLEANING),
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
                              text: "${subcategory.price}",
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
                              text: StringConstants.room,
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
                        const HorizontalAppDivider(color: AppColors.darkGray),
                        Row(
                          children: [
                            TextWidget(
                              text: StringConstants.hours,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () => controller.onClickRemoveHours(),
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
                                valueListenable: controller.numberOfHours,
                                builder: (context, value, child) {
                                  return TextWidget(
                                    text: "${controller.numberOfHours.value}",
                                    style: GoogleFonts.montserrat(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  );
                                }
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () => controller.onClickAddHours(),
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
                              text: StringConstants.windowCleaning,
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
                              text: StringConstants.ironing,
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
                              text: StringConstants.fridgeInteriorCleaning,
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
                              text: StringConstants.kitchenAppliances,
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
                        const SizedBox(height: 10),
                        ButtonWidget(
                            buttonText: "Check Out >>",
                            onTap: () {
                              Navigator.pushNamed(context,Routes.ADDITIONAL_DETAILS);
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

//   Get.dialog(AlertDialog(
//     insetPadding: const EdgeInsets.symmetric(horizontal: 10),
//     contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//     content: SizedBox(
//       width: double.infinity,
//       // width: MediaQuery.of(Get.context!).size.width,
//       child:  Material(
//         color: AppColors.white,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   TextWidget(text:
//                     // text: filteredSubcategories[index].subcategoryName ??
//                         'No Name',
//                   ),
//                   const Spacer(),
//                   InkWell(
//                     // onTap: () => Get.back(),
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
//                         text:"0.00",

//                             // "\$. ${filteredSubcategoriesPrice[index].price ?? '0.00'}",
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
//                         text: StringConstants.room,
//                         style: GoogleFonts.montserrat(
//                             color: AppColors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                       const Spacer(),
//                       InkWell(
//                         onTap: () => controller.onClickRemoveRooms(),
//                         child: Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: AppColors.primaryButtonColor),
//                               borderRadius: BorderRadius.circular(3),
//                               color: AppColors.primaryButtonColor),
//                           child: TextWidget(
//                             text: "-",
//                             style: GoogleFonts.montserrat(
//                                 color: AppColors.black,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       Obx(() => TextWidget(
//                             text: "${controller.numberOfRooms.value}",
//                             style: GoogleFonts.montserrat(
//                                 color: AppColors.black,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16),
//                           )),
//                       const SizedBox(width: 20),
//                       InkWell(
//                         onTap: () => controller.onClickAddRooms(),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 8),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: AppColors.primaryButtonColor),
//                               borderRadius: BorderRadius.circular(3),
//                               color: AppColors.primaryButtonColor),
//                           child: TextWidget(
//                             text: "+",
//                             style: GoogleFonts.montserrat(
//                                 color: AppColors.black,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   const HorizontalAppDivider(color: AppColors.darkGray),
//                   Row(
//                     children: [
//                       TextWidget(
//                         text: StringConstants.hours,
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
//                         text: StringConstants.windowCleaning,
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
//                         text: StringConstants.ironing,
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
//                         text: StringConstants.fridgeInteriorCleaning,
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
//                         text: StringConstants.kitchenAppliances,
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
//                   const SizedBox(height: 10),
//                   ButtonWidget(
//                       buttonText: "Check Out >>",
//                       onTap: () {
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
