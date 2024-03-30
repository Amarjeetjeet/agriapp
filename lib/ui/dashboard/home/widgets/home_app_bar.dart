import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../data/helper/barrel.dart';
import '../../../search_product/search_product.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.onSuffixIconPress,
  });

  final void Function()? onSuffixIconPress;

  static const double height = 280;

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(48),
              bottomRight: Radius.circular(48),
            ),
            color: primaryColor,
          ),
        ),
        Image.asset(
          leaf,
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: height,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton.outlined(
                        style: buildIconOutlineStyleFrom(),
                        onPressed: () {},
                        icon: SvgHelper(
                          imagePath: menu,
                        ),
                      ),
                      Text(
                        "Delivery to",
                        style: txtMediumF18cWhite,
                      ),
                      IconButton.outlined(
                        style: buildIconOutlineStyleFrom(),
                        onPressed: onSuffixIconPress,
                        icon: SvgHelper(
                          imagePath: notificationIcon,
                        ),
                      ),
                    ],
                  ),
                  1.6.h.height(),
                  Text(
                    DateTime.now().greeting,
                    style: txtMediumF24cWhite,
                  ),
                  Text(
                    PreferenceUtils.getString(PreferenceUtils.USERNAME),
                    style: txtMediumF24cWhite,
                  ),
                  1.3.h.height(),
                  MyTextField(
                    readOnly: true,
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const SearchProduct(),
                        ),
                      );
                    },
                    hintText: "Search Menu",
                    prefixIcon: const Icon(Icons.search),
                    hintStyle: txtRegularF14cWhite,
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
