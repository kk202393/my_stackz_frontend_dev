// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/widgets/service_cat_Bottom_sheet.dart';
import 'package:my_stackz/widgets/snack_bar.dart';
import 'package:my_stackz/widgets/text_widget.dart';

class SubCatView extends StatelessWidget {
  final List<Subcategory> list;
  final VoidCallback onTap;
  final List<String> imgList;
  final String pageTitle;

  const SubCatView(
      {super.key,
      required this.list,
      required this.onTap,
      required this.imgList,
      required this.pageTitle});

  @override
  Widget build(BuildContext context) {
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
                    AppImages.cleaningBanner,
                    width: size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top: 15,
                    left: 10,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.chevron_left_outlined,
                        size: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: size.width * 0.1,
                    child: TextWidget(
                      text: pageTitle,
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
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (list[index].serviceCategories.isNotEmpty) {
                            openServiceCatOptions(
                              context,
                              subcategory: list[index].serviceCategories,
                              lable: list[index].subcategoryName.toString(),
                            );
                          } else {
                            Snack.show(
                              content: "No Service Category found",
                              snackType: SnackType.error,
                              behavior: SnackBarBehavior.floating,
                              context: context,
                            );
                          }
                        },
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
                                imgList[index],
                                width: size.width * 0.5,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextWidget(
                              text: list[index].subcategoryName.toString(),
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            TextWidget(
                              text: '${list[index].price}',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
