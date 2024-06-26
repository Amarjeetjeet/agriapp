import 'package:flutter/material.dart';

import '../../barrel.dart';

class MyPasswordField extends StatefulWidget {
  const MyPasswordField({super.key, required this.hintText, this.controller, this.validator});

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !passwordVisible,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
          child: Icon(
            passwordVisible ? Icons.visibility_off : Icons.visibility,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: txtRegularF14c7C7C7C,
      ),
    );
  }
}
