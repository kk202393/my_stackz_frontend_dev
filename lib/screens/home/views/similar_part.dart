import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_stackz/models/home_page_response.dart';
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
   HomeProvider controller;

   SimilarPart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
         LoginProvider loginController = Provider.of<LoginProvider>(context, listen: false);
         HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);

      // final LoginProvider loginController = Get.put(LoginProvider());
    // var addressList = <Addresses>[].obs;
    

    // void parseLoginResponse(String responseBody) {
    //   final responseJson = jsonDecode(responseBody);
    //   final loginResponse = LoginResponse.fromJson(responseJson);
    //   // if (loginResponse.userAddress.isNotEmpty) {
    //   //   addressList.value = loginResponse.userAddress[0].addresses;
    //   // }
    //   defaultAddress.value =
    //       addressList.isNotEmpty ? addressList[0].address : 'No address found';
    // }

    // print(" cjsndcjsdcsdc${defaultAddress}");
    // final Map<String, dynamic> userData;SSS
    
// print("lst=${loginController.addressList}");
    final width = MediaQuery.of(context).size.width;
 print("this is list ${homeProvider.homeAPIResponse.allCategories}");
    return Column(
      children: [
        Row(
          children: [
              //  TextWidget(
              //       text: loginController.logInAPIResponse.userAddress[0]["addresses"][0]['address'],
              //       style: context.bodyMedium
              //           .copyWith(fontWeight: FontWeight.w600, fontSize: 17)),

            //  Obx(() {
            //   if (loginController.addressList.isEmpty) {
            //     return Text('No addresses found');
            //   } else {
            //     return Column(
            //       children: loginController.addressList.map((address) {
            //         return Text(
            //           '${address.address}',
            //           style: const TextStyle(fontSize: 15),
            //         );
            //       }).toList(),
            //     );
            //   }
            // }),
             
            // Obx(() {
              // TextWidget(
              //       text: controller.address.value,
              //       style: context.bodyMedium
              //           .copyWith(fontWeight: FontWeight.w600, fontSize: 17));
              // if (addressList.isNotEmpty) {
              //   return Column(
              //     children: addressList.map((address) {
              //       return Text(
              //         '${address.address}, ${address.city}, ${address.pincode},${address.latitude},${address.longitude}',
              //         style: TextStyle(fontSize: 15),
              //       );
              //     }).toList(),
              //   );
              // } else {
              //   return Text('No addresses found');
              // }
            // }),
            const Spacer(),
            const Icon(Icons.edit_outlined, size: 20),
            const SizedBox(width: 30)
          ],
        ),
        const SizedBox(height: 20),
      AppTextFieldSearch(
            keyboardType: TextInputType.text,
            validator: (value) =>
                InputValidator.validateFields(value!, "Search"),
            // formKey: controller.formKey,
            controller: controller.searchController,
            hint: 'Search for a Service, Product, Solution',
            fontWeight: FontWeight.w600,
            fontSize: 12,
            textColor: AppColors.darkGray,
            isTyped: controller.isTyped.value,
            onChanged: (value) => controller.onChangeSearchField(value),
            onTap: () {}, formKey: loginController.formKey,),
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
                children: controller.categoryList.value
                    .map((element) => InkWell(
                          onTap: () {
                            print("element=${HomePageResponse}");
                            print("this is data ${element.subcategories[0].subcategoryName}");
                            print("this is data ${element.subcategories[2].subcategoryName}");

                            element.categoryId == 1
                                ? 
                                Navigator.pushNamed(context, Routes.CLEANING, arguments: {
                                    "subcategories": element.categoryId
                                  })
                                : element.categoryId == 2
                                    ? Navigator.pushNamed(context,Routes.AIRCON_SERVICES,
                                        arguments: {
                                            "subcategories":
                                                element.categoryId
                                          })
                                    :Navigator.pushNamed(context,Routes.HANDYMAN, arguments: {
                                        "subcategories": element.categoryId
                                      });
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
                                  // text: "last",
                                  text: "${element.categoryName}",
                                  style: context.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12))
                            ],
                          ),
                        ))
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
                onTap: () => controller.onArrowClicked(),
                child: Icon(
                      !controller.isArrowClicked.value
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
      style: TextStyle(fontSize: 16),
    );
  }
}
