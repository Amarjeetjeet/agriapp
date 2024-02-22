import 'package:agriapp/helper/barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.dp),
              child: Column(
                children: [
                  20.h.height(),
                  Center(
                    child: SvgHelper(
                      imagePath: logo,
                      width: 50.w,
                    ),
                  ),
                  8.h.height(),
                  Text(
                    "Agri Pari",
                    style: txtSemiBoldF32c383838,
                  ),
                  (1.5).h.height(),
                  Text(
                    "Lorem ipsum is placeholder text commonly used in the graphic,"
                    " print, and publishing industries for previewing layouts and"
                    " visual mockups.",
                    textAlign: TextAlign.center,
                    style: txtRegularF16c383838,
                  ),
                  8.h.height(),
                  PrimaryButton(
                    onTap: () {},
                    btnName: 'Log in',
                  ),
                  2.h.height(),
                  SecondaryButton(
                    onTap: () {},
                    btnName: 'Sign up',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
