import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';
import 'package:agriapp/domain/models/order/order_input.dart';
import 'package:agriapp/domain/models/product/product_detail.dart';
import 'package:flutter/material.dart';

import '../../../../domain/blocs/order/order_response.dart';
import '../../../../domain/models/category/category_list_response.dart';
import '../../../../domain/models/category/sub_category_list.dart';
import '../../../../domain/models/product/featured_product_response.dart';
import '../../../../domain/models/product/prodct_by_category_response.dart';
import '../../../../domain/models/search/search_response.dart';
import '../base_client/base_client.dart';

class ProductNetworkModule {
  static BaseClientApi baseClient = BaseClientApi();

  static Future<CategoryListResponse> allCategory() async {
    var res = await baseClient.post(
      "product_categories_list.php",
      {},
    );
    return CategoryListResponse.fromJson(res);
  }

  static Future<FeaturedProduct> featuredProduct({
    required String productCategoryId,
  }) async {
    var res = await baseClient.post(
      "featured_category.php",
      {
        "featured_categories": {"product_category_id": productCategoryId},
      },
    );
    return FeaturedProduct.fromJson(res);
  }

  static Future<CategoryByProduct> productByCategory({
    required int categoryId,
  }) async {
    debugPrint("category id is $categoryId");
    var res = await baseClient.post(
      "category_wise_product.php",
      {
        "product_category": {"product_category_id": categoryId},
      },
    );

    return CategoryByProduct.fromJson(res);
  }

  static Future<SubCategoryListResponse> subCategory({
    required int categoryId,
  }) async {
    var res = await baseClient.post(
      "sub_category.php",
      {
        "sub_categories": {"category_id": categoryId},
      },
    );

    return SubCategoryListResponse.fromJson(res);
  }

  static Future<ProductDetail> getProductDetail({
    required int? productId,
  }) async {
    final res = await baseClient.post(
      "product_detail.php",
      {
        "product_detail": {"product_id": productId},
      },
    );

    return ProductDetail.fromJson(res);
  }

  static Future<OrderCreateResponse> createOrder({
    required OrderInput orderInput,
  }) async {
    debugPrint("The product input is ${orderInput.toJson()}");

    final res = await baseClient.post(
      "create_order.php",
      {
        "create_order": orderInput.createOrder?.toJson(),
      },
    );

    return OrderCreateResponse.fromJson(res);
  }

  static Future<SearchResponse> searchProduct({
    required String keyword,
  }) async {
    final res = await baseClient.post(
      "search_products.php",
      {
        "search": {"keyword": keyword}
      },
    );

    return SearchResponse.fromJson(res);
  }

  static Future<Map<String, dynamic>>? orderList() async {
    final res = await baseClient.post(
      "order_list_user.php",
      {
        "order_list": {
          "user_id": PreferenceUtils.getString(PreferenceUtils.USERID),
        }
      },
    );

    return res;
  }
}
