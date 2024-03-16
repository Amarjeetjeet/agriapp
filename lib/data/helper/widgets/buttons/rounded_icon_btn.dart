import 'package:flutter/material.dart';

import '../../barrel.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key,
    this.circleSize = 40,
    this.iconSize,
    required this.iconData,
    this.onTap,
  });

  final double circleSize;
  final double? iconSize;
  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: circleSize,
        width: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryColor,
        ),
        child: Icon(
          iconData,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
