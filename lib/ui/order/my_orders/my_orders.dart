import 'package:agriapp/data/helper/barrel.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: "My Order",
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      product,
                      width: 100,
                    ),
                    Column(
                      children: [
                        Text(
                          "data",
                          style: txtRegularF12c8C8C8C,
                        ),
                        Text("data", style: txtMediumF14c383838),
                      ],
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
                        "#4343434",
                        style: txtRegularF14cWhite,
                      ),
                    ),
                  ],
                ),
                const Text("data"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
