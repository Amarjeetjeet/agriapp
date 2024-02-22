import 'package:flutter/material.dart';

import '../../barrel.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onTap,
    required this.btnName,
  });

  final VoidCallback? onTap;
  final String btnName;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 59),
        side: BorderSide(color: primaryColor),
        foregroundColor: primaryColor,
        backgroundColor: Colors.white,
        elevation: 0,
        shape: buildRoundedRectangleBorder(),
      ),
      child: Text(
        btnName,
        style: txtSemiBoldF16Primary,
      ),
    );
  }
}
