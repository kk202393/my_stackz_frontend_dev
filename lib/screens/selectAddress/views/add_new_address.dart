import 'package:flutter/material.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/screens/selectAddress/provider/select_address_provider.dart';
import 'package:my_stackz/utils/input_validator.dart';
import 'package:provider/provider.dart';

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

  void saveAddress() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final provider =
          Provider.of<SelectAddressProvider>(context, listen: false);
      provider
          .addNewAddress(
              _enteredAddress, _enteredCity, _enteredPincode, context)
          .then((_) {
        if (!provider.isLoading) {
          widget.onFormSubmitted(provider.userAddressList);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectAddressProvider>(
      builder: (context, provider, child) {
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
              provider.isLoading
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
      },
    );
  }
}
