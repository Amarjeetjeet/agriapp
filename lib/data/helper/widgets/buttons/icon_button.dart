import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn({
    super.key,
    required this.icon,
    required this.btnName,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.isWhite = false,
  });

  final Widget icon;
  final String btnName;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0.6,
            foregroundColor: Colors.black,
            minimumSize: Size(MediaQuery.of(context).size.width, 55)),
        label: Text(
          btnName,
          // style: isWhite
          //     ? FontStyle.txtPoppinsW500S16CFFFFFF
          //     : FontStyle.txtPoppinsW500S16C161616,
        ),
        icon: icon);
  }
}
