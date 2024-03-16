import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/helper/barrel.dart';

class ChangePasswordUi extends StatelessWidget {
  const ChangePasswordUi({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      header: "New Password",
      btnText: "Reset Password",
      spanText: "Back to",
      spanBoldText: " Log in",
      onTap: () => context.pop(),
      body: SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}
