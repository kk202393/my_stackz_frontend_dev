import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/api/cloud_function_service.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/notifications/provider/polling_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/snack_bar.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../models/home_page_response.dart';
import '../../home/controllers/home_controller.dart';

class DateAndTimeView extends StatefulWidget {
  const DateAndTimeView({super.key});

  @override
  _DateAndTimeViewState createState() => _DateAndTimeViewState();
}

class _DateAndTimeViewState extends State<DateAndTimeView> {
  int _selectedSlotIndex = -1;
  final _cloudFunctionService =
      CloudFunctionService(); // Initialize your service here
  String? _selectedTimeSlotId;
  DateTime? _selectedDate;

  // Declare your ValueNotifiers here
  ValueNotifier<int> serviceCategoryId = ValueNotifier<int>(1);
  ValueNotifier<int> subCategoryId = ValueNotifier<int>(1);
  ValueNotifier<int> categoryId = ValueNotifier<int>(1);
  ValueNotifier<String> bookingDate = ValueNotifier<String>("");
  ValueNotifier<String> timeSlotId = ValueNotifier<String>("");
  ValueNotifier<String> bookingId = ValueNotifier<String>("");
  ValueNotifier<String> useraddressId = ValueNotifier<String>("");
  ValueNotifier<int?> selectedAddressIndex = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    List<TimeSlot> timeSlot = homeProvider.homeAPIResponse.timeSlot;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.chevron_left_outlined,
                        size: 30, color: AppColors.pineTree),
                  ),
                  SizedBox(width: size.width * 0.15),
                  TextWidget(
                      text: StringConstants.selectDateAndTime,
                      style: context.headlineSmall)
                ],
              ),
              SizedBox(height: size.height * 0.04),
              TextWidget(
                text: StringConstants.whenWouldYouLikeYourServices,
                style: context.headlineMedium,
              ),
              SizedBox(height: size.height * 0.03),
              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  setState(() {
                    _selectedDate = selectedDate;
                  });
                },
                headerProps: const EasyHeaderProps(
                  monthPickerType: MonthPickerType.switcher,
                  dateFormatter: DateFormatter.fullDateDMY(),
                ),
                dayProps: const EasyDayProps(
                  dayStructure: DayStructure.dayStrDayNum,
                  activeDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.orangeYellow, AppColors.mandarin],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 5 / 1),
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSlotIndex = index;
                              _selectedTimeSlotId = timeSlot[index].id;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.white),
                              borderRadius: BorderRadius.circular(23),
                              color: _selectedSlotIndex == index
                                  ? AppColors.mandarin
                                  : AppColors.white,
                            ),
                            child: TextWidget(
                              text: "${timeSlot[index].timeValue}",
                              style: context.titleLarge,
                            ),
                          ),
                        ),
                      ),
                  itemCount: timeSlot.length),
              const SizedBox(height: 50),
              ButtonWidget(
                buttonText: 'Next',
                onTap: () {
                  if (_selectedTimeSlotId != null && _selectedDate != null) {
                    String selectedDateString =
                        DateFormat('MMM dd yyyy').format(_selectedDate!);

                    BookingProvider bookingProvider =
                        Provider.of<BookingProvider>(context, listen: false);

                    bookingProvider.bookingDate.value = selectedDateString;
                    bookingProvider.timeSlotId.value = _selectedTimeSlotId!;

                    // ERROR CODE
                    Navigator.pushNamed(
                      context,
                      Routes.SELECT_ADDRESS,
                      arguments: {
                        'selectedTimeSlotId': bookingProvider.timeSlotId.value,
                        'selectedDate': bookingProvider.bookingDate.value,
                      },
                    );

                    //TEMPORARY CODE
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => NotificationsView()));
                  } else {
                    Snack.show(
                        content: "No time slot or date selected.",
                        snackType: SnackType.error,
                        behavior: SnackBarBehavior.floating,
                        context: context);
                  }
                },
                // onTap: () async {
                //   if (true) {
                //     // homeController.isLoading.value = true;

                //     try {
                //       BookingProvider bookingProvider =
                //           Provider.of<BookingProvider>(context, listen: false);
                //       String bookingId = bookingProvider.bookingId.value;
                //       List<String> providerIds = [];
                //       providerIds.add(bookingProvider
                //               .bookingAPIResponse?.userDeviceInfo!.userId
                //               .toString() ??
                //           '');

                //       String title = 'You have upcomming service';
                //       String body = 'Do you want to accept?';

                //       Map<String, dynamic> data = {
                //         //booking_id
                //         'request_id':
                //             bookingId.toString().trim(), // Example request ID

                //         // optional
                //         'user_name': 'John Doe', // Example user name
                //       };
                //       String screen =
                //           'providerScreen'; // Specify the screen to open

                //       await _cloudFunctionService.sendNotificationToProviders(
                //           providerIds, title, body, screen, data);
                //       Provider.of<PollingProvider>(context, listen: false)
                //           .startPolling(bookingId);
                //     } catch (error) {
                //       print("Error sending notification: $error");
                //     }
                //   }
                // },
              )
            ],
          ),
        ),
      ),
    );
  }
}
