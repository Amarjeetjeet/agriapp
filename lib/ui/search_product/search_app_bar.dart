import 'package:agriapp/ui/search_product/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/helper/barrel.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  static const double height = 180;

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
                        onPressed: () {
                          context.pop();
                        },
                        icon: SvgHelper(
                          imagePath: backBtn,
                        ),
                      ),
                      IconButton.outlined(
                        style: buildIconOutlineStyleFrom(),
                        onPressed: () {},
                        icon: SvgHelper(
                          imagePath: cart,
                        ),
                      ),
                    ],
                  ),
                  20.0.height(),
                  TextFormField(
                    onChanged: (String keyword) {
                      context
                          .read<SearchCubit>()
                          .searchProduct(keyword: keyword);
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search Menu",
                      prefixIcon: const Icon(Icons.search),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 60,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      prefixIconColor: Colors.white,
                      hintStyle: txtMediumF12cWhite,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
