import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../barrel.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.btnName,
    this.loaderVisible = false,
  });

  final VoidCallback? onTap;
  final String btnName;
  final bool loaderVisible;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        textStyle: txtSemiBoldF16White,
        minimumSize: Size(double.infinity, 7.h),
        backgroundColor: primaryColor,
        elevation: 0,
        shape: buildRoundedRectangleBorder(),
      ),
      icon: Center(
        child: Visibility(
          visible: loaderVisible,
          child: const SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
        ),
      ),
      label: Text(
        btnName,
        style: txtSemiBoldF16White,
      ),
    );
  }

}

RoundedRectangleBorder buildRoundedRectangleBorder() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32),
  );
}
