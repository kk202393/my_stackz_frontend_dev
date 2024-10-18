import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/utils/input_validator.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key, required this.onFormSubmitted});

  final Function(List<Address> updatedAddressList) onFormSubmitted;

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();

  var _enteredAddress = '';
  var _enteredPincode = '';
  var _enteredCity = '';
  bool _isLoading = false;

  void saveAddress() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isLoading = true;
      });

      List<Address>? addresses = await sendNewAddress();
      setState(() {
        _isLoading = false;
      });

      if (addresses != null) {
        widget.onFormSubmitted(addresses);
      } else {
        setState(() {
          _isLoading = false;
        });
      }

      if (!context.mounted) {
        return;
      }
    }
  }

  void resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _enteredAddress = '';
      _enteredCity = '';
      _enteredPincode = '';
    });
  }

  Future<List<Address>?> sendNewAddress() async {
    Map<String, dynamic> body = {
      "address": _enteredAddress,
      "city": _enteredCity,
      "pincode": _enteredPincode,
      "longitude": "78.072281",
      "latitude": "27.900383"
    };

    try {
      final response = await ApiHandler().callCreateNewAddressApi(body);
      if (response != null && response['success'] == true) {
        List<Address> addresses = (response['userAddress']['addresses'] as List)
            .map((addressJson) => Address.fromJson(addressJson))
            .toList();
        return addresses;
      } else {
        return null;
      }
    } catch (e) {
      String errorMessage = "An error occurred while creating the address.";
      if (e is SocketException) {
        errorMessage = "Network error, please check your internet connection.";
      } else if (e is HttpException) {
        errorMessage = "Server error, please try again later.";
      } else if (e is FormatException) {
        errorMessage = "Data format error, please contact support.";
      } else {
        errorMessage = e.toString();
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red.shade600,
          ),
        );
      }

      return null;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: StringConstants.address,
            ),
            validator: (value) => InputValidator.validateAddress(value),
            onSaved: (value) {
              _enteredAddress = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: StringConstants.city,
            ),
            validator: (value) => InputValidator.validateCity(value),
            onSaved: (value) {
              _enteredCity = value!;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: StringConstants.pincode,
            ),
            validator: (value) => InputValidator.validatePincode(value),
            onSaved: (value) {
              _enteredPincode = value!;
            },
          ),
          const SizedBox(height: 20.0),
          _isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: saveAddress,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    alignment: Alignment.center,
                    child: const Text(
                      'Add Address',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
