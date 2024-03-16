import 'package:flutter/material.dart';

import '../../../data/helper/barrel.dart';

class BillingAddress extends StatefulWidget {
  const BillingAddress({super.key});

  @override
  State<BillingAddress> createState() => _BillingAddressState();
}

class _BillingAddressState extends State<BillingAddress> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController streetAddressController;
  late TextEditingController apartmentAddressController;
  late TextEditingController townCityController;
  late TextEditingController stateCountyController;
  late TextEditingController postcodeController;
  late TextEditingController phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    streetAddressController = TextEditingController();
    apartmentAddressController = TextEditingController();
    townCityController = TextEditingController();
    stateCountyController = TextEditingController();
    postcodeController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cScaffoldBg,
      appBar: CustomAppBar(
        suffixIcon: Icons.notifications_none_sharp,
        title: 'Add New Address',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                30.0.height(),
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
                40.0.height(),
                PrimaryButton(
                  onTap: _validateAndPlaceOrder,
                  btnName: "Place Order To Checkout",
                ),
                50.0.height(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndPlaceOrder() {
    if (_formKey.currentState?.validate() ?? false) {
      // Place order logic here
      print('Order placed successfully!');
    }
  }
}
