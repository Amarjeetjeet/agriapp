import 'dart:async';

import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/helper/barrel.dart';
import '../../data/router/rounter_config.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {

  @override
  Widget build(BuildContext context) {
    Future.microtask(
      () => Timer(const Duration(seconds: 3), () {
        debugPrint("User id is ${PreferenceUtils.getString(PreferenceUtils.USERID)}");
        if(PreferenceUtils.getString(PreferenceUtils.USERID).isNotEmpty){
          context.pushReplacementNamed(RouterUtil.homeUi);
        }else{
          context.pushReplacementNamed(RouterUtil.introScreen);
        }
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
