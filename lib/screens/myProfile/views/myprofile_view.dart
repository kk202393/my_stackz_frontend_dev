import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/text_widget.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () =>Navigator.pop(context),
                child: const Icon(Icons.chevron_left_outlined,
                    size: 30, color: AppColors.pineTree),
              ),
              SizedBox(width: width * 0.3),
              TextWidget(
                  text: StringConstants.profile, style: context.headlineSmall),
            ],
          ),
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 70,
            backgroundColor: context.getTheme.primaryColor,
            child: ClipOval(child: Image.asset(AppImages.profileIcon)),
          ),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  text: StringConstants.profile,
                  style: context.bodyMedium
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 14)),
              const Spacer(),
              InkWell(
                  onTap: () => Navigator.pushNamed(context,Routes.PERSONAL_DETAILS),
                  child: const Icon(Icons.chevron_right, size: 20))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  text: StringConstants.history,
                  style: context.bodyMedium
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 14)),
              const Spacer(),
              InkWell(
                  onTap: () => Navigator.pushNamed(context,Routes.HISTORY),
                  child: const Icon(Icons.chevron_right, size: 20))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  text: StringConstants.settings,
                  style: context.bodyMedium
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 14)),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.pushNamed(context,Routes.SETTINGS),
                  child: const Icon(Icons.chevron_right, size: 20))
            ],
          ),
        ],
      ),
    );
  }
}