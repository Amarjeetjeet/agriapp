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
    return ElevatedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(MediaQuery.sizeOf(context).width, 60),
        side: BorderSide(color: primaryColor),
        foregroundColor: primaryColor,
        backgroundColor: primaryColor,
        elevation: 0,
        shape: buildRoundedRectangleBorder(),
      ),
      child: Text(
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
