// import 'package:flutter/material.dart';
// import 'package:my_stackz/constants/app_colors.dart';
// import 'package:my_stackz/constants/string_constants.dart';
// import 'package:my_stackz/models/login_response.dart';
// import 'package:my_stackz/routes/app_pages.dart';
// import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
// import 'package:my_stackz/screens/selectAddress/provider/select_address_provider.dart';
// import 'package:my_stackz/screens/selectAddress/views/add_new_address.dart';
// import 'package:my_stackz/themes/custom_text_theme.dart';
// import 'package:my_stackz/widgets/app_divider.dart';
// import 'package:my_stackz/widgets/button_widget.dart';
// import 'package:my_stackz/widgets/text_widget.dart';
// import 'package:provider/provider.dart';

// import '../../login/provider/login_provider.dart';

// class SelectAddressView extends StatefulWidget {
//   const SelectAddressView({
//     Key? key,
//     required this.selectedTimeSlotId,
//     required this.selectedDate,
//   }) : super(key: key);

//   final String selectedTimeSlotId;
//   final String selectedDate;

//   @override
//   _SelectAddressViewState createState() => _SelectAddressViewState();
// }

// class _SelectAddressViewState extends State<SelectAddressView> {
//   late LoginProvider loginProvider;
//   late BookingProvider bookingProvider;
//   late SelectAddressProvider selectAddressProvider;

//   @override
//   void initState() {
//     super.initState();
//     loginProvider = Provider.of<LoginProvider>(context, listen: false);
//     bookingProvider = Provider.of<BookingProvider>(context, listen: false);
//     selectAddressProvider =
//         Provider.of<SelectAddressProvider>(context, listen: false);

//     // Initialize the address list from the loginProvider
//     // final userAddresses =
//     //     loginProvider.logInAPIResponse?.userAddress?.first.addresses ?? [];
//     final userAddresses = loginProvider.addressList ?? [];

//     selectAddressProvider.setUserAddressList(userAddresses.cast<Address>());

//     // Set default address index if not already set in bookingProvider
//     final defaultAddressIndex =
//         userAddresses.indexWhere((address) => address.isDefault);
//     if (defaultAddressIndex != -1 &&
//         bookingProvider.selectedAddressIndex.value == null) {
//       bookingProvider.selectedAddressIndex.value = defaultAddressIndex;
//       selectAddressProvider.setSelectedAddressIndex(defaultAddressIndex);
//     }
//   }

