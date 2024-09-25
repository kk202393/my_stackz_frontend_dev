import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/cleaning/provider/cleaning_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/widgets/open_schedule.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/string_constants.dart';
import '../../../../widgets/text_widget.dart';
import '../../../models/home_page_response.dart';

openServiceCatOptions(BuildContext context,
    {required List<ServiceCategory> subcategory, required String lable}) {
  final size = MediaQuery.of(context).size;

  showModalBottomSheet(
    // useSafeArea: true,
    context: context,
    isScrollControlled: true,
    // barrierColor: AppColors.black1.withOpacity(0.5),
    // isScrollControlled: true,
    // showDragHandle: false,
    // clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(26),
        topLeft: Radius.circular(26),
      ),
    ),
    builder: (builder) {
      return SizedBox(
         height: size.height * 0.6,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 12,right: 12, top: 15,bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   width: size.width * 0.3,
              //   height: 5,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       border: Border.all(color: AppColors.silverSand),
              //       color: AppColors.silverSand),
              // ),
              const SizedBox(height: 10),
              TextWidget(
                text: lable,
              ),
              const SizedBox(height: 20),
              subcategory.isNotEmpty
                  ? SizedBox(
                      height: size.height * 0.5,
                      child: GridView.builder(
                        // padding:  const EdgeInsets.only(bottom: 25),
                        itemCount: subcategory.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemBuilder: (BuildContext context, int index) {
                          ServiceCategory item = subcategory[index];
                          return InkWell(
                            onTap: () {
                              BookingProvider bookingProvider =
                                  Provider.of<BookingProvider>(context,
                                      listen: false);
                              HomeProvider homeProvider =
                                  Provider.of<HomeProvider>(context,
                                      listen: false);
                              // bookingProvider.serviceCategoryId.value =
                              //     homeProvider
                              //         .homeAPIResponse
                              //         .allCategories[
                              //             bookingProvider.categoryId.value]
                              //         .subcategories[
                              //             bookingProvider.subCategoryId.value]
                              //         .serviceCategories[index]
                              //         .servicecategoryId!;
                              openScheduleService(context, subcategory[index]);
                              // openTypeServiceAirconOptions(airconController,
                              //     context, index,);
        
                              // openScheduleAirconService(
                              //     airconController, context, index, item);
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
                      ),
                    )
                  : const Text('No services found'),
            ],
          ),
        ),
      );
    },
  );
}
