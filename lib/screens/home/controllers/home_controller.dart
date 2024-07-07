import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/constants/app_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/models/logout_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/utils/shared_preferences.dart';
import 'package:my_stackz/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  ValueNotifier<int> scrollIndex = ValueNotifier<int>(0);
  ValueNotifier<List<AllCategories>> categoryList = ValueNotifier([]);
  ValueNotifier<String> address = ValueNotifier("");
  ValueNotifier<String> token = ValueNotifier("");
  ValueNotifier<String> name = ValueNotifier("");
  RxBool isIconClicked = false.obs;
  RxBool isTyped = false.obs;
  RxBool isArrowClicked = false.obs;
  RxBool isLoading = false.obs;

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

  Future<bool> callGetViewHomePageApi(BuildContext context) async {
    isLoading.value = true;
    try {
      LoginProvider loginProvider =
          Provider.of<LoginProvider>(context, listen: false);
      _response = await ApiHandler()
          .callGetViewHomePageApi(loginProvider.logInAPIResponse.token);
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

  callLogoutApi(BuildContext context) async {
    final body = {"token": token.value};
    try {
      print(body);

      isLoading.value = true;
      LogoutResponse response = await ApiHandler().callLogoutApi(body);
      isLoading.value = false;
      if (response.success! && response.message != null) {
        Snack.show(
            content: response.message ?? '',
            snackType: SnackType.info,
            behavior: SnackBarBehavior.floating);
        Navigator.pushNamed(context, Routes.LOGIN);
      } else {
        Snack.show(
            content: response.message ?? '',
            snackType: SnackType.error,
            behavior: SnackBarBehavior.floating);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
