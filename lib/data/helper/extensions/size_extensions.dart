import 'package:flutter/material.dart';

extension SizeX on double {
  Widget height() {
    return SizedBox(
      height: this,
    );
  }

  Widget width() {
    return SizedBox(
      width: this,
    );
  }
}
