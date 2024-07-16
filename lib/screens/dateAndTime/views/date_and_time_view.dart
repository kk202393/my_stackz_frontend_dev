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
import '../provider/date_and_time_provider.dart';

class DateAndTimeView extends StatelessWidget {
  const DateAndTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    DateAndTimeProvider dateAndTimeProvider =
        Provider.of<DateAndTimeProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;
    List<TimeSlot> timeSlot = homeProvider.homeAPIResponse.timeSlot;

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
            /*TextWidget(
                text: "May 2021",
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w400, fontSize: 22)),
            const SizedBox(height: 20),*/
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
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

            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.gray,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5))
                            ],
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.white),
                        child: Column(children: [
                          TextWidget(
                            text: "01",
                            style: context.titleLarge,
                          ),
                          const SizedBox(height: 15),
                          TextWidget(
                            text: "Sat",
                            style: context.labelMedium,
                          )
                        ])),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.gray,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5))
                            ],
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.white),
                        child: Column(children: [
                          TextWidget(
                            text: "02",
                            style: context.titleLarge,
                          ),
                          const SizedBox(height: 15),
                          TextWidget(
                            text: "Sun",
                            style: context.labelMedium,
                          )
                        ])),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.gray,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5))
                            ],
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.white),
                        child: Column(children: [
                          TextWidget(
                            text: "03",
                            style: context.titleLarge,
                          ),
                          const SizedBox(height: 15),
                          TextWidget(
                            text: "Mon",
                            style: context.labelMedium,
                          )
                        ])),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.gray,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5))
                            ],
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.white),
                        child: Column(children: [
                          TextWidget(
                            text: "04",
                            style: context.titleLarge,
                          ),
                          const SizedBox(height: 15),
                          TextWidget(
                            text: "Tues",
                            style: context.labelMedium,
                          )
                        ]))
                  ]),
            ),
            const SizedBox(height: 20),*/
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5 / 1),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.white),
                        child: TextWidget(
                          text: "${timeSlot[index].timeValue}",
                          style: context.titleLarge,
                        ),
                      ),
                    ),
                itemCount: timeSlot.length),
            const SizedBox(height: 50),
            ButtonWidget(
              buttonText: 'Next',
              onTap: () => Navigator.pushNamed(context, Routes.SELECT_ADDRESS),
            )
          ],
        ),
      )),
    );
  }
}
