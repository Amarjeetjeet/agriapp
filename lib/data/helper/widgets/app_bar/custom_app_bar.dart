import 'package:agriapp/ui/cart/ui/cart_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          appBar,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: context.canPop(),
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgHelper(
                      imagePath: backBtn,
                      width: 26,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                style: txtMediumF18cWhite,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const CartUi(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: SvgHelper(
                    imagePath: cart,
                    width: 26,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
