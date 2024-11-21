// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_stackz/constants/app_colors.dart';
// import 'package:my_stackz/constants/app_images.dart';
// import 'package:my_stackz/constants/string_constants.dart';
// import 'package:my_stackz/widgets/app_divider.dart';
// import 'package:my_stackz/widgets/text_widget.dart';

// class BookingView extends StatelessWidget {
//   const BookingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         child: Column(
//           children: [
//             // Header with navigation and action icons
//             Row(
//               children: [
//                 InkWell(
//                   onTap: () => Navigator.pop(context), // Enables back navigation
//                   child: const Icon(Icons.chevron_left_outlined,
//                       size: 30, color: AppColors.pineTree),
//                 ),
//                 const SizedBox(width: 20),
//                 const Expanded(
//                   child: TextWidget(
//                     text: StringConstants.bookings,
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//                   ),
//                 ),
//                 const Icon(Icons.filter_alt_outlined,
//                   //  color: AppColors.primaryButtonColor.withOpacity(0.5)
//                     ),
//                 const SizedBox(width: 10),
//                 const Icon(Icons.search_outlined,
//                     color: AppColors.primaryButtonColor),
//               ],
//             ),
//             const SizedBox(height: 20),
            
//             // List of bookings with dynamically created rows
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: 15, // Set the number of items dynamically if needed
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 170,
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: AppColors.white),
//                     color: AppColors.white,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Booking header with job status and date
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               text: StringConstants.homeCleaning,
//                               style: GoogleFonts.montserrat(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.black,
//                               ),
//                               children: <TextSpan>[
//                                 TextSpan(
//                                   text: "\n${StringConstants.jobCompleted}",
//                                   style: GoogleFonts.montserrat(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500,
//                                     color: AppColors.greenCrayola,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Spacer(),
//                           TextWidget(
//                             text: "23/02/2023",
//                             style: GoogleFonts.montserrat(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),

//                       // Reviewer profile and rating section
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Image.asset(AppImages.reviewerProfile, width: 44),
//                             const SizedBox(width: 20),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 TextWidget(
//                                   text: "Joeie Senon",
//                                   style: GoogleFonts.montserrat(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColors.pineTree,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: List.generate(5, (index) => Icon(
//                                     Icons.star,
//                                     color: AppColors.princeTonOrange,
//                                     size: 10,
//                                   )),
//                                 ),
//                                 const SizedBox(width: 5),
//                                 TextWidget(
//                                   text: "486 Ratings",
//                                   style: GoogleFonts.montserrat(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w300,
//                                     color: AppColors.pineTree,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 25),

//                       // Help and View Project actions
//                       Row(
//                         children: [
//                           const Icon(Icons.help_outline,
//                               color: AppColors.black, size: 20),
//                           const SizedBox(width: 5),
//                           Expanded(
//                             child: TextWidget(
//                               text: "Need Help",
//                               style: GoogleFonts.montserrat(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.black,
//                               ),
//                             ),
//                           ),
//                           const AppDivider(
//                             height: 15,
//                             width: 1,
//                             color: AppColors.black,
//                           ),
//                           const SizedBox(width: 10),
//                           Image.asset(AppImages.pageWithMenu,
//                               width: 15, height: 16, color: AppColors.black),
//                           const SizedBox(width: 5),
//                           TextWidget(
//                             text: "View Project",
//                             style: GoogleFonts.montserrat(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/text_widget.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.chevron_left_outlined,
                        size: 30, color: AppColors.pineTree),
                  ),
                  const SizedBox(width: 20),
                  TextWidget(
                    text: StringConstants.bookings,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const Icon(Icons.filter_alt_outlined),
                  const SizedBox(width: 10),
                  const Icon(Icons.search_outlined,
                      color: AppColors.primaryButtonColor),
                ],
              ),
              const SizedBox(height: 20),
              
              ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    height: 170,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.white),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: StringConstants.homeCleaning,
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n${StringConstants.jobCompleted}",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greenCrayola,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            TextWidget(
                              text: "23/02/2023",
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.reviewerProfile, width: 44),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Joeie Senon",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.pineTree,
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(5, (index) => Icon(
                                      Icons.star,
                                      color: AppColors.princeTonOrange,
                                      size: 10,
                                    )),
                                  ),
                                  const SizedBox(width: 5),
                                  TextWidget(
                                    text: "486 Ratings",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.pineTree,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            const Icon(Icons.help_outline,
                                color: AppColors.black, size: 20),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextWidget(
                                text: "Need Help",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            const AppDivider(
                              height: 15,
                              width: 1,
                              color: AppColors.black,
                            ),
                            const SizedBox(width: 10),
                            Image.asset(AppImages.pageWithMenu,
                                width: 15, height: 16, color: AppColors.black),
                            const SizedBox(width: 5),
                            TextWidget(
                              text: "View Project",
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

