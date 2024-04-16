import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../data/helper/barrel.dart';

class NotificationsUi extends StatelessWidget {
  const NotificationsUi({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        prefixIcon: Icons.arrow_back_ios_new_rounded,
        title: "Notification",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.h.height(),
              Text(
                "Today",
                style: txtMediumF16c383838,
              ),
              2.h.height(),
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(
                        bottom: 16.0,
                      ),
                      elevation: 0,
                      color: Colors.white,
                      child: ListTile(
                        title: const Text("Your order is Completed!"),
                        subtitle: const Text("Lorem lpsum is simple dummy!"),
                        trailing: const Text("1m ago"),
                        leading: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.ac_unit),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
