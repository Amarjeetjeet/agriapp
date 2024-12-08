import 'dart:math';

import 'package:flutter/material.dart';

class GPay extends StatelessWidget {
  const GPay({
    super.key,
    required this.amount,
    required this.username,
    required this.upiId,
  });

  final String amount, username, upiId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF141414),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.25,
              ),
              Image.asset(
                "assets/gpay.jpeg",
                width: 120,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.06,
              ),
              Text(
                "\u{20B9}$amount.00",
                style: const TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Text(
                "Paid to $username",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              Text(
                "UPI ID: $upiId",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              Text(
                generateDateWithTime().toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                "UPI transaction ID: ${generateRandom12DigitNumber()}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String generateDateWithTime() {
    final now = DateTime.now();
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    final month = months[now.month - 1];
    final day = now.day;
    final year = now.year;
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'pm' : 'am';

    return "$day $month $year, $hour:$minute $period";
  }

  String generateRandom12DigitNumber() {
    final random = Random();
    final randomNumber = List.generate(12, (_) => random.nextInt(10)).join();
    return randomNumber;
  }
}
