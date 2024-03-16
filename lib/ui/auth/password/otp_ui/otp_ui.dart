import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../data/helper/barrel.dart';
import '../../../../data/router/rounter_config.dart';

class OtpUi extends StatelessWidget {
  const OtpUi({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      header: "Enter OTP",
      btnText: "Verification",
      spanText: "Back to",
      spanBoldText: " Log in",
      onTap: () => context.pushReplacementNamed(RouterUtil.changePassword),
      onSpanTap: () => context.pop(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OTPTextField(
              outlineBorderRadius: 50,
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 60,
              style: txtSemiBoldF16c7C7C7C,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              otpFieldStyle: OtpFieldStyle(
                focusBorderColor: primaryColor,
                borderColor: cF0f0f0,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            6.0.h.height(),
          ],
        ),
      ),
    );
  }
}
