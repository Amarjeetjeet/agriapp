import 'package:agriapp/domain/models/auth/login_response.dart';
import 'package:agriapp/domain/models/order/order_input.dart';
import 'package:agriapp/domain/models/product/product_detail.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/category/category_list_response.dart';
import '../../../../domain/models/product/featured_product_response.dart';
import '../../../../domain/models/product/prodct_by_category_response.dart';
import '../base_client/base_client.dart';

class CategoryNetworkModule {
  BaseClientApi baseClient = BaseClientApi();

  Future<CategoryListResponse> allCategory() async {
    var res = await baseClient.post(
      "product_categories_list.php",
      {},
    );
    return CategoryListResponse.fromJson(res);
    // return CategoryListResponse.fromJson({
    //   "product_categries": [
    //     {
    //       "term_id": 714,
    //       "name": "AMARANTHUS SEEDS",
    //       "slug": "amaranthus-seeds",
    //       "term_group": 0,
    //       "term_taxonomy_id": 714,
    //       "taxonomy": "product_cat",
    //       "description": "",
    //       "parent": 97,
    //       "count": 2,
    //       "filter": "raw",
    //       "cat_ID": 714,
    //       "category_count": 2,
    //       "category_description": "",
    //       "cat_name": "AMARANTHUS SEEDS",
    //       "category_nicename": "amaranthus-seeds",
    //       "category_parent": 97
    //     },
    //     {
    //       "term_id": 154,
    //       "name": "Animal Feed",
    //       "slug": "animal-feed",
    //       "term_group": 0,
    //       "term_taxonomy_id": 154,
    //       "taxonomy": "product_cat",
    //       "description": "",
    //       "parent": 66,
    //       "count": 4,
    //       "filter": "raw",
    //       "cat_ID": 154,
    //       "category_count": 4,
    //       "category_description": "",
    //       "cat_name": "Animal Feed",
    //       "accategory_nicename": "animal-feed",
    //       "category_parent": 66
    //     },
    //     {
    //       "term_id": 66,
    //       "name": "Animal Husbandry",
    //       "slug": "animal-husbandry",
    //       "term_group": 0,
    //       "term_taxonomy_id": 66,
    //       "taxonomy": "product_cat",
    //       "description": "",
    //       "parent": 0,
    //       "count": 4,
    //       "filter": "raw",
    //       "cat_ID": 66,
    //       "category_count": 4,
    //       "category_description": "",
    //       "cat_name": "Animal Husbandry",
    //       "category_nicename": "animal-husbandry",
    //       "category_parent": 0
    //     },
    //   ]
    // });
  }

