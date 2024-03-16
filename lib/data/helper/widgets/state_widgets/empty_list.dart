import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key, this.message = "No items available"});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
