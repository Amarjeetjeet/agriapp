import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/blocs/order_cubit/order_cubit.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: "My Order",
      ),
      body: BlocProvider(
        create: (context) => OrderCubit()..getOrders(),
        child: BlocBuilder<OrderCubit, StateApi>(
          builder: (context, state) {
            return switch (state) {
              LoadingState() => const Loader(),
              SuccessState() => orderCard(state.success),
              FailureState() => const DisplayError(
                  errorMessage: "Something went wrong!",
                ),
              EmptyState() => const DisplayError(errorMessage: "No Order Found")
            };
          },
        ),
      ),
    );
  }

  String orderDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);

      // List of month names
      List<String> months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ];

      // Format date manually
      String formattedDate =
          "${months[parsedDate.month - 1]} ${parsedDate.day}, ${parsedDate.year}";

      print(formattedDate); // Output: October 23, 2024
      return formattedDate;
    } catch (e) {
      return "Not available";
    }
  }

  Widget orderCard(Map<String, dynamic> orderData) {
    return ListView.builder(
      itemCount: orderData["order_list"]["order"].length,
      itemBuilder: (c, i) {
        var order = orderData["order_list"]["order"][i];
        return Card(
          color: Colors.white,
          elevation: 0,
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      order["product_list"][0]["product_image_link"],
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      orderDate(order["get_date_created"]["date"]),
                      style: txtMediumF14c383838,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Text(
                      "#${order["order_id"].toString()}",
                      style: txtRegularF14cWhite,
                    ),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: order["product_list"].length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Text(
                            "${order["product_list"][index]["product_name"] ?? ""}"
                            " x ${order["product_list"][index]["quantity"] ?? ""}",
                            style: txtMediumF14c383838.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "₹${order["product_list"][index]["total"] ?? ""}",
                            style: txtMediumF14c383838.copyWith(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
              const SizedBox(
                height: 2,
              ),
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              if ((order["discount"] ?? 0) != 0) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Discount: ₹ ${order["discount"].toString()}",
                    style: txtMediumF14c383838,
                  ),
                ),
              ],
              if ((order["shipping_charge"] ?? "0") != "0") ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "shipping charge: ₹ ${order["shipping_charge"].toString()}",
                    style: txtMediumF14c383838,
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  order["payment_method"].toString(),
                  style: txtMediumF14c383838,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total: ₹ ${order["total"].toString()}",
                  style: txtBoldF14cPrimary,
                ),
              ),
              ExpansionTile(
                expandedAlignment: Alignment.centerLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: const Text('BILLING ADDRESS'),
                subtitle: Text(order["billing_address"]["billing_company"] ?? ""),
                children: <Widget>[
                  addressTile(
                    "${order["billing_address"]["billing_first_name"]} "
                    "${order["billing_address"]["billing_last_name"]}",
                  ),
                  addressTile(
                    "${order["billing_address"]["billing_address_1"]} "
                    "${order["billing_address"]["billing_address_2"]}",
                  ),
                  addressTile(
                    "${order["billing_address"]["billing_city"]} "
                    "${order["billing_address"]["billing_postcode"]}",
                  ),
                  addressTile(
                    "${order["billing_address"]["billing_state"]} "
                    "${order["billing_address"]["billing_country"]}",
                  ),
                  addressTile("${order["billing_address"]["billing_email"]} "),
                  addressTile("${order["billing_address"]["billing_phone"]} "),
                ],
              ),
              ExpansionTile(
                expandedAlignment: Alignment.centerLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: const Text('SHIPPING ADDRESS'),
                subtitle: Text(order["shipping_address"]["shipping_company"] ?? ""),
                children: <Widget>[
                  addressTile(
                    "${order["shipping_address"]["shipping_first_name"]} "
                    "${order["shipping_address"]["shipping_last_name"]}",
                  ),
                  addressTile(
                    "${order["shipping_address"]["shipping_address_1"]} "
                    "${order["shipping_address"]["shipping_address_2"]}",
                  ),
                  addressTile(
                    "${order["shipping_address"]["shipping_city"]} "
                    "${order["shipping_address"]["shipping_postcode"]}",
                  ),
                  addressTile(
                    "${order["shipping_address"]["shipping_state"]} "
                    "${order["shipping_address"]["shipping_country"]}",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                child: PrimaryButton(
                  onTap: () {},
                  btnName: order["status"],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget addressTile(String? name) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 4),
      child: Text(
        name ?? "",
        style: txtMediumF14c383838,
      ),
    );
  }
}
