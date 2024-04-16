import 'package:flutter/material.dart';

import '../../../data/helper/barrel.dart';
import 'billing_address_form.dart';

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
      appBar: const CustomAppBar(
        title: 'Add New Address',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              30.0.height(),
              BillingAddressForm(
                formKey: _formKey,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                streetAddressController: streetAddressController,
                apartmentAddressController: apartmentAddressController,
                townCityController: townCityController,
                stateCountyController: stateCountyController,
                postcodeController: postcodeController,
                phoneController: phoneController,
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
    );
  }

  void _validateAndPlaceOrder() {
    if (_formKey.currentState?.validate() ?? false) {
      // Place order logic here
      debugPrint('Order placed successfully!');
    }
  }
}
