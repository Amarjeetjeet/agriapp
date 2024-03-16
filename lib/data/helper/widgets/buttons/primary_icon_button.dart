import 'package:flutter/material.dart';

import '../../barrel.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    super.key,
    required this.onTap,
    required this.btnName,
    this.loaderVisible = false, required this.icon,
  });

  final VoidCallback? onTap;
  final String btnName;
  final Widget icon;
  final bool loaderVisible;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(MediaQuery.sizeOf(context).width, 60),
        side: BorderSide(color: primaryColor),
        foregroundColor: primaryColor,
        backgroundColor: primaryColor,
        elevation: 0,
        shape: buildRoundedRectangleBorder(),
      ),
      icon: icon,
      label: Text(
        btnName,
        style: txtSemiBoldF16White,
      ),
    );
  }

}