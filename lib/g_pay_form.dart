import 'package:flutter/material.dart';

import 'g_pay.dart';

class GPayForm extends StatefulWidget {
  const GPayForm({super.key});

  @override
  State<GPayForm> createState() => _GPayFormState();
}

class _GPayFormState extends State<GPayForm> {
  final amountController = TextEditingController();
  final usernameController = TextEditingController();
  final upiIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF141414),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                ),
                Image.asset(
                  "assets/gpay.jpeg",
                  width: 90,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.11,
                ),
                // Editable amount field
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Enter Amount",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value) => setState(() {}),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.01,
                ),
                // Editable username field
                TextField(
                  controller: usernameController,
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value) => setState(() {}),
                ),
            
                // Editable UPI ID field
                TextField(
                  controller: upiIdController,
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Enter UPI ID",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value) => setState(() {}),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => GPay(
                          amount: amountController.text,
                          username: usernameController.text,
                          upiId: upiIdController.text,
                        ),
                      ),
                    );
                  },
                  child: Text("go"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
