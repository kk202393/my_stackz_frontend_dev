// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_stackz/app/modules/handyman/controllers/handyman_controller.dart';
// import 'package:my_stackz/screens/handyman/provider/handyman_provider.dart';

// import '../../../../constants/app_colors.dart';
// import '../../../../constants/string_constants.dart';
// import '../../../../widgets/button_widget.dart';
// import '../../../../widgets/divider.dart';
// import '../../../../widgets/text_widget.dart';
// import '../../../routes/app_pages.dart';



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/screens/handyman/provider/handyman_provider.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/divider.dart';
import 'package:my_stackz/widgets/text_widget.dart';

import '../../../routes/app_pages.dart';

openScheduleHandymanService(HandymanProvider controller,BuildContext context) {
  showDialog(
      context: context,
      useSafeArea: true,
      builder: (builder) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Material(
              color: AppColors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TextWidget(

                          // text: handymanSubcategories[index].subcategoryName ??
                          text:  'No Name',),
                        const Spacer(),
                        InkWell(
                          onTap: () =>Navigator.pop(context),
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
                              text: '0.00',


                              // "\$. ${handymanSubcategoriesPrice[index].price ?? '0.00'}",
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: AppColors.primaryButtonColor),
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColors.primaryButtonColor),
                              child: TextWidget(
                                text: "-",
                                style: GoogleFonts.montserrat(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TextWidget(
                              text: "1",
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: AppColors.primaryButtonColor),
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColors.primaryButtonColor),
                              child: TextWidget(
                                text: "+",
                                style: GoogleFonts.montserrat(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        const HorizontalAppDivider(color: AppColors.darkGray),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child:
                            TextWidget(text: StringConstants.additionalServices)),
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
                            )
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
                              Navigator.pushNamed(context, Routes.ADDITIONAL_DETAILS);
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

// openScheduleHandymanService(HandymanProvider controller,index) {
//    final handymanSubcategoriesPrice = controller.getFilteredSubcategoriesPrice();
//             final handymanSubcategories = controller.getFilteredSubcategories();
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
//                    TextWidget(text: handymanSubcategories[index].subcategoryName ?? 'No Name',),
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
//                         text: "\$. ${handymanSubcategoriesPrice[index].price ?? '0.00'}",
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
//                             Border.all(color: AppColors.primaryButtonColor),
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
//                             Border.all(color: AppColors.primaryButtonColor),
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
//                       TextWidget(text: StringConstants.additionalServices)),
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
