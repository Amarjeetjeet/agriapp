import 'package:flutter/material.dart';

extension AlignmentX on Widget {
  Widget right() {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }
}
