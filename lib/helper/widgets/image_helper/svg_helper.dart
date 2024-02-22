import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgHelper extends StatelessWidget {
  const SvgHelper({
    super.key,
    this.width,
    this.height,
    this.color,
    required this.imagePath,
  });

  final double? width, height;
  final String imagePath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      color: color,
    );
  }
}
