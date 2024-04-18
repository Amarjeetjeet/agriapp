import 'package:flutter/material.dart';
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
              height: MediaQuery.sizeOf(context).height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgHelper(
                    imagePath: logo,
                    width: 150,
                    color: Colors.white,
                  ),
                  20.0.height(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.75,
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 32.0,
                      ),
                      child: Column(
                        children: [
                          Text(
                            header,
                            style: txtSemiBoldF24c383838,
                          ),
                          20.0.height(),
                          body ?? const SizedBox(),
                          PrimaryButton(
                            onTap: onTap,
                            btnName: btnText,
                          ),
                          20.0.height(),
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
