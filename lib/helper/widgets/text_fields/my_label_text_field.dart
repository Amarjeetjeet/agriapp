import 'package:agriapp/helper/widgets/text_fields/my_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../barrel.dart';

class MyLabelTextField extends StatelessWidget {
  const MyLabelTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.passwordField = false,
  });

  final String label;
  final String hintText;
  final bool passwordField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: label,
                style: txtRegularF14c7C7C7C,
              ),
              const TextSpan(
                text: " *",
                style: TextStyle(
                  color: Color(0XFFE5646C),
                ),
              ),
            ],
          ),
        ),
        1.2.h.height(),
        if (!passwordField) ...[
          MyTextField(
            hintText: hintText,
          ),
        ],
        if (passwordField) ...[
          MyPasswordField(
            hintText: hintText,
          )
        ]
      ],
    );
  }
}
