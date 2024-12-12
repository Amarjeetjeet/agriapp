import 'package:agriapp/data/data_source/local/database_helper/database_helper.dart';
import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/domain/blocs/state_api/form_state.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';

import '../../../data/data_source/local/preference_util/preference_utils.dart';
import '../../../data/helper/widgets/utils.dart';
import '../../../data/router/rounter_config.dart';
import '../../../domain/blocs/address_cubit/address_cubit.dart';
import '../../../domain/blocs/order/order_response.dart';
import '../../../domain/blocs/order_cubit/create_order_cubit.dart';
import '../../../domain/models/model/shipping_address_response.dart';
import '../../../domain/models/order/order_input.dart';
import 'billing_address.dart';
import 'billing_address_form.dart';
import 'hash_service.dart';

class AddressUi extends StatefulWidget {
  const AddressUi({
    super.key,
    required this.orderInput,
    required this.price,
    required this.isOnlinePayment,
  });

  final OrderInput orderInput;
  final double price;
  final bool isOnlinePayment;

  @override
  State<AddressUi> createState() => _AddressUiState();
}

class _AddressUiState extends State<AddressUi>
    implements PayUCheckoutProProtocol {
  String selectedAddress = 'Billing Address';
  late PayUCheckoutProFlutter _checkoutPro;

  bool userDifferentShippingAddress = false;
  late OrderInput orderInput;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController address1Controller;
  late TextEditingController address2Controller;
  late TextEditingController townCityController;
  late TextEditingController stateCountyController;
  late TextEditingController postcodeController;
  late TextEditingController phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    address1Controller = TextEditingController();
    address2Controller = TextEditingController();
    townCityController = TextEditingController();
    stateCountyController = TextEditingController();
    postcodeController = TextEditingController();
    phoneController = TextEditingController();
    _checkoutPro = PayUCheckoutProFlutter(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AddressCubit()..getBillingAddress(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Select address',
          hideCartIcon: false,
        ),
        bottomNavigationBar: BlocBuilder<AddressCubit, StateApi>(
          builder: (context, addressState) {
            if (addressState is SuccessState) {
              return BlocConsumer<CreateOrderCubit, FormStateApi>(
                listener: (context, createOrderState) async {
                  if (createOrderState.formLoadingState ==
                      FormLoadingState.loading) {
                    Utils(context).startLoading();
                  }
                  if (createOrderState.formLoadingState !=
                          FormLoadingState.idle &&
                      createOrderState.formLoadingState !=
                          FormLoadingState.loading) {
                    Utils(context).stopLoading();
                  }
                  if (createOrderState.formLoadingState ==
                      FormLoadingState.success) {
                    await DatabaseHelper.clearCart();
                    if (context.mounted) {
                      var snackBar = SnackBar(
                        content: Text(
                            (createOrderState.success as OrderCreateResponse)
                                    .messege ??
                                ""),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      context.pushReplacementNamed(RouterUtil.dashboard);
                    }
                  }
                  if (createOrderState.formLoadingState ==
                      FormLoadingState.failure) {
                    var snackBar = SnackBar(
                      content: Text(createOrderState.errorMessage ??
                          "Something went wrong!!"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: PrimaryButton(
                      onTap: () async {
                        ShippingAddressResponse? shippingAddressResponse =
                            addressState.success;
                        orderInput = OrderInput(
                          createOrder: CreateOrder(
                            productData:
                                widget.orderInput.createOrder?.productData,
                            shippingData: ShippingData(
                              deviveryCharg: "0",
                            ),
                            paymentData: PaymentData(
                              paymentMethod:
                                  widget.isOnlinePayment ? "payu" : "cod",
                              paymentMethodTitle: widget.isOnlinePayment
                                  ? "Online"
                                  : "Cash on delivery",
                            ),
                            cuponData: CuponData(
                              cuponCode: "",
                              cuponType: "",
                            ),
                            userData: UserData(
                              userId: PreferenceUtils.getString(
                                PreferenceUtils.USERID,
                              ),
                              firstName: shippingAddressResponse
                                  ?.userBillingAddress?.billingFirstName,
                              lastName: shippingAddressResponse
                                  ?.userBillingAddress?.billingLastName,
                              company: "N/A",
                              address1: shippingAddressResponse
                                  ?.userBillingAddress?.billingAddress1,
                              address2: shippingAddressResponse
                                  ?.userBillingAddress?.billingAddress2,
                              email: PreferenceUtils.getString(
                                PreferenceUtils.USER_EMAIL,
                              ),
                              city: shippingAddressResponse
                                  ?.userBillingAddress?.billingCity,
                              state: shippingAddressResponse
                                  ?.userBillingAddress?.billingState,
                              postcode: shippingAddressResponse
                                  ?.userBillingAddress?.billingPostcode,
                              country: shippingAddressResponse
                                  ?.userBillingAddress?.billingCountry,
                            ),
                          ),
                        );
                        if (!widget.isOnlinePayment) {
                          context
                              .read<CreateOrderCubit>()
                              .placeOrder(orderInput: orderInput);
                          return;
                        }

                        _checkoutPro.openCheckoutScreen(
                          payUPaymentParams: {
                            PayUPaymentParamKey.key: "s1U3rc",
                            PayUPaymentParamKey.amount: widget.price,
                            PayUPaymentParamKey.productInfo: "AgriPari",
                            PayUPaymentParamKey.firstName:
                                "${shippingAddressResponse?.userBillingAddress?.billingFirstName} ${shippingAddressResponse?.userBillingAddress?.billingLastName}",
                            PayUPaymentParamKey.email:
                                PreferenceUtils.getString(
                              PreferenceUtils.USER_EMAIL,
                            ),
                            PayUPaymentParamKey.phone:
                                "${shippingAddressResponse?.userBillingAddress?.billingPhone}",
                            PayUPaymentParamKey.environment: "1",
                            PayUPaymentParamKey.transactionId:
                                DateTime.now().toString(),
                            PayUPaymentParamKey.userCredential:
                                PreferenceUtils.getString(
                              PreferenceUtils.USERID,
                            ),
                            PayUPaymentParamKey.android_surl:
                                "https://www.payumoney.com/mobileapp/payumoney/success.php",
                            PayUPaymentParamKey.android_furl:
                                "https://www.payumoney.com/mobileapp/payumoney/failure.php",
                            PayUPaymentParamKey.ios_surl:
                                "https://www.payumoney.com/mobileapp/payumoney/success.php",
                            PayUPaymentParamKey.ios_furl:
                                "https://www.payumoney.com/mobileapp/payumoney/failure.php",
                          },
                          payUCheckoutProConfig: {
                            PayUCheckoutProConfigKeys.merchantName: "AgriPari",
                          },
                        );
                        return;
                      },
                      btnName: "Place Order",
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
        body: BlocBuilder<AddressCubit, StateApi>(
          builder: (context, state) {
            return switch (state) {
              LoadingState() => const Loader(),
              SuccessState() => buildSizedBox(state.success),
              FailureState() => DisplayError(errorMessage: state.errorMessage),
              EmptyState() => addAddress(context),
            };
          },
        ),
      ),
    );
  }

  @override
  generateHash(Map response) {
    // Backend will generate the hash which you need to pass to SDK
    // hashResponse: is the response which you get from your server

    Map hashResponse = {};

    //Keep the salt and hash calculation logic in the backend for security reasons. Don't use local hash logic.
    //Uncomment following line to test the test hash.
    hashResponse = HashService.generateHash(response);

    _checkoutPro.hashGenerated(hash: hashResponse);
  }

  @override
  onError(Map? response) {
    showAlertDialog(context, "onError", response.toString());
  }

  @override
  onPaymentSuccess(dynamic response) {
    // showSuccessAlertDialog(context, response.toString());
    context.read<CreateOrderCubit>().placeOrder(orderInput: orderInput);
  }

  @override
  onPaymentFailure(dynamic response) {
    showAlertDialog(context, "onPaymentFailure", response.toString());
  }

  @override
  onPaymentCancel(Map? response) {
    showAlertDialog(context, "onPaymentCancel", response.toString());
  }

  void showSuccessAlertDialog(
    BuildContext context,
    String content,
  ) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Payment success Placing order..."),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(content),
          ),
          actions: [okButton],
        );
      },
    );
  }

  void showAlertDialog(
    BuildContext context,
    String title,
    String content,
  ) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(content),
          ),
          actions: [okButton],
        );
      },
    );
  }

  Widget addAddress(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            address,
            height: 150,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Looks likes your address is not setup!",
              textAlign: TextAlign.center,
              style: txtMediumF14c383838,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: PrimaryIconButton(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const BillingAddress(
                      isFromCart: true,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              btnName: "Add New Address",
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSizedBox(ShippingAddressResponse? shippingAddressResponse) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a delivery Address:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 2,
              child: RadioListTile(
                title: const Text('BILLING DETAILS'),
                value: 'Billing Address',
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value.toString();
                    userDifferentShippingAddress = false;
                  });
                },
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${shippingAddressResponse?.userBillingAddress?.billingFirstName ?? ""} ${shippingAddressResponse?.userBillingAddress?.billingLastName ?? ""}",
                    ),
                    Text(
                      "${shippingAddressResponse?.userBillingAddress?.billingAddress1 ?? ""} ${shippingAddressResponse?.userBillingAddress?.billingAddress2 ?? ""}",
                    ),
                    Text(
                      "${shippingAddressResponse?.userBillingAddress?.billingCity ?? ""} ${shippingAddressResponse?.userBillingAddress?.billingState ?? ""} ${shippingAddressResponse?.userBillingAddress?.billingCountry ?? ""} ${shippingAddressResponse?.userBillingAddress?.billingPostcode ?? ""}",
                    ),
                    Text(
                      shippingAddressResponse
                              ?.userBillingAddress?.billingPhone ??
                          "",
                    ),
                  ],
                ),
              ),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("SHIP TO A DIFFERENT ADDRESS?"),
              contentPadding: EdgeInsets.zero,
              value: userDifferentShippingAddress,
              onChanged: (value) {
                setState(() {
                  userDifferentShippingAddress = !userDifferentShippingAddress;
                  if (value!) {
                    selectedAddress = "";
                  } else {
                    selectedAddress = "Billing Address";
                  }
                });
              },
            ),
            Visibility(
              visible: userDifferentShippingAddress,
              child: BillingAddressForm(
                formKey: _formKey,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                address1Controller: address1Controller,
                address2Controller: address2Controller,
                townCityController: townCityController,
                stateCountyController: stateCountyController,
                postcodeController: postcodeController,
                phoneController: phoneController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
