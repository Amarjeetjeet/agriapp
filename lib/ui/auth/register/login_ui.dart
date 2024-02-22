import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../helper/barrel.dart';
import 'auth_scaffold.dart';

class RegisterUi extends StatelessWidget {
  const RegisterUi({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      header: "Welcome Back!",
      btnText: "Log in",
      spanText: "Don't have an account?",
      spanBoldText: ' Register',
      body: Column(
        children: [
          const MyLabelTextField(
            label: "Email Address",
            hintText: "Enter your email address",
          ),
          3.0.h.height(),
          const MyLabelTextField(
            label: "Password",
            hintText: "Enter your password",
            passwordField: true,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password ?",
              style: txtLatoBoldF14cPrimary,
            ),
          ).right(),
          4.0.h.height(),
        ],
      ),
      onTap: () {},
    );
  }
}
