class SearchResponse {
  List<SearchProductList>? searchProductList;
  String? message;
  bool? status;

  SearchResponse({this.searchProductList, this.message, this.status});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['serach_product_list'] != null) {
      searchProductList = <SearchProductList>[];
      json['serach_product_list'].forEach((v) {
        searchProductList!.add(SearchProductList.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (searchProductList != null) {
      data['serach_product_list'] =
          searchProductList!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class SearchProductList {
  int? productId;
  String? productName;
  String? productDescription;
  String? productSalePrice;
  String? productRegularPrice;
  String? productPermalink;
  int? productStockQuantity;
  String? productImageFeaturedImageLink;

  SearchProductList(
      {this.productId,
        this.productName,
        this.productDescription,
        this.productSalePrice,
        this.productRegularPrice,
        this.productPermalink,
        this.productStockQuantity,
        this.productImageFeaturedImageLink});

  SearchProductList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productSalePrice = json['product_sale_price'];
    productRegularPrice = json['product_regular_price'];
    productPermalink = json['product_permalink'];
    productStockQuantity = json['product_stock_quantity'];
    productImageFeaturedImageLink = json['product_image_featured_image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_description'] = productDescription;
    data['product_sale_price'] = productSalePrice;
    data['product_regular_price'] = productRegularPrice;
    data['product_permalink'] = productPermalink;
    data['product_stock_quantity'] = productStockQuantity;
    data['product_image_featured_image_link'] =
        productImageFeaturedImageLink;
    return data;
  }
}
