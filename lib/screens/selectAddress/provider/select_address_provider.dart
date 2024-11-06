import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/login_response.dart';

class SelectAddressProvider with ChangeNotifier {
  List<Address> _userAddressList = [];
  int? _selectedAddressIndex;
  bool _isLoading = false;

  List<Address> get userAddressList => _userAddressList;
  int? get selectedAddressIndex => _selectedAddressIndex;
  bool get isLoading => _isLoading;

  void setUserAddressList(List<Address> addresses) {
    _userAddressList = addresses;
  //  notifyListeners();
  }

  void setSelectedAddressIndex(int index) {
    _selectedAddressIndex = index;
    notifyListeners();
  }

  void updatedAddressList(List<Address> updatedList) {
    _userAddressList = updatedList;
    notifyListeners();
  }

  Future<void> addNewAddress(
      String address, String city, String pincode, BuildContext context) async {
    _setLoading(true);

    Map<String, dynamic> body = {
      "address": address,
      "city": city,
      "pincode": pincode,
      "longitude": "78.072281",
      "latitude": "27.900383"
    };

    try {
      final response = await ApiHandler().callCreateNewAddressApi(body);
      if (response != null && response['success'] == true) {
        if (response['userAddress'] != null &&
            response['userAddress']['addresses'] != null) {
          List<Address> addresses = (response['userAddress']['addresses'] as List)
              .map((addressJson) => Address.fromJson(addressJson))
              .toList();
          _userAddressList = addresses;
          notifyListeners();
        }
      } else {
        String errorMessage = response?['message'] ?? "Failed to add address. Please try again.";
        _showSnackBar(context, errorMessage, Colors.red.shade600);
      }
    } catch (e) {
      _showSnackBar(context, "You can create only 10 addresses", Colors.red.shade600);
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _showSnackBar(BuildContext context, String message, Color backgroundColor) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
