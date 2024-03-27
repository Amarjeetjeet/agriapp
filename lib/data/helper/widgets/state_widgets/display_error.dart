import 'package:flutter/material.dart';

class DisplayError extends StatelessWidget {
  const DisplayError({super.key, this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Text(
          errorMessage ?? "Something went wrong",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
