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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Text(
            title,
            style: txtMediumF20c383838,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(width: 20,),
        InkWell(
          onTap: onPressed,
          child: Text(
            btnText,
            style: txtMediumF16cPrimary,
          ),
        ),
      ],
    );
  }
}
