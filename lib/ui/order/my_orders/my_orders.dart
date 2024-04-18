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
              LoadingState() => Loader(),
              SuccessState() => orderCard(state.success),
              FailureState() => DisplayError(
                  errorMessage: "Empty",
                ),
              EmptyState() => DisplayError(errorMessage: "Empty")
            };
          },
        ),
      ),
    );
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
                  Image.asset(
                    catImg,
                    width: 100,
                  ),
                  Expanded(
                    child: Text(
                      order["0"]["product"]["product_name"],
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "shipping charge: ₹ ${order["shipping_charge"].toString()}",
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
}
