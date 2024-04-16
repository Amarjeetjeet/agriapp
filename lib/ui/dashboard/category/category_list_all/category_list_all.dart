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
        title: "Category",
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      body: ListView.separated(
        itemCount: (widget.categoryListResponse?.productCategries?.category ?? []).length,
        itemBuilder: (c, i) {
          Category? productCategory =
              widget.categoryListResponse?.productCategries?.category?[i];
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
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: cD9D9D9,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.network(
                productCategory?.image ?? "",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (___, __ , _) => Image.asset(
                  catImg,
                  width: 26,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            title: Text(
              productCategory?.name ?? "",
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
