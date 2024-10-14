// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
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
    List<Map<String, dynamic>> allItem = homeProvider.allItem();

    final width = MediaQuery.of(context).size.width;

    final loginResponse = loginProvider.logInAPIResponse;

    final userAddress = loginResponse?.userAddress ?? [];
    final defaultAddress = userAddress.isNotEmpty
        ? userAddress[0]
            .addresses
            ?.firstWhere(
              (address) => address.isDefault,
              orElse: () => Address(
                id: '',
                isVerified: false,
                isDefault: false,
                address: 'No address found',
                city: '',
                pincode: '',
                longitude: '',
                latitude: '',
              ),
            )
            .address
        : 'No address found';

    return Column(
      children: [
        // const LocationWidget(),
        Row(
          children: [
            TextWidget(
              text: defaultAddress.toString(),
              style: context.bodyMedium
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
            ),
            const Spacer(),
            const Icon(Icons.edit_outlined, size: 20),
            const SizedBox(width: 30),
          ],
        ),

        const SizedBox(height: 20),
        AppTextFieldSearch(
          keyboardType: TextInputType.text,
          validator: (value) => InputValidator.validateFields(value!, "Search"),
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
              style: context.headlineMedium,
            ),
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
                        homeProvider.categoryId.value = element.categoryId!;
                        bookingProvider.categoryId.value = element.categoryId!;
                        Navigator.pushNamed(context, Routes.CLEANING,
                            arguments: {
                              "itemList": allItem[0]["itemList"],
                              "imgPath": allItem[0]["imgPath"],
                              "titleName": allItem[0]["titleName"],
                           
                            });
                      } else if (element.categoryId == 2) {
                        bookingProvider.categoryId.value = element.categoryId!;
                        homeProvider.categoryId.value = element.categoryId!;
                        Navigator.pushNamed(context, Routes.CLEANING,
                            arguments: {
                              "itemList": allItem[1]["itemList"],
                              "imgPath": allItem[1]["imgPath"],
                              "titleName": allItem[1]["titleName"],
                           
                            });
                      } else if (element.categoryId == 3) {
                        bookingProvider.categoryId.value = element.categoryId!;
                        homeProvider.categoryId.value = element.categoryId!;
                        Navigator.pushNamed(context, Routes.CLEANING,
                            arguments: {
                              "itemList": allItem[2]["itemList"],
                              "imgPath": allItem[2]["imgPath"],
                              "titleName": allItem[2]["titleName"],
                            
                            });
                      }
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: context.getTheme.primaryColor,
                          child: ClipOval(
                            child: Image.asset(
                              element.categoryId == 1
                                  ? AppImages.cleaningIcon
                                  : element.categoryId == 2
                                      ? AppImages.airconServicing
                                      : AppImages.handymanIcon,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextWidget(
                          text: element.categoryName ?? '',
                          style: context.bodyMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
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
              style: context.headlineMedium.copyWith(
                color: AppColors.princeTonOrange,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => homeProvider.onArrowClicked(),
              child: Icon(
                !homeProvider.isArrowClicked.value
                    ? Icons.keyboard_arrow_up_outlined
                    : Icons.keyboard_arrow_down_outlined,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AddressText extends StatelessWidget {
  final LoginResponse loginResponse;

  const AddressText({Key? key, required this.loginResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addresses = loginResponse.userAddress?.first.addresses ?? [];

    String addressText = "No address available";

    for (var address in addresses) {
      if (address.isDefault) {
        addressText = address.address;
        break;
      }
    }

    if (addressText == "No address available" && addresses.isNotEmpty) {
      addressText = addresses[0].address;
    }

    return Text(
      addressText,
      style: const TextStyle(fontSize: 16),
    );
  }
}
