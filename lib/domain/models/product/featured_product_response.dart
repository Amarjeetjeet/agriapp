class FeaturedProduct {
  FeaturedCategories? featuredCategories;
  bool? status;

  FeaturedProduct({this.featuredCategories, this.status});

  FeaturedProduct.fromJson(Map<String, dynamic> json) {
    featuredCategories = json['featured_categories'] != null
        ? FeaturedCategories.fromJson(json['featured_categories'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (featuredCategories != null) {
      data['featured_categories'] = featuredCategories!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class FeaturedCategories {
  int? categoryId;
  String? categoryName;
  List<Product>? product;

  FeaturedCategories({this.categoryId, this.categoryName, this.product});

  FeaturedCategories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? productId;
  String? productName;
  String? productDescription;
  String? productSalePrice;
  String? productRegularPrice;
  String? productPermalink;
  int? productStockQuantity;
  String? productImageFeaturedImageLink;

  Product(
      {this.productId,
        this.productName,
        this.productDescription,
        this.productSalePrice,
        this.productRegularPrice,
        this.productPermalink,
        this.productStockQuantity,
        this.productImageFeaturedImageLink});

  Product.fromJson(Map<String, dynamic> json) {
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