//   void showAddressForm(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             left: 16.0,
//             right: 16.0,
//             top: 16.0,
//           ),
//           child: SafeArea(
//             child: DraggableScrollableSheet(
//               expand: false,
//               minChildSize: 0.5,
//               maxChildSize: 0.95,
//               initialChildSize: 0.6,
//               builder: (context, scrollController) {
//                 return SingleChildScrollView(
//                   controller: scrollController,
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         AddressForm(onFormSubmitted: (updatedAddressList) {
//                           selectAddressProvider
//                               .updatedAddressList(updatedAddressList);
//                           loginProvider.setAddressList(updatedAddressList);

//                           Navigator.pop(context);
//                         }),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: SafeArea(
//         child: Consumer<SelectAddressProvider>(
//           builder: (context, selectAddressProvider, child) {
//             return SingleChildScrollView(
//               padding: EdgeInsets.only(
//                 left: 15,
//                 right: 15,
//                 top: 10,
//                 bottom: MediaQuery.of(context).viewInsets.bottom + 26.0,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () => Navigator.pop(context),
//                         child: const Icon(Icons.chevron_left_outlined,
//                             size: 30, color: AppColors.pineTree),
//                       ),
//                       SizedBox(width: width * 0.15),
//                       TextWidget(
//                           text: "Select Address", style: context.headlineSmall)
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             showAddressForm(context);
//                           },
//                           child: const Icon(Icons.add,
//                               color: AppColors.black, size: 15)),
//                       const SizedBox(width: 20),
//                       TextWidget(
//                           text: StringConstants.addNewAddress,
//                           style: context.headlineSmall),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   AppDivider(width: width),
//                   const SizedBox(height: 10),
//                   if (selectAddressProvider.userAddressList.isNotEmpty)
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: selectAddressProvider.userAddressList.length,
//                       itemBuilder: (context, index) {
//                         final address =
//                             selectAddressProvider.userAddressList[index];
//                         final isSelected =
//                             selectAddressProvider.selectedAddressIndex == index;

//                         return GestureDetector(
//                           onTap: () {
//                             selectAddressProvider.setSelectedAddressIndex(
//                                 isSelected ? -1 : index);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                             decoration: BoxDecoration(
//                               color: isSelected
//                                   ? Colors.blue[100]
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(
//                                   color: isSelected
//                                       ? Colors.blue
//                                       : Colors.transparent,
//                                   width: 2),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   isSelected
//                                       ? Icons.check_circle
//                                       : Icons.circle_outlined,
//                                   color:
//                                       isSelected ? Colors.blue : AppColors.gray,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 20),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       TextWidget(
//                                           text: loginProvider.logInAPIResponse
//                                                   ?.user?.username ??
//                                               '',
//                                           style: context.headlineSmall),
//                                       const SizedBox(height: 10),
//                                       TextWidget(
//                                           text: address.address ?? '',
//                                           style: context.headlineSmall.copyWith(
//                                               color: AppColors.spanishGray)),
//                                       const SizedBox(height: 5),
//                                       TextWidget(
//                                           text:
//                                               "${address.city ?? ''}, ${address.pincode ?? ''}",
//                                           style: context.headlineSmall.copyWith(
//                                               color: AppColors.spanishGray)),
//                                     ],
//                                   ),
//                                 ),
//                                 const Icon(Icons.edit_outlined,
//                                     color: AppColors.black, size: 18),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   else
//                     const TextWidget(
//                         text: 'No addresses found',
//                         style: TextStyle(color: AppColors.gray)),
//                   const SizedBox(height: 50),
//                   ButtonWidget(
//                     buttonText: 'Continue',
//                     onTap: () {
//                       if (selectAddressProvider.selectedAddressIndex != null) {
//                         final selectedAddress =
//                             selectAddressProvider.userAddressList[
//                                 selectAddressProvider.selectedAddressIndex!];

//                         String selectedTimeSlotId =
//                             bookingProvider.timeSlotId.value;

//                         if (selectedTimeSlotId.isNotEmpty) {
//                           Navigator.pushNamed(
//                             context,
//                             Routes.CART_SUMMARY,
//                             arguments: {
//                               'selectedAddress': selectedAddress,
//                               'selectedTimeSlotId': selectedTimeSlotId,
//                             },
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content:
//                                   Text('Please select a time slot and date.'),
//                             ),
//                           );
//                         }
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Please select an address.'),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         bool success = await deleteSavedAddress();

//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                               success ? 'Address deleted successfully.' : 'Failed to delete address.',
//                             ),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryButtonColor,
//                          // Set your preferred button color
//                       ),
//                       child: Text(
//                         "Delete Address",
//                         style: context.headlineSmall.copyWith(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),

//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );

//   }
//   // Function to perform delete operation
// Future<bool> deleteSavedAddress() async {
//   // Perform the deletion logic here (e.g., API call, database operation)
//   // Return true if successful, or false if failed
//   // Example:
//   try {
//     // Simulating a delete operation (replace with actual logic)
//     await Future.delayed(Duration(seconds: 1)); // Simulate a network call
//     return true; // Return true if delete succeeds
//   } catch (e) {
//     print("Error deleting address: $e");
//     return false; // Return false if delete fails
//   }
// }
// }

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/selectAddress/provider/select_address_provider.dart';
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
  late SelectAddressProvider selectAddressProvider;

  @override
  void initState() {
    super.initState();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    bookingProvider = Provider.of<BookingProvider>(context, listen: false);
    selectAddressProvider =
        Provider.of<SelectAddressProvider>(context, listen: false);

    // Initialize the address list from the loginProvider
    final userAddresses = loginProvider.addressList ?? [];
    selectAddressProvider.setUserAddressList(userAddresses.cast<Address>());

    // Set default address index if not already set in bookingProvider
    final defaultAddressIndex =
        userAddresses.indexWhere((address) => address.isDefault);
    if (defaultAddressIndex != -1 &&
        bookingProvider.selectedAddressIndex.value == null) {
      bookingProvider.selectedAddressIndex.value = defaultAddressIndex;
      selectAddressProvider.setSelectedAddressIndex(defaultAddressIndex);
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
          ),
          child: SafeArea(
            child: DraggableScrollableSheet(
              expand: false,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              initialChildSize: 0.6,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AddressForm(onFormSubmitted: (updatedAddressList) {
                          selectAddressProvider
                              .updatedAddressList(updatedAddressList);
                          loginProvider.setAddressList(updatedAddressList);

                          Navigator.pop(context);
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
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
        child: Consumer<SelectAddressProvider>(
          builder: (context, selectAddressProvider, child) {
            return SingleChildScrollView(
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
                  if (selectAddressProvider.userAddressList.isNotEmpty ||
                      loginProvider.logInAPIResponse!.userAddress!.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          selectAddressProvider.userAddressList.isNotEmpty
                              ? selectAddressProvider.userAddressList.length
                              : loginProvider.logInAPIResponse!.userAddress![0]
                                  .addresses!.length,
                      itemBuilder: (context, index) {
                        final address =
                            selectAddressProvider.userAddressList.isNotEmpty
                                ? selectAddressProvider.userAddressList[index]
                                : loginProvider.logInAPIResponse!
                                    .userAddress![0].addresses![index];
                        final isSelected =
                            selectAddressProvider.selectedAddressIndex == index;

                        return GestureDetector(
                          onTap: () {
                            selectAddressProvider.setSelectedAddressIndex(
                                isSelected ? -1 : index);
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
                                const Icon(
                                  Icons.edit_outlined,
                                  color: AppColors.black,
                                  size: 20,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: AppColors.black,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    bool success = await deleteSavedAddress(
                                        index,
                                        context,
                                        loginProvider.logInAPIResponse!
                                            .userAddress![0].id,
                                        loginProvider
                                            .logInAPIResponse!
                                            .userAddress![0]
                                            .addresses![index]
                                            .id);

                                    if (success) {
                                      setState(() {
                                        selectAddressProvider
                                            .removeAddressAt(index);
                                      });

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Address deleted successfully.'),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Failed to delete address.'),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
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
                      if (selectAddressProvider.selectedAddressIndex != null) {
                        final selectedAddress =
                            selectAddressProvider.userAddressList[
                                selectAddressProvider.selectedAddressIndex!];

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
                              content:
                                  Text('Please select a time slot and date.'),
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
            );
          },
        ),
      ),
    );
  }
}

Future<bool> deleteSavedAddress(int index, BuildContext context,
    String userAddressId, String addressId) async {
  try {
    Map<String, dynamic> data = {
      "userAddressId": userAddressId.toString().trim(),
      "addressId": addressId.toString().trim()
    };
    await ApiHandler().callDeleteUserAddressApi(data, context);
    return true;
  } catch (e) {
    print("Error deleting address: $e");
    return false;
  }
}
