import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/handyman/provider/handyman_provider.dart';
import 'package:my_stackz/screens/handyman/views/handyman_dialogue_box.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/string_constants.dart';
import '../../../../widgets/text_widget.dart';
import '../../../models/home_page_response.dart';
import '../../cleaning/views/cleaning_dialogue_box.dart';
import '../../home/controllers/home_controller.dart';

openHandymanOptions(HandymanProvider controller, context,
    int subcategoriesIndex, Subcategory subcategory) {
  final size = MediaQuery.of(context).size;

  showModalBottomSheet(
      useSafeArea: true,
      context: context,
      barrierColor: AppColors.black1.withOpacity(0.5),
      isScrollControlled: true,
      showDragHandle: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(26),
          topLeft: Radius.circular(26),
        ),
      ),
      builder: (builder) {
        return Builder(builder: (builder) {
          HomeProvider homeProvider =
              Provider.of<HomeProvider>(context, listen: false);
          HandymanProvider handymanProvider =
              Provider.of<HandymanProvider>(context, listen: false);

          return SizedBox(
            height: size.height * 0.6,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.3,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.silverSand),
                        color: AppColors.silverSand),
                  ),
                  const SizedBox(height: 10),
                  const TextWidget(
                    text: StringConstants.handymanRepair,
                  ),
                  const SizedBox(height: 20),
                  subcategory.serviceCategories.isNotEmpty
                      ? GridView.builder(
                          itemCount: subcategory.serviceCategories.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (BuildContext context, int index) {
                            ServiceCategory item =
                                subcategory.serviceCategories[index];
                            return InkWell(
                              onTap: () {
                                BookingProvider bookingProvider =
                                    Provider.of<BookingProvider>(context,
                                        listen: false);
                                bookingProvider.serviceCategoryId.value =
                                    homeProvider
                                        .homeAPIResponse
                                        .allCategories[
                                            bookingProvider.categoryId.value]
                                        .subcategories[
                                            bookingProvider.subCategoryId.value]
                                        .serviceCategories[index]
                                        .servicecategoryId!;
                                print(
                                    "object3${bookingProvider.serviceCategoryId.value}");
                                openScheduleHandymanService(
                                    handymanProvider, context, index, item);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.darkGray),
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.white),
                                    child: Image.asset(
                                      AppImages.room,
                                      width: size.width * 0.45,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  TextWidget(
                                    text: item.servicecategoryName!,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      : Text('No services found'),
                ],
              ),
            ),
          );
        });
      });
}
