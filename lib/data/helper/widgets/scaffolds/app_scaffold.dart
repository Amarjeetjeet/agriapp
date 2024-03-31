import 'package:flutter/material.dart';

import '../../barrel.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      required this.body,
      this.drawer,
      this.appBar,
      this.bottomNavigationBar});

  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          background,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.fill,
          opacity: const AlwaysStoppedAnimation(.97),
        ),
        Scaffold(
          drawerEnableOpenDragGesture: false,
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: body,
          drawer: drawer,
        ),
      ],
    );
  }
}
