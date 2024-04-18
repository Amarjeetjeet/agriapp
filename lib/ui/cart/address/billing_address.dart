import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';
import 'package:agriapp/data/helper/widgets/utils.dart';
import 'package:agriapp/domain/blocs/address_cubit/add_address_cubit.dart';
import 'package:agriapp/domain/blocs/state_api/form_state.dart';
import 'package:agriapp/domain/models/address/address_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/helper/barrel.dart';
import '../../../domain/blocs/address_cubit/address_cubit.dart';
import 'billing_address_form.dart';

class BillingAddress extends StatefulWidget {
  const BillingAddress({super.key});

  @override
  State<BillingAddress> createState() => _BillingAddressState();
}

class _BillingAddressState extends State<BillingAddress> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController address2Controller;
  late TextEditingController address1Controller;
  late TextEditingController townCityController;
  late TextEditingController stateController;
  late TextEditingController postcodeController;
  late TextEditingController phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    address2Controller = TextEditingController();
    address1Controller = TextEditingController();
    townCityController = TextEditingController();
    stateController = TextEditingController();
    postcodeController = TextEditingController();
    phoneController = TextEditingController();
    Future.microtask(() => context.read<AddressCubit>()..getBillingAddress());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cScaffoldBg,
      appBar: const CustomAppBar(
        title: 'Add New Address',
      ),
      body: BlocConsumer<AddAddressCubit, FormStateApi>(
        listener: (context, state) {
          if(state.formLoadingState == FormLoadingState.loading){
            Utils(context).startLoading();
          }
          if(state.formLoadingState != FormLoadingState.loading){
            Utils(context).stopLoading();
            context.pop();
          }
          if((state.errorMessage ?? "").isNotEmpty){
            var snackBar = SnackBar(
              content: Text(state.errorMessage ?? "Something went wrong!!"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                    address1Controller: address1Controller,
                    address2Controller: address2Controller,
                    townCityController: townCityController,
                    stateCountyController: stateController,
                    postcodeController: postcodeController,
                    phoneController: phoneController,
                  ),
                  40.0.height(),
                  PrimaryButton(
                    onTap: () => _validateAndPlaceOrder(context),
                    btnName: "Update address",
                  ),
                  50.0.height(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _validateAndPlaceOrder(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      AddressInput addressInput = AddressInput(
        userId: PreferenceUtils.getString(PreferenceUtils.USERID),
        shippingEmail: PreferenceUtils.getString(PreferenceUtils.USER_EMAIL),
        shippingFirstName: firstNameController.text,
        shippingLastName: lastNameController.text,
        shippingAddress1: address1Controller.text,
        shippingAddress2: address2Controller.text,
        shippingCity: townCityController.text,
        shippingState: stateController.text,
        shippingPostcode: postcodeController.text,
        shippingPhone: phoneController.text,
      );
      // Place order logic here


      context
          .read<AddAddressCubit>()
          .addShippingAddress(addressInput: addressInput);
      debugPrint('Address input ${addressInput.toJson()}');
    }
  }
}
