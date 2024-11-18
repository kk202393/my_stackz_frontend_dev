// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/api/cloud_function_service.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/cartSummary/provider/chart_summary_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/notifications/provider/polling_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/login_response.dart';

class CartSummaryView extends StatelessWidget {
  final Address selectedAddress;
  final String? selectedTimeSlotId;
  // final DateTime? selectedDate;
  final TextEditingController _textController = TextEditingController();

  CloudFunctionService? _cloudFunctionService = CloudFunctionService();

  CartSummaryView({
    super.key,
    required this.selectedAddress,
    this.selectedTimeSlotId,
    // this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    BookingProvider bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);
    CartSummaryProvider controller =
        Provider.of<CartSummaryProvider>(context, listen: false);
    HomeProvider homeController =
        Provider.of<HomeProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;

    // Format the selected date and time slot
    // String formattedDate = selectedDate != null
    //     ? DateFormat('MMM dd yyyy').format(selectedDate!)
    //     : "No date selected";
    String formattedTimeSlot = selectedTimeSlotId ?? "No time slot selected";

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.cultured,
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: homeController.isLoading,
        builder: (BuildContext context, value, Widget? child) {
          return Stack(
            children: [
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.chevron_left_outlined,
                              size: 30, color: AppColors.pineTree),
                        ),
                        SizedBox(width: size.width * 0.3),
                        TextWidget(
                            text: StringConstants.cartSummary,
                            style: context.headlineSmall
                                .copyWith(fontWeight: FontWeight.w700)),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextWidget(
                        text: StringConstants.address,
                        style: context.headlineSmall),
                    const SizedBox(height: 10),
                    TextWidget(
                      text: selectedAddress.address ?? "No address",
                      style: context.headlineSmall
                          .copyWith(color: AppColors.spanishGray),
                    ),
                    const SizedBox(height: 10),
                    TextWidget(
                      text: selectedAddress.city ?? "No city",
                      style: context.headlineSmall
                          .copyWith(color: AppColors.spanishGray),
                    ),
                    const SizedBox(height: 10),
                    TextWidget(
                      text: selectedAddress.pincode ?? "No pincode",
                      style: context.headlineSmall
                          .copyWith(color: AppColors.spanishGray),
                    ),
                    const SizedBox(height: 10),
                    // Print the selected address ID
                    TextWidget(
                      text: 'Address ID: ${selectedAddress.id ?? "No ID"}',
                      style: context.headlineSmall
                          .copyWith(color: AppColors.spanishGray),
                    ),
                    const SizedBox(height: 25),
                    TextWidget(
                        text: StringConstants.dateAndTime,
                        style: context.headlineSmall
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    ValueListenableBuilder(
                      valueListenable: bookingProvider.bookingDate,
                      builder: (context, String bookingDate, _) {
                        return ValueListenableBuilder(
                          valueListenable: bookingProvider.timeSlotId,
                          builder: (context, String timeSlotId, _) {
                            String formattedDate = bookingDate.isNotEmpty
                                ? bookingDate
                                : "No Date Selected";
                            String formattedTimeSlot = timeSlotId.isNotEmpty
                                ? timeSlotId
                                : "No Time Slot Selected";

                            return TextWidget(
                              text: "$formattedDate \nat $formattedTimeSlot",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppColors.spanishGray,
                                  ),
                            );
                          },
                        );
                      },
                    ),
                    TextWidget(
                        text: StringConstants.details,
                        style: context.headlineSmall
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(AppImages.repairOrder, width: 60),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: "AC Service",
                                style: context.headlineSmall),
                            const SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                                    text: "S\$. 149  ",
                                    style: context.headlineSmall
                                        .copyWith(color: AppColors.spanishGray),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: "S\$. 149",
                                      style: context.headlineSmall)
                                ])),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => controller.onClickRemoveServices(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.primaryButtonColor),
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
                        ),
                        const SizedBox(width: 20),
                        ValueListenableBuilder(
                            valueListenable: controller.numberOfServices,
                            builder: (context, value, child) {
                              return TextWidget(
                                text: "${controller.numberOfServices.value}",
                                style: GoogleFonts.montserrat(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              );
                            }),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () => controller.onClickAddServices(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.primaryButtonColor),
                                borderRadius: BorderRadius.circular(3),
                                color: AppColors.primaryButtonColor),
                            child: TextWidget(
                              text: "+",
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    TextWidget(
                        text: StringConstants.discounts,
                        style: context.headlineSmall
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    TextWidget(
                        text: StringConstants.enterCouponCode,
                        style: context.headlineSmall
                            .copyWith(color: AppColors.spanishGray)),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () async {
                          // final bookingProvider =
                          //     Provider.of<BookingProvider>(context, listen: false);

                          // print(
                          //     "Booking ID before deletion: ${bookingProvider.bookingResponse?.consumerOrderDetails.categoryId}");
                          // bool success = await bookingProvider.getDeleteUser();

                          // if (success) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         content: Text('Booking deleted successfully.')),
                          //   );
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         content: Text('Failed to delete booking.')),
                          //   );
                          // }
                        },
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            suffixIcon: InkWell(
                              onTap: () async {
                                print("applied");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "APPLY CODE",
                                  style: context.headlineSmall.copyWith(
                                    color: AppColors.primaryButtonColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // child: InkWell(
                      //   onTap: () async {
                      //     // final bookingProvider =
                      //     //     Provider.of<BookingProvider>(context, listen: false);

                      //     // print(
                      //     //     "Booking ID before deletion: ${bookingProvider.bookingResponse?.consumerOrderDetails.categoryId}");
                      //     // bool success = await bookingProvider.getDeleteUser();

                      //     // if (success) {
                      //     //   ScaffoldMessenger.of(context).showSnackBar(
                      //     //     const SnackBar(
                      //     //         content: Text('Booking deleted successfully.')),
                      //     //   );
                      //     // } else {
                      //     //   ScaffoldMessenger.of(context).showSnackBar(
                      //     //     const SnackBar(
                      //     //         content: Text('Failed to delete booking.')),
                      //     //   );
                      //     // }
                      //   },
                      //   child: TextWidget(
                      //       text: StringConstants.applyCode,
                      //       style: context.headlineSmall
                      //           .copyWith(color: AppColors.primaryButtonColor)),
                      // ),
                    ),

                    const SizedBox(height: 20),
                    TextWidget(
                        text: StringConstants.frequentlyAddedTogether,
                        style: context.headlineSmall
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: size.height * 0.4,
                      child: ListView.separated(
                        shrinkWrap: true,
                        controller: controller.scrollController,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: AppColors.gray),
                                  color: AppColors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                        ),
                                        child: Image.asset(
                                          AppImages.homeDesign,
                                          width: size.width * 0.6,
                                          height: size.height * 0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                AppColors.white
                                                    .withOpacity(0.2),
                                                AppColors.black
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text: homeProvider
                                                .homeAPIResponse
                                                .allCategories[index]
                                                .subcategories[index]
                                                .subcategoryName
                                                .toString(),
                                            style: context.headlineSmall
                                                .copyWith(
                                                    color:
                                                        AppColors.spanishGray)),
                                        TextWidget(
                                            text: "S\$. 149",
                                            style: context.headlineSmall)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: size.width * 0.02,
                          );
                        },
                        itemCount:
                            homeProvider.homeAPIResponse.allCategories.length,
                      ),
                    ),
                    const SizedBox(height: 50),
                    ButtonWidget(
                      buttonText: 'Confirm Order',
                      onTap: () async {
                        BookingProvider bookingProvider =
                            Provider.of<BookingProvider>(context,
                                listen: false);

                        int serviceCategory =
                            bookingProvider.serviceCategoryId.value;
                        int subCategory = bookingProvider.subCategoryId.value;
                        int category = bookingProvider.categoryId.value;

                        // String selectedDateString = selectedDate != null
                        //     ? DateFormat('MMM/dd/yyyy').format(selectedDate!)
                        //     : "";

                        String? selectedTimeSlotId =
                            bookingProvider.timeSlotId.value.isNotEmpty
                                ? bookingProvider.timeSlotId.value
                                : null;

                        String? selectedAddressId = selectedAddress != null
                            ? selectedAddress.id.toString()
                            : null;

                        int? selectedAddressIndexValue =
                            selectedAddress != null ? 1 : null;

                        if (selectedTimeSlotId == null ||
                            selectedAddressId == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please select a valid date, time slot, and address.'),
                            ),
                          );
                          return;
                        }
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text(
                                "Are you sure",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    await bookingProvider
                                        .callBookingPageApi(
                                      context,
                                      serviceCategory,
                                      subCategory,
                                      category,
                                      selectedTimeSlotId,
                                      selectedAddressId,
                                      selectedAddressIndexValue,
                                    )
                                        .then(
                                      (value) async {
                                        if (value) {
                                          homeController.isLoading.value = true;

                                          // calling notification api
                                          try {
                                            List<String> providerIds =
                                                []; // Replace with actual provider IDs
                                            providerIds.add(bookingProvider
                                                    .bookingAPIResponse
                                                    ?.userDeviceInfo!
                                                    .userId
                                                    .toString() ??
                                                '670cb3281cfb1c9d3cf0c0fb');
                                            String title =
                                                'You have an upcoming service';
                                            String body =
                                                'Do you want to accept?';

                                            // Additional data that needs to be passed along with the notification
                                            Map<String, dynamic> data = {
                                              // booking_id
                                              'request_id': bookingProvider
                                                      .bookingAPIResponse
                                                      ?.consumerOrderDetails
                                                      ?.bookingId
                                                      ?.toString()
                                                      ?.trim() ??
                                                  'CMS0003', // Example request ID

                                              // optional
                                              'user_name':
                                                  'John Doe', // Example user name
                                            };

                                            String screen =
                                                'providerScreen'; // Specify the screen to open

                                            // Send the notification with screen info and data payload
                                            await _cloudFunctionService!
                                                .sendNotificationToProviders(
                                              providerIds,
                                              title,
                                              body,
                                              screen,
                                              data,
                                            );

                                            Provider.of<PollingProvider>(
                                                    context,
                                                    listen: false)
                                                .startPolling(bookingProvider
                                                    .bookingAPIResponse!
                                                    .consumerOrderDetails!
                                                    .bookingId
                                                    .toString()
                                                    .trim()); //bookingId // Start polling for booking status
                                          } catch (e) {
                                            print(
                                                'Error sending notification: $e');
                                          }

                                          // Navigator.pushNamed(
                                          //     context, Routes.BOOKING_DETAILS);
                                          Navigator.of(context).pop();
                                        }
                                      },
                                    );
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      buttonText: 'Update Booking Status',
                      onTap: () async {
                        BookingProvider bookingProvider =
                            Provider.of<BookingProvider>(context,
                                listen: false);

                        final bookingAPIResponse =
                            bookingProvider.bookingAPIResponse;
                        final consumerOrderDetails =
                            bookingAPIResponse?.consumerOrderDetails;
                        final bookingStatus =
                            consumerOrderDetails?.consumerBookingStatus;

                        String? bookingId =
                            consumerOrderDetails?.bookingId != null &&
                                    consumerOrderDetails!.bookingId!.isNotEmpty
                                ? consumerOrderDetails.bookingId
                                : null;

                        String? bookingStatusId =
                            bookingStatus?.bookingStatus != null &&
                                    bookingStatus!.bookingStatus!.isNotEmpty
                                ? bookingStatus.bookingStatus
                                : null;

                        bool _success =
                            await bookingProvider.updateBookingStatus(
                          context,
                          bookingId,
                          bookingStatusId,
                        );
                        print("Success: $_success");

                        if (_success) {
                          Navigator.pushNamed(context, Routes.BOOKING_DETAILS);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Status: ${bookingStatus?.bookingStatus ?? 'Unknown status'}',
                              ),
                            ),
                          );
                        }
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
              homeController.isLoading.value
                  ? Utils.getLoadingUI(context)
                  : const SizedBox(),
            ],
          );
        },
      )),
    );
  }
}
