import 'package:agriapp/data/helper/barrel.dart';
import 'package:flutter/material.dart';

class BillingAddressForm extends StatelessWidget {
  const BillingAddressForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.streetAddressController,
    required this.apartmentAddressController,
    required this.townCityController,
    required this.stateCountyController,
    required this.postcodeController,
    required this.phoneController,
    required this.formKey,
  });

  final TextEditingController firstNameController,
      lastNameController,
      streetAddressController,
      apartmentAddressController,
      townCityController,
      stateCountyController,
      postcodeController,
      phoneController;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          MyLabelTextField(
            controller: firstNameController,
            label: "First Name",
            hintText: "Enter your first name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          20.0.height(),
          MyLabelTextField(
            controller: lastNameController,
            label: "Last Name",
            hintText: "Enter your last name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
          20.0.height(),
          MyLabelTextField(
            controller: streetAddressController,
            label: "Street Address",
            hintText: "Enter your street address",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your street address';
              }
              return null;
            },
          ),
          10.0.height(),
          MyTextField(
            controller: apartmentAddressController,
            hintText: "Enter your apartment address",
          ),
          20.0.height(),
          MyLabelTextField(
            controller: townCityController,
            label: "Town / City",
            hintText: "Enter your town/city",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your town/city';
              }
              return null;
            },
          ),
          20.0.height(),
          MyLabelTextField(
            controller: stateCountyController,
            label: "State / County",
            hintText: "Enter your state/county",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your state/county';
              }
              return null;
            },
          ),
          20.0.height(),
          MyLabelTextField(
            controller: postcodeController,
            label: "Postcode / ZIP",
            hintText: "Enter your postcode/ZIP",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your postcode/ZIP';
              } else if (value.length != 6) {
                return 'Postcode/ZIP must be 6 digits';
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
          20.0.height(),
          MyLabelTextField(
            controller: phoneController,
            label: "Phone",
            hintText: "Enter your phone number",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              } else if (value.length != 10 ||
                  !RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                return 'Please enter a valid Indian mobile number';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
