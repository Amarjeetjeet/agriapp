import 'package:flutter/material.dart';

import '../../../../data/helper/barrel.dart';
import '../../../../domain/models/category/category_list_response.dart';
import '../category_wise_product/category_wise_products.dart';

class CategoryListAll extends StatefulWidget {
  const CategoryListAll({super.key, required this.categoryListResponse});

  final CategoryListResponse? categoryListResponse;

  @override
  State<CategoryListAll> createState() => _CategoryListAllState();
}

class _CategoryListAllState extends State<CategoryListAll> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        suffixIcon: Icons.shopping_cart_outlined,
        title: "Category",
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      body: ListView.separated(
        itemCount: (widget.categoryListResponse?.productCategries ?? []).length,
        itemBuilder: (c, i) {
          ProductCategries? productCategory =
              widget.categoryListResponse?.productCategries?[i];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CategoryWiseProducts(
                    categoryId: productCategory?.catID ?? 0,
                    categoryName: productCategory?.catName,
                  ),
                ),
              );
            },
            contentPadding: const EdgeInsets.all(16),
            leading: IconButton.outlined(
              onPressed: () {},
              style: IconButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                side: BorderSide(
                  width: 1,
                  color: cD9D9D9,
                ),
              ),
              icon: Icon(
                Icons.person_outline,
                color: primaryColor,
              ),
            ),
            title: Text(
              productCategory?.catName ?? "",
              style: txtRegularF16cBlack,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Divider(
              color: cEEE,
              thickness: 2,
            ),
          );
        },
      ),
    );
  }
}