  Future<FeaturedProduct> featuredProduct(
      {required String productCategoryId}) async {
    var res = await baseClient.post(
      "featured_category.php",
      {
        "featured_categories": {"product_category_id": productCategoryId},
      },
    );

    return FeaturedProduct.fromJson(res);
    // return FeaturedProduct.fromJson({
    //   "featured_categories": {
    //     "category_id": 96,
    //     "category_name": "VAL SEEDS",
    //     "product": [
    //       {
    //         "product_id": 25798,
    //         "product_name": "INDO US RUTURAJ VAL - 500 GM",
    //         "product_description":
    //             "<table width=\"635\">\r\n<tbody>\r\n<tr>\r\n<td width=\"635\">INDO-US RUTURAJ Val Seeds Details :</td>\r\n</tr>\r\n<tr>\r\n<td>Scientific Name :Chloropetalum</td>\r\n</tr>\r\n<tr>\r\n<td>Seed rate :50-60 kg/ha.</td>\r\n</tr>\r\n<tr>\r\n<td>Seed colour :White.</td>\r\n</tr>\r\n<tr>\r\n<td>1st picking :50-60.</td>\r\n</tr>\r\n<tr>\r\n<td>Days to maturity :Mid early.</td>\r\n</tr>\r\n<tr>\r\n<td>Legume Shape :Lathy.</td>\r\n</tr>\r\n<tr>\r\n<td>Legume :6-7.</td>\r\n</tr>\r\n<tr>\r\n<td>Fruit colour :Light green.</td>\r\n</tr>\r\n<tr>\r\n<td>Season :Kharif, ravi</td>\r\n</tr>\r\n</tbody>\r\n</table>",
    //         "product_sale_price": "383",
    //         "product_regular_price": "699",
    //         "product_permalink":
    //             "https://agripari.com/product/indo-us-ruturaj-val/",
    //         "product_stock_quantity": null,
    //         "product_image_featured_image_link":
    //             "https://agripari.com/wp-content/uploads/2023/01/INDO-US-RUTURAJ.png"
    //       },
    //       {
    //         "product_id": 13988,
    //         "product_name": "DOLICHOS BEAN REMIK SURTI - 250GM",
    //         "product_description":
    //             "-  SOWING TIME:  JULY TO DECEMBER\r\n\r\n-Plants are straight, bushy and strong\r\n\r\n-Fruits are medium in size, averaging 5-7 cm in length, and are long, flat, and slightly curved in shape\r\n\r\n- The pods are smooth, thick, and pale green, tapering to a point on both ends\r\n\r\n-Fruits are typically 2-4 seeds contained in the pod that are white to buff, ovoid in shape, and slightly\r\n\r\ncompressed or flattened Fruits are mostly used when young tender &amp; green flavour\r\n\r\n-Remik Surti contain iron, magnesium, and calcium",
    //         "product_sale_price": "215",
    //         "product_regular_price": "250",
    //         "product_permalink":
    //             "https://agripari.com/product/dolichos-bean-remik-surti-250gm/",
    //         "product_stock_quantity": null,
    //         "product_image_featured_image_link":
    //             "https://agripari.com/wp-content/uploads/2020/12/DOLICHUS-BEAN-REMIK-VARDAN-1.jpg"
    //       },
    //       {
    //         "product_id": 13986,
    //         "product_name": "DOLICHOS BEAN REMIK VARDAN (250GM)",
    //         "product_description":
    //             "-  SOWING TIME:  JULY TO DECEMBER\r\n\r\n- Vigorous viny growth with dense foliage\r\n\r\n- Pods 10-12 per inflorescence, 7-8 cm long\r\n\r\n- Greenish white in colored\r\n\r\n- First picking at 45-50 days after sowing\r\n\r\n-Long cylindrical pods and early maturity\r\n\r\n-Continuous flushes under appropriate management practice",
    //         "product_sale_price": "215",
    //         "product_regular_price": "250",
    //         "product_permalink":
    //             "https://agripari.com/product/dolichos-bean-remik-vardan-250gm/",
    //         "product_stock_quantity": null,
    //         "product_image_featured_image_link":
    //             "https://agripari.com/wp-content/uploads/2020/12/DOLICHUS-BEAN-REMIK-VARDAN.jpg"
    //       }
    //     ]
    //   },
    //   "status": true
    // });
  }

  Future<CategoryByProduct> productByCategory({required int categoryId}) async {
    debugPrint("category id is $categoryId");
    var res = await baseClient.post(
      "category_wise_product.php",
      {
        "product_category": {"product_category_id": categoryId},
      },
    );

    return CategoryByProduct.fromJson(res);
  }

  Future<ProductDetail> getProductDetail({required int? productId}) async {
    debugPrint("The product id is $productId");
    final res = await baseClient.post(
      "product_detail.php",
      {
        "product_detail": {"product_id": productId},
      },
    );
    debugPrint("The product detail is $res");

    return ProductDetail.fromJson(res);
  }

  Future<LoginResponse> createOrder({required OrderInput orderInput}) async {
    debugPrint("The product id is $orderInput");
    final res = await baseClient.post(
      "create_order.php",
      {
        "product_detail": {"product_id": orderInput.toJson()},
      },
    );
    debugPrint("The product detail is $res");

    return LoginResponse.fromJson(res);
  }
}
