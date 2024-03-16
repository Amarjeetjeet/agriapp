import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/helper/barrel.dart';
import '../../data/router/rounter_config.dart';

class SplashScreenUi extends StatelessWidget {
  const SplashScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(
      () => Timer(const Duration(seconds: 1), () {
        context.pushReplacementNamed(RouterUtil.introScreen);
      }),
    );

    return Image.asset(
      splash,
      width: MediaQuery.sizeOf(context).width,
      fit: BoxFit.fitWidth,
      height: MediaQuery.sizeOf(context).height,
    );
  }
}
