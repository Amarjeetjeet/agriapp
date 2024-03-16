import 'package:flutter/material.dart';

class DisplayError extends StatelessWidget {
  const DisplayError({super.key, this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage ?? "Something went wrong"),
    );
  }
}
