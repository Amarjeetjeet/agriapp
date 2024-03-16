import 'package:flutter/material.dart';
import '../../barrel.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.prefixIcon = Icons.arrow_back_ios_new_rounded,
    required this.suffixIcon,
    this.onBackPress,
    this.onSuffixIconPress,
    required this.title,
  });

  final IconData prefixIcon, suffixIcon;
  final void Function()? onBackPress, onSuffixIconPress;
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          appBar,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconOutlineButton(
                onTap: onBackPress,
                icon: prefixIcon,
              ),
              Text(
                title,
                style: txtMediumF18cWhite,
              ),
              IconOutlineButton(
                onTap: onSuffixIconPress,
                icon: suffixIcon,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
