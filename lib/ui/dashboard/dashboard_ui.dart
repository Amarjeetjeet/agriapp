import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/ui/cart/ui/cart_ui.dart';
import 'package:agriapp/ui/dashboard/home/home_ui.dart';
import 'package:flutter/material.dart';

import 'category/category_wise_product/category_wise_products.dart';

class DashboardUi extends StatefulWidget {
  const DashboardUi({super.key});

  @override
  State<DashboardUi> createState() => _DashboardUiState();
}

class _DashboardUiState extends State<DashboardUi> {
  int _selectedIndex = 0;
  List<Widget> pageList = [];
  List<String> imageIcon = [home, discount, cart, userSvg];
  List<String> name = ["Home", "Offers", "Cart", "Profile"];

  @override
  void initState() {
    pageList.add(
      const HomeUi(),
    );
    pageList.add(
      const CategoryWiseProducts(
        categoryId: 466,
        categoryName: "Offers",
      ),
    );
    pageList.add(
      const CartUi(),
    );
    pageList.add(
      const Text(
        'Index 4: School',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pageList,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            pageList.length,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / pageList.length,
                  ),
                  Container(
                    height: 10,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _selectedIndex == index
                          ? primaryColor
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    width:
                        ((MediaQuery.sizeOf(context).width / pageList.length) -
                            50),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SvgHelper(
                    imagePath: imageIcon[index],
                    color: _selectedIndex == index ? primaryColor : c7C7C7C,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    name[index],
                    style: _selectedIndex == index
                        ? txtMediumF12cPrimary
                        : txtRegularF12c7C7C7C,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
