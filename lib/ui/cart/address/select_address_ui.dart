import 'dart:convert';

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
import '../../../data/helper/hash_service.dart';
import '../../../data/helper/widgets/utils.dart';
import '../../../data/router/rounter_config.dart';
import '../../../domain/blocs/address_cubit/address_cubit.dart';
import '../../../domain/blocs/order/order_response.dart';
import '../../../domain/blocs/order_cubit/create_order_cubit.dart';
import '../../../domain/models/model/shipping_address_response.dart';
import '../../../domain/models/order/order_input.dart';
import 'billing_address.dart';
import 'billing_address_form.dart';

class AddressUi extends StatefulWidget {
  const AddressUi({
    super.key,
    required this.orderInput,
    required this.isOnlinePayment,
  });

  final OrderInput orderInput;
  final bool isOnlinePayment;

  @override
  State<AddressUi> createState() => _AddressUiState();
}

class _AddressUiState extends State<AddressUi>
    implements PayUCheckoutProProtocol {
  String selectedAddress = 'Billing Address';

  bool userDifferentShippingAddress = false;

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController address1Controller;
  late TextEditingController address2Controller;
  late TextEditingController townCityController;
  late TextEditingController stateCountyController;
  late TextEditingController postcodeController;
  late TextEditingController phoneController;
  final _formKey = GlobalKey<FormState>();
  late PayUCheckoutProFlutter _checkoutPro;

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
        BlocProvider(
          create: (BuildContext context) => CreateOrderCubit(),
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
                listener: (context, createOrderState) {
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
                    var snackBar = SnackBar(
                      content: Text(
                          (createOrderState.success as OrderCreateResponse)
                                  .messege ??
                              ""),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    context.pushReplacementNamed(RouterUtil.dashboard);
                    DatabaseHelper.clearCart();
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
                        try{
                          _checkoutPro.openCheckoutScreen(
                            payUPaymentParams: PayUParams.createPayUPaymentParams(),
                            payUCheckoutProConfig: PayUParams.createPayUConfigParams(),
                          );
                          return;
                          _checkoutPro.openCheckoutScreen(payUPaymentParams: {
                            PayUPaymentParamKey.key: "s1U3rc",
                            PayUPaymentParamKey.amount: "10",
                            PayUPaymentParamKey.productInfo: "Payu",
                            PayUPaymentParamKey.firstName: "Sidhu Patil",
                            PayUPaymentParamKey.email: "abc@gmail.com",
                            PayUPaymentParamKey.phone: "9876543210",
                            PayUPaymentParamKey.android_furl:
                            "https://www.payu.in/txnstatus",
                            PayUPaymentParamKey.android_surl:
                            "https://www.payu.in/txnstatus",
                            PayUPaymentParamKey.ios_surl:
                            "https://www.payu.in/txnstatus",
                            PayUPaymentParamKey.ios_furl:
                            "https://www.payu.in/txnstatus",
                          }, payUCheckoutProConfig: {
                            PayUCheckoutProConfigKeys.merchantName: "PayU",
                          });
                          return;
                        }catch(e){
                          print("e is this $e");
                        }


                        return;
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute<void>(
                        //     builder: (BuildContext context) =>
                        //         const PaymentUi(),
                        //   ),
                        // );

                        ShippingAddressResponse? shippingAddressResponse =
                            addressState.success;
                        OrderInput orderInput = OrderInput(
                          createOrder: CreateOrder(
                            productData:
                                widget.orderInput.createOrder?.productData,
                            shippingData: ShippingData(
                              deviveryCharg: "0",
                            ),
                            paymentData: PaymentData(
                              paymentMethod: "cod",
                              paymentMethodTitle: "Cash on delivery",
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
                        context
                            .read<CreateOrderCubit>()
                            .placeOrder(orderInput: orderInput);
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
                    builder: (BuildContext context) => const BillingAddress(isFromCart: true,),
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


  showAlertDialog(BuildContext context, String title, String content) {
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
              child: new Text(content),
            ),
            actions: [okButton],
          );
        });
  }

  @override
  generateHash(Map response) {
    print("generate map");
    Map hashResponse = {};
    hashResponse = HashService.generateHash(response);
    print("generate map map $hashResponse");
    print("generate map response $response");
    _checkoutPro.hashGenerated(hash: hashResponse);

    print(response);
  }

  @override
  onError(Map? response) {
    showAlertDialog(context, "onError", response.toString());
    print("onError map");
    print(response);
  }

  @override
  onPaymentCancel(Map? response) {
    showAlertDialog(context, "onPaymentCancel", response.toString());
    print("onPaymentCancel map");
    print(response);
  }

  @override
  onPaymentFailure(response) {
    showAlertDialog(context, "onPaymentFailure", response.toString());
    print("onPaymentFailure map");
    print(response);
  }

  @override
  onPaymentSuccess(response) {
    showAlertDialog(context, "onPaymentSuccess", response.toString());
    print("onPaymentSuccess map");
    print(response);
  }
}

class PayUTestCredentials {
  //Find the test credentials from dev guide: https://devguide.payu.in/flutter-sdk-integration/getting-started-flutter-sdk/mobile-sdk-test-environment/
  static const merchantKey = "s1U3rc";// Add you Merchant Key
  static const iosSurl = "https://www.payu.in/txnstatus";
  static const iosFurl = "https://www.payu.in/txnstatus";
  static const androidSurl = "https://www.payu.in/txnstatus";
  static const androidFurl = "https://www.payu.in/txnstatus";

  static const merchantAccessKey = "";//Add Merchant Access Key - Optional
  static const sodexoSourceId = ""; //Add sodexo Source Id - Optional
}

//Pass these values from your app to SDK, this data is only for test purpose
class PayUParams {
  static Map createPayUPaymentParams() {
    var siParams = {
      PayUSIParamsKeys.isFreeTrial: true,
      PayUSIParamsKeys.billingAmount: '1',              //Required
      PayUSIParamsKeys.billingInterval: 1,              //Required
      PayUSIParamsKeys.paymentStartDate: '2023-04-20',  //Required
      PayUSIParamsKeys.paymentEndDate: '2023-04-30',    //Required
      PayUSIParamsKeys.billingCycle:                    //Required
      'daily', //Can be any of 'daily','weekly','yearly','adhoc','once','monthly'
      PayUSIParamsKeys.remarks: 'Test SI transaction',
      PayUSIParamsKeys.billingCurrency: 'INR',
      PayUSIParamsKeys.billingLimit: 'ON', //ON, BEFORE, AFTER
      PayUSIParamsKeys.billingRule: 'MAX', //MAX, EXACT
    };

    var additionalParam = {
      PayUAdditionalParamKeys.udf1: "udf1",
      PayUAdditionalParamKeys.udf2: "udf2",
      PayUAdditionalParamKeys.udf3: "udf3",
      PayUAdditionalParamKeys.udf4: "udf4",
      PayUAdditionalParamKeys.udf5: "udf5",
      PayUAdditionalParamKeys.merchantAccessKey:
      PayUTestCredentials.merchantAccessKey,
      PayUAdditionalParamKeys.sourceId:PayUTestCredentials.sodexoSourceId,
    };


    var spitPaymentDetails =
    {
      "type": "absolute",
      "splitInfo": {
        PayUTestCredentials.merchantKey: {
          "aggregatorSubTxnId": "1234567540099887766650091", //unique for each transaction
          "aggregatorSubAmt": "1"
        }
      }
    };


    var payUPaymentParams = {
      PayUPaymentParamKey.key: PayUTestCredentials.merchantKey,
      PayUPaymentParamKey.amount: "1000",
      PayUPaymentParamKey.productInfo: "Info",
      PayUPaymentParamKey.firstName: "Abc",
      PayUPaymentParamKey.email: "test@gmail.com",
      PayUPaymentParamKey.phone: "9999999999",
      PayUPaymentParamKey.ios_surl: PayUTestCredentials.iosSurl,
      PayUPaymentParamKey.ios_furl: PayUTestCredentials.iosFurl,
      PayUPaymentParamKey.android_surl: PayUTestCredentials.androidSurl,
      PayUPaymentParamKey.android_furl: PayUTestCredentials.androidFurl,
      PayUPaymentParamKey.environment: "1", //0 => Production 1 => Test
      PayUPaymentParamKey.userCredential: null, //Pass user credential to fetch saved cards => A:B - Optional
      PayUPaymentParamKey.transactionId: DateTime.now().millisecondsSinceEpoch.toString(),
      PayUPaymentParamKey.additionalParam: additionalParam,
      PayUPaymentParamKey.enableNativeOTP: true,
      PayUPaymentParamKey.splitPaymentDetails:json.encode(spitPaymentDetails),
      PayUPaymentParamKey.userToken:"", //Pass a unique token to fetch offers. - Optional
    };

    return payUPaymentParams;
  }

  static Map createPayUConfigParams() {
    var paymentModesOrder = [
      {"Wallets": "PHONEPE"},
      {"UPI": "TEZ"},
      {"Wallets": ""},
      {"EMI": ""},
      {"NetBanking": ""},
    ];

    var cartDetails = [
      {"GST": "5%"},
      {"Delivery Date": "25 Dec"},
      {"Status": "In Progress"}
    ];
    var enforcePaymentList = [
      {"payment_type": "CARD", "enforce_ibiboCode": "UTIBENCC"},
    ];

    var customNotes = [
      {
        "custom_note": "Its Common custom note for testing purpose",
        "custom_note_category": [PayUPaymentTypeKeys.emi,PayUPaymentTypeKeys.card]
      },
      {
        "custom_note": "Payment options custom note",
        "custom_note_category": null
      }
    ];

    var payUCheckoutProConfig = {
      PayUCheckoutProConfigKeys.primaryColor: "#4994EC",
      PayUCheckoutProConfigKeys.secondaryColor: "#FFFFFF",
      PayUCheckoutProConfigKeys.merchantName: "PayU",
      PayUCheckoutProConfigKeys.merchantLogo: "logo",
      PayUCheckoutProConfigKeys.showExitConfirmationOnCheckoutScreen: true,
      PayUCheckoutProConfigKeys.showExitConfirmationOnPaymentScreen: true,
      PayUCheckoutProConfigKeys.cartDetails: cartDetails,
      PayUCheckoutProConfigKeys.paymentModesOrder: paymentModesOrder,
      PayUCheckoutProConfigKeys.merchantResponseTimeout: 30000,
      PayUCheckoutProConfigKeys.customNotes: customNotes,
      PayUCheckoutProConfigKeys.autoSelectOtp: true,
      // PayUCheckoutProConfigKeys.enforcePaymentList: enforcePaymentList,
      PayUCheckoutProConfigKeys.waitingTime: 30000,
      PayUCheckoutProConfigKeys.autoApprove: true,
      PayUCheckoutProConfigKeys.merchantSMSPermission: true,
      PayUCheckoutProConfigKeys.showCbToolbar: true,
    };
    return payUCheckoutProConfig;
  }
}