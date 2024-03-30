import 'package:flutter/material.dart';

import '../../barrel.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.onTap,
    this.hintStyle, this.controller, this.validator, this.keyboardType,
    this.readOnly = false
  });

  final String hintText;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      validator: validator,
      keyboardType : keyboardType,
      decoration:  InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 60,
        ),
        prefixIconColor: Colors.white,
        hintStyle: hintStyle ?? txtRegularF14c7C7C7C,
      ),
    );
  }
}
