import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../data/helper/barrel.dart';
import '../../../search_product/search_product.dart';

class HomeAppBar extends StatelessWidget  {
  const HomeAppBar({
    super.key,
    this.onSuffixIconPress,
    required this.menu
  });

  final void Function()? onSuffixIconPress;
  final Widget menu;

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
          height: 250,
        ),
        Image.asset(
          leaf,
          height: 200,
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 250,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      menu,
                      // Text(
                      //   "Delivery to",
                      //   style: txtMediumF18cWhite,
                      // ),
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
                    style: txtMediumF18cWhite,
                  ),
                  Text(
                    PreferenceUtils.getString(PreferenceUtils.USERNAME),
                    style: txtMediumF18cWhite,
                  ),
                  1.3.h.height(),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SearchProduct(),
                      ),
                    ),
                    child: Container(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Row(
                        children: [
                          20.0.width(),
                          SvgHelper(imagePath: search),
                          10.0.width(),
                          Text(
                            "Search Menu",
                            style: txtRegularF14cWhite,
                          ),
                        ],
                      ),
                    ),
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
