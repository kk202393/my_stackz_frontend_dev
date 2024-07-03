import 'package:flutter/material.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';

import '../constants/app_colors.dart';
import 'text_widget.dart';

class AppTabBar extends StatelessWidget {
  final TabController tabController;
  final int selectedIndex;
  final ValueChanged<int>? onTap;
  final String text;
  final String text1;
  final String counterText;
  final String counterText1;

  const AppTabBar(
      {super.key,
      required this.tabController,
      required this.selectedIndex,
      this.onTap,
      required this.text,
      required this.text1,
      required this.counterText,
      required this.counterText1});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        controller: tabController,
        indicatorColor: Colors.transparent,//context.getTheme.indicatorColor,
        onTap: onTap,
        tabs: [
          Tab(
            icon: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              TextWidget(
                  text: text,
                  style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: selectedIndex == 0
                          ? context.bodySmall.color!
                          : context.bodySmall.color!.withOpacity(0.5))),
              const SizedBox(width: 5),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.bgColor)),
                  child: TextWidget(
                      text: counterText,
                      style: context.titleSmall.copyWith(
                          fontWeight: FontWeight.w700, color: AppColors.black)))
            ]),
          ),
        ]);
  }
}
