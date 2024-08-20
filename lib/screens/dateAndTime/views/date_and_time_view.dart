import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/home_page_response.dart';
import '../../home/controllers/home_controller.dart';

class DateAndTimeView extends StatefulWidget {
  const DateAndTimeView({super.key});

  @override
  _DateAndTimeViewState createState() => _DateAndTimeViewState();
}

class _DateAndTimeViewState extends State<DateAndTimeView> {
  int _selectedSlotIndex = -1;
  String? _selectedTimeSlotId;

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
                  // Handle date change
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
                              _selectedSlotIndex =
                                  index; // Update selected index
                              _selectedTimeSlotId = timeSlot[index]
                                  .id; // Store the selected time slot ID
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.white),
                              borderRadius: BorderRadius.circular(23),
                              color: _selectedSlotIndex == index
                                  ? AppColors.mandarin // Selected color
                                  : AppColors.white, // Default color
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
                  if (_selectedTimeSlotId != null) {
                    print("Selected Time Slot ID: $_selectedTimeSlotId");
                  } else {
                    print("No time slot selected.");
                  }

                  // Proceed to the next screen
                  Navigator.pushNamed(context, Routes.SELECT_ADDRESS);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
