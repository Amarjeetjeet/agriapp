import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../data/helper/barrel.dart';

class ChangePasswordUi extends StatelessWidget {
  const ChangePasswordUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        suffixIcon: null,
        title: "Change password",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const MyLabelTextField(
                label: "Password",
                hintText: "Enter your password",
                passwordField: true,
              ),
              2.0.h.height(),
              const MyLabelTextField(
                label: "Confirm Password",
                hintText: "Enter your confirm password",
                passwordField: true,
              ),
              3.0.h.height(),
              PrimaryButton(
                onTap: () {},
                btnName: "Change password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// return AuthScaffold(
//   header: "New Password",
//   btnText: "Reset Password",
//   spanText: "Back to",
//   spanBoldText: " Log in",
//   onTap: () => context.pop(),
//   body: SingleChildScrollView(
//     child: Column(
//       children: [
//         const MyLabelTextField(
//           label: "Password",
//           hintText: "Enter your password",
//           passwordField: true,
//         ),
//         2.0.h.height(),
//         const MyLabelTextField(
//           label: "Confirm Password",
//           hintText: "Enter your confirm password",
//           passwordField: true,
//         ),
//         3.0.h.height(),
//       ],
//     ),
//   ),
// );
