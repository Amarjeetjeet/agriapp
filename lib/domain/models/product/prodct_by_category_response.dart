class CategoryByProduct {
  CategoryProductList? categoryProductList;
  bool? status;

  CategoryByProduct({this.categoryProductList, this.status});

  CategoryByProduct.fromJson(Map<String, dynamic> json) {
    categoryProductList = json['category_product_list'] != null
        ? CategoryProductList.fromJson(json['category_product_list'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categoryProductList != null) {
      data['category_product_list'] = categoryProductList!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class CategoryProductList {
  List<ProductList>? productList;

  CategoryProductList({this.productList});

  CategoryProductList.fromJson(Map<String, dynamic> json) {
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productList != null) {
      data['product_list'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {
  int? productId;
  String? productName;
  String? productDescription;
  String? productSalePrice;
  String? productRegularPrice;
  String? productPermalink;
  int? productStockQuantity;
  String? productImageFeaturedImageLink;

  ProductList(
      {this.productId,
        this.productName,
        this.productDescription,
        this.productSalePrice,
        this.productRegularPrice,
        this.productPermalink,
        this.productStockQuantity,
        this.productImageFeaturedImageLink});

  ProductList.fromJson(Map<String, dynamic> json) {
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
