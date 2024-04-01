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
  List<Product>? product;

  CategoryProductList({this.product});

  CategoryProductList.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  List<Variation>? variation;
  String? productSalePrice;
  String? productRegularPrice;
  String? productPermalink;
  int? productStockQuantity;
  String? productImageFeaturedImageLink;

  Product({
    this.productId,
    this.productName,
    this.productDescription,
    this.variation,
    this.productSalePrice,
    this.productRegularPrice,
    this.productPermalink,
    this.productStockQuantity,
    this.productImageFeaturedImageLink,
  });

  bool? get isVariationProduct {
    return variation != null && (variation ?? []).isNotEmpty;
  }

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productSalePrice = json['product_sale_price'];
    productRegularPrice = json['product_regular_price'];
    productPermalink = json['product_permalink'];
    productStockQuantity = json['product_stock_quantity'];
    productImageFeaturedImageLink = json['product_image_featured_image_link'];
    if (json['variation'] != null) {
      variation = <Variation>[];
      json['variation'].forEach((v) {
        variation!.add(Variation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_description'] = productDescription;
    if (variation != null) {
      data['variation'] = variation!.map((v) => v.toJson()).toList();
    }
    data['product_sale_price'] = productSalePrice;
    data['product_regular_price'] = productRegularPrice;
    data['product_permalink'] = productPermalink;
    data['product_stock_quantity'] = productStockQuantity;
    data['product_image_featured_image_link'] = productImageFeaturedImageLink;
    return data;
  }
}

class Variation {
  ProductVariationAttributes? productVariationAttributes;
  int? productVariationId;
  String? productSalePrice;
  String? productRegularPrice;
  String? productPermalink;
  int? productStockQuantity;
  String? productImageFeaturedImageLink;

  Variation(
      {this.productVariationAttributes,
      this.productVariationId,
      this.productSalePrice,
      this.productRegularPrice,
      this.productPermalink,
      this.productStockQuantity,
      this.productImageFeaturedImageLink});

  Variation.fromJson(Map<String, dynamic> json) {
    productVariationAttributes = json['product_variation_attributes'] != null
        ? ProductVariationAttributes.fromJson(
            json['product_variation_attributes'])
        : null;
    productVariationId = json['product_variation_id'];
    productSalePrice = json['product_sale_price'];
    productRegularPrice = json['product_regular_price'];
    productPermalink = json['product_permalink'];
    productStockQuantity = json['product_stock_quantity'];
    productImageFeaturedImageLink = json['product_image_featured_image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productVariationAttributes != null) {
      data['product_variation_attributes'] =
          productVariationAttributes!.toJson();
    }
    data['product_variation_id'] = productVariationId;
    data['product_sale_price'] = productSalePrice;
    data['product_regular_price'] = productRegularPrice;
    data['product_permalink'] = productPermalink;
    data['product_stock_quantity'] = productStockQuantity;
    data['product_image_featured_image_link'] = productImageFeaturedImageLink;
    return data;
  }
}

class ProductVariationAttributes {
  String? attributePa10gm;

  ProductVariationAttributes({this.attributePa10gm});

  ProductVariationAttributes.fromJson(Map<String, dynamic> json) {
    attributePa10gm = json['attribute_pa_10gm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attribute_pa_10gm'] = attributePa10gm;
    return data;
  }
}
