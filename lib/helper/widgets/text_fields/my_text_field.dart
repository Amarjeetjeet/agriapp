import 'package:flutter/material.dart';

import '../../barrel.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key,  required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: txtRegularF14c7C7C7C,
      ),
    );
  }
}
