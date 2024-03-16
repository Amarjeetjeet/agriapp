import 'package:flutter/material.dart';

import '../../../../data/helper/barrel.dart';

class HeaderWithButton extends StatelessWidget {
  const HeaderWithButton({
    super.key,
    required this.title,
    required this.btnText,
    this.onPressed,
  });

  final String title, btnText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: txtMediumF20c383838,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            btnText,
            style: txtMediumF16cPrimary,
          ),
        ),
      ],
    );
  }
}
