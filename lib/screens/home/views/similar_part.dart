// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/user_location.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/string_constants.dart';
import '../../../../utils/input_validator.dart';
import '../../../../widgets/text_form_field_search.dart';
import '../../../../widgets/text_widget.dart';
import '../../../routes/app_pages.dart';

class SimilarPart extends StatelessWidget {
  SimilarPart({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<int> serviceCategoryId = ValueNotifier<int>(-1);
  ValueNotifier<int> subCategoryId = ValueNotifier<int>(-1);
  ValueNotifier<int> categoryId = ValueNotifier<int>(-1);
  ValueNotifier<String> bookingDate = ValueNotifier<String>("");
  ValueNotifier<String> timeSlotId = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    BookingProvider bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            TextWidget(
                text: loginProvider.logInAPIResponse.userAddress.isNotEmpty
                    ? loginProvider.logInAPIResponse.userAddress
                        .first["addresses"][0]["address"]
                    : 'No address found',
                style: context.bodyMedium
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 12)),
            const Spacer(),
            const Icon(Icons.edit_outlined, size: 20),
            const SizedBox(width: 30),
          ],
        ),
        LocationWidget(),
        const SizedBox(height: 20),
        AppTextFieldSearch(
          keyboardType: TextInputType.text,
          validator: (value) => InputValidator.validateFields(value!, "Search"),
          // formKey: controller.formKey,
          controller: homeProvider.searchController,
          hint: 'Search for a Service, Product, Solution',
          fontWeight: FontWeight.w600,
          fontSize: 12,
          textColor: AppColors.darkGray,
          isTyped: homeProvider.isTyped.value,
          onChanged: (value) => homeProvider.onChangeSearchField(value),
          onTap: () {},
          formKey: formKey,
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.maize),
              color: AppColors.maize,
            ),
            child: TextWidget(
                textAlign: TextAlign.center,
                text: StringConstants.servicesByCategory,
                style: context.headlineMedium),
          ),
        ),
        const SizedBox(height: 30),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: homeProvider.categoryList.value
                .map(
                  (element) => InkWell(
                    onTap: () {
                      if (element.categoryId == 1) {
                        homeProvider.categoryId.value = element.categoryId;
                        bookingProvider.categoryId.value = element.categoryId;
                        print(
                            "object${bookingProvider.categoryId.value.toString()}");
                        Navigator.pushNamed(context, Routes.CLEANING);
                      } else if (element.categoryId == 2) {
                        bookingProvider.categoryId.value = element.categoryId;

                        homeProvider.categoryId.value = element.categoryId;
                        Navigator.pushNamed(context, Routes.AIRCON_SERVICES);
                      } else if (element.categoryId == 3) {
                        bookingProvider.categoryId.value = element.categoryId;

                        homeProvider.categoryId.value = element.categoryId;
                        Navigator.pushNamed(context, Routes.HANDYMAN);
                      }
                      // element.categoryId == 1
                      //     ? Navigator.pushNamed(context, Routes.CLEANING,
                      //         arguments: {"subcategories": element.categoryId})
                      //     : element.categoryId == 2
                      //         ? Navigator.pushNamed(
                      //             context, Routes.AIRCON_SERVICES, arguments: {
                      //             "subcategories": element.categoryId
                      //           })
                      //         : Navigator.pushNamed(context, Routes.HANDYMAN,
                      //             arguments: {
                      //                 "subcategories": element.categoryId
                      //               });
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: context.getTheme.primaryColor,
                          child: ClipOval(
                              child: Image.asset(element.categoryId == 1
                                  ? AppImages.cleaningIcon
                                  : element.categoryId == 2
                                      ? AppImages.airconServicing
                                      : AppImages.handymanIcon)),
                        ),
                        const SizedBox(height: 6),
                        TextWidget(
                            text: element.categoryName,
                            style: context.bodyMedium.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 12))
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            TextWidget(
                text: StringConstants.weAreHereToHelp,
                style: context.headlineMedium
                    .copyWith(color: AppColors.princeTonOrange)),
            const Spacer(),
            InkWell(
                onTap: () => homeProvider.onArrowClicked(),
                child: Icon(
                  !homeProvider.isArrowClicked.value
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined,
                  size: 40,
                )),
          ],
        ),
      ],
    );
  }
}

class AddressText extends StatelessWidget {
  final Map<String, dynamic> userData;

  const AddressText({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> addresses = userData['userAddress']?[0]['addresses'] ?? [];

    String addressText = "No address available";

    // Find the default address if it exists
    for (var address in addresses) {
      if (address['isDefault'] == true) {
        addressText = address['address'];
        break;
      }
    }

    // If no default address, use the first address
    if (addressText == "No address available" && addresses.isNotEmpty) {
      addressText = addresses[0]['address'];
    }

    return Text(
      addressText,
      style: const TextStyle(fontSize: 16),
    );
  }
}
