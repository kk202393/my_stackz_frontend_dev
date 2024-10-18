import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/selectAddress/views/add_new_address.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../login/provider/login_provider.dart';

class SelectAddressView extends StatefulWidget {
  const SelectAddressView({
    Key? key,
    required this.selectedTimeSlotId,
    required this.selectedDate,
  }) : super(key: key);

  final String selectedTimeSlotId;
  final String selectedDate;

  @override
  _SelectAddressViewState createState() => _SelectAddressViewState();
}

class _SelectAddressViewState extends State<SelectAddressView> {
  late LoginProvider loginProvider;
  late BookingProvider bookingProvider;
  late List<dynamic> userAddressList;

  @override
  void initState() {
    super.initState();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    bookingProvider = Provider.of<BookingProvider>(context, listen: false);

    // Initialize the address list
    userAddressList =
        (loginProvider.logInAPIResponse?.userAddress?.isNotEmpty ?? false)
            ? loginProvider.logInAPIResponse!.userAddress!.first.addresses ?? []
            : [];

    final defaultAddressIndex =
        userAddressList.indexWhere((address) => address.isDefault);
    if (defaultAddressIndex != -1 &&
        bookingProvider.selectedAddressIndex.value == null) {
      bookingProvider.selectedAddressIndex.value = defaultAddressIndex;
    }
  }

  void showAddressForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
          ),
          child: Wrap(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AddressForm(onFormSubmitted: (updatedAddressList) {
                    setState(() {
                      userAddressList = updatedAddressList;
                    });
                    Navigator.pop(context);
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 26.0,
          ),
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
                  SizedBox(width: width * 0.15),
                  TextWidget(
                      text: "Select Address", style: context.headlineSmall)
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        showAddressForm(context);
                      },
                      child: const Icon(Icons.add,
                          color: AppColors.black, size: 15)),
                  const SizedBox(width: 20),
                  TextWidget(
                      text: StringConstants.addNewAddress,
                      style: context.headlineSmall),
                ],
              ),
              const SizedBox(height: 10),
              AppDivider(width: width),
              const SizedBox(height: 10),
              if (userAddressList.isNotEmpty)
                ValueListenableBuilder<int?>(
                  valueListenable: bookingProvider.selectedAddressIndex,
                  builder: (context, selectedIndex, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: userAddressList.length,
                      itemBuilder: (context, index) {
                        final address = userAddressList[index];
                        final isSelected = selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (bookingProvider.selectedAddressIndex.value ==
                                  index) {
                                bookingProvider.selectedAddressIndex.value =
                                    null;
                              } else {
                                bookingProvider.selectedAddressIndex.value =
                                    index;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue[100]
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 2),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                  color:
                                      isSelected ? Colors.blue : AppColors.gray,
                                  size: 20,
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                          text: loginProvider.logInAPIResponse
                                                  ?.user?.username ??
                                              '',
                                          style: context.headlineSmall),
                                      const SizedBox(height: 10),
                                      TextWidget(
                                          text: address.address ?? '',
                                          style: context.headlineSmall.copyWith(
                                              color: AppColors.spanishGray)),
                                      const SizedBox(height: 5),
                                      TextWidget(
                                          text:
                                              "${address.city ?? ''}, ${address.pincode ?? ''}",
                                          style: context.headlineSmall.copyWith(
                                              color: AppColors.spanishGray)),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.edit_outlined,
                                    color: AppColors.black, size: 18),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              else
                const TextWidget(
                    text: 'No addresses found',
                    style: TextStyle(color: AppColors.gray)),
              const SizedBox(height: 50),
              ButtonWidget(
                buttonText: 'Continue',
                onTap: () {
                  if (bookingProvider.selectedAddressIndex.value != null) {
                    final selectedAddress = userAddressList[
                        bookingProvider.selectedAddressIndex.value!];

                    String selectedTimeSlotId =
                        bookingProvider.timeSlotId.value;

                    if (selectedTimeSlotId.isNotEmpty) {
                      Navigator.pushNamed(
                        context,
                        Routes.CART_SUMMARY,
                        arguments: {
                          'selectedAddress': selectedAddress,
                          'selectedTimeSlotId': selectedTimeSlotId,
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a time slot and date.'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select an address.'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
