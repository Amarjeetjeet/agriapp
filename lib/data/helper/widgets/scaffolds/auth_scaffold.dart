import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../barrel.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    this.body,
    required this.header,
    required this.btnText,
    required this.spanText,
    required this.spanBoldText,
    required this.onTap,
    this.onSpanTap,
  });

  final Widget? body;
  final String header;
  final String btnText;
  final String spanText;
  final String spanBoldText;
  final void Function() onTap;
  final void Function()? onSpanTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Adaptive.h(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgHelper(
                    imagePath: logo,
                    width: 130.dp,
                    color: Colors.white,
                  ),
                  (2.0).h.height(),
                ],
              ),
            ),
            SizedBox(
              height: Adaptive.h(75),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32.0),
                        topLeft: Radius.circular(32.0),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Opacity(
                      opacity: 0.1,
                      child: SvgHelper(
                        imagePath: tree,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.dp, vertical: 32.0.dp),
                      child: Column(
                        children: [
                          Text(
                            header,
                            style: txtSemiBoldF24c383838,
                          ),
                          5.0.h.height(),
                          body ?? const SizedBox(),
                          PrimaryButton(
                            onTap: onTap,
                            btnName: btnText,
                          ),
                          3.0.h.height(),
                          InkWell(
                            onTap: onSpanTap,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: spanText,
                                    style: txtRegularF14c383838,
                                  ),
                                  TextSpan(
                                    text: spanBoldText,
                                    style: txtBoldF14cPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
