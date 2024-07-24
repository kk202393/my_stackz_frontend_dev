import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/constants/app_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/models/logout_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/utils/shared_preferences.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/dialoge.dart';
import 'package:my_stackz/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  ValueNotifier<int> scrollIndex = ValueNotifier<int>(0);
  ValueNotifier<List<AllCategories>> categoryList = ValueNotifier([]);
  ValueNotifier<String> address = ValueNotifier("");
  ValueNotifier<String> token = ValueNotifier("");
  ValueNotifier<String> name = ValueNotifier("");
  late ServiceCategory selectedServiceCategory;
  ValueNotifier<int> categoryIds = ValueNotifier<int>(-1);
  ValueNotifier<int> subcategoryId = ValueNotifier<int>(-1);
  ValueNotifier<int> servicecategoryId = ValueNotifier<int>(-1);

  // RxBool isIconClicked = false.obs;
  // RxBool isTyped = false.obs;
  // RxBool isArrowClicked = false.obs;
  // RxBool isLoading = false.obs;
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> isIconClicked = ValueNotifier<bool>(false);
  ValueNotifier<bool> isTyped = ValueNotifier<bool>(false);
  ValueNotifier<bool> isArrowClicked = ValueNotifier<bool>(false);

  ValueNotifier<List<Subcategories>> subcategories = ValueNotifier([]);
  ValueNotifier<List<ServiceCategory>> serviceCategory = ValueNotifier([]);
  ValueNotifier<int> categoryId = ValueNotifier<int>(1);

  void setIsLoadingDialogOpened(bool isOpened) {
    isLoading.value = isOpened;
    isLoading.notifyListeners();
  }

  @override
  void onInit() {}
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  onSelectKeyTab(int index) {
    selectedIndex.value = index;
  }

  onIconClicked() {
    isIconClicked.value = !isIconClicked.value;
  }

  scrollingIndex(int value) {
    scrollIndex.value = value;
  }

  onArrowClicked() {
    isArrowClicked.value = !isArrowClicked.value;
  }

  onChangeSearchField(String value) {
    if (value.isNotEmpty) {
      isTyped.value = true;
    } else {
      isTyped.value = false;
    }
  }

  HomePageResponse? _response;

  HomePageResponse get homeAPIResponse => _response!;

  // List<dynamic> _services = [];

  //  void setAddressList(List<dynamic> serviceCategory ) {
  //   _services = serviceCategory;
  //   notifyListeners();
  // }

  // @override
  // void onInit() {print("homeAPIResponse:${homeAPIResponse}");
  //   // getCustomerDetails();
  //   // callGetViewHomePageApi();
  //   // super.onInit();
  // }

  getCustomerDetails() async {
    name.value =
        await AppPreferences().getSharedPreferences(AppConstants.firstName);
    address.value =
        await AppPreferences().getSharedPreferences(AppConstants.address);
    token.value =
        await AppPreferences().getSharedPreferences(AppConstants.token);
    debugPrint("firstName ${token.value}");
  }

  // Future<bool> callGetViewHomePageApi(BuildContext context) async {
  //   isLoading.value = true;
  //   try {
  //     String? token = await Utils().ReadToken();
  //     if (token == null || token.isEmpty) {
  //       throw Exception('Token is null or empty');
  //     }

  //     final _response = await ApiHandler().callGetViewHomePageApi(token);
  //     isLoading.value = false;

  //     if (_response != null &&
  //         _response.success &&
  //         _response.allCategories != null) {
  //       categoryList.value = _response.allCategories;

  //       if (_response.allCategories.isNotEmpty) {
  //         categoryIds.value = _response.allCategories[0].categoryId;
  //         subcategoryId.value = _response.allCategories[0].subcategoryId;
  //         servicecategoryId.value =
  //             _response.allCategories[0].servicecategoryId;
  //         print("object$categoryIds$address");
  //       }
  //       notifyListeners();
  //       return true;
  //     } else if (_response.statusCode == 401 && _response.AllCategories) {
  //       isLoading.value = false;

  //       String msg = "Can't login more than four device";
  //       DialogHelper().showSnackBar(
  //         context: context,
  //         msg: msg,
  //         backgroundColor: Colors.red.shade600,
  //       );

  //       return false;
  //     }
  //     String msg = "Failed to fetch data";
  //     DialogHelper().showSnackBar(
  //       context: context,
  //       msg: msg,
  //       backgroundColor: Colors.red.shade600,
  //     );
  //     return false;
  //   } catch (e) {
  //     isLoading.value = false;
  //     debugPrint("Error: $e");
  //     return false;
  //   }
  // }
  Future<bool> callGetViewHomePageApi(BuildContext context) async {
    isLoading.value = true;
    try {
      String? token = await Utils().ReadToken();
      _response = await ApiHandler().callGetViewHomePageApi(token!);
      isLoading.value = false;
      if (_response!.success && _response!.allCategories != null) {
        categoryList.value = _response!.allCategories;
        notifyListeners();
        return true;
      }
      return true;
    } catch (e) {
      isLoading.value = false;
      return false;
    }

    
  }

  Future<bool> callLogoutApi(BuildContext context) async {
    String? token = await Utils().ReadToken();
    // WidgetsFlutterBinding
    //     .ensureInitialized(); // Ensure Flutter binding is initialized
    try {
      isLoading.value = true;
      LogoutResponse response = await ApiHandler().callLogoutApi(token);
      if (response.success! && response.message == "Log Out Successfully") {
        // Snack.show(
        //     content: response.message ?? '',
        //     snackType: SnackType.info,
        //     behavior: SnackBarBehavior.floating);
        isLoading.value = false;
        Utils().deleteToken();
        return true;
      } else {
        Snack.show(
            content: response.message ?? '',
            snackType: SnackType.error,
            behavior: SnackBarBehavior.floating);
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }
}
