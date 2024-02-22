import 'package:agriapp/helper/barrel.dart';
import 'package:agriapp/ui/auth/register/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

void main() {
  runApp(const EntryPoint());
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24.0.dp,
              vertical: 18.0.dp,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: cF0f0f0, width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
        ),
        home: const RegisterUi(),
      );
    });
  }
}
