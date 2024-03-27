import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/domain/blocs/state_api/form_state.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:agriapp/ui/cart/payment/order_cubit/create_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/helper/widgets/utils.dart';
import '../../../data/router/rounter_config.dart';
import '../../../domain/models/auth/login_response.dart';
import '../../../domain/models/model/shipping_address_response.dart';
import '../../../domain/models/order/order_input.dart';
import 'address_cubit.dart';
import 'billing_address_form.dart';

class AddressUi extends StatefulWidget {
  const AddressUi({super.key, required this.orderInput});

  final OrderInput orderInput;

  @override
  State<AddressUi> createState() => _AddressUiState();
}

class _AddressUiState extends State<AddressUi> {
  String selectedAddress = 'Billing Address';

  bool userDifferentShippingAddress = false;

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              AddressCubit()..getShippingAddress(),
        ),
        BlocProvider(
          create: (BuildContext context) => CreateOrderCubit(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          suffixIcon: Icons.add,
          title: 'Select address',
        ),
        bottomNavigationBar: BlocBuilder<AddressCubit, StateApi>(
          builder: (context, state) {
            if (state is SuccessState) {
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
                    LoginResponse loginResponse = state.success;
                    // PreferenceUtils.setString(PreferenceUtils.USERID, loginResponse?.message);
                    context.pushReplacementNamed(RouterUtil.homeUi);
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
                        OrderInput orderInput = OrderInput(
                          createOrder: CreateOrder(
                              productData:
                                  widget.orderInput.createOrder?.productData,
                              shippingData: ShippingData(
                                deviveryCharg: "80",
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
                                  userId: "2",
                                  firstName: "Dummy user",
                                  lastName: "Dummy lastname",
                                  company: "dummy company",
                                  address1: "Address 1",
                                  address2: "Address 2",
                                  email: "Dummy@gmail.com",
                                  city: "Ahemedabad",
                                  state: "Gujarat",
                                  postcode: "380007",
                                  country: "IN")),
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
              EmptyState() => Center(
                  child: PrimaryIconButton(
                    onTap: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    btnName: "Add New Address",
                  ),
                ),
            };
          },
        ),
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
                streetAddressController: streetAddressController,
                apartmentAddressController: apartmentAddressController,
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
