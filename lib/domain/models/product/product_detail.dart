class ProductDetail {
  ProductDetails? productDetails;

  ProductDetail({this.productDetails});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    productDetails = json['product_details'] != null
        ? ProductDetails.fromJson(json['product_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productDetails != null) {
      data['product_details'] = productDetails!.toJson();
    }
    return data;
  }
}

class ProductDetails {
  int? productId;
  String? productType;
  String? productName;
  String? productSlug;
  String? productStatus;
  bool? productFeatured;
  String? productVisibility;
  String? productDescription;
  String? productShortDescription;
  String? productSku;
  int? productMenuOrder;
  bool? productVirtual;
  String? productLink;
  String? productPrice;
  String? productRegularPrice;
  String? productSalePrice;
  int? productTotalSales;
  String? productTaxStatus;
  String? productTaxClass;
  bool? productManageStock;
  String? productStockStatus;
  String? productBackorders;
  bool? productSoldIndividually;
  String? productPurchaseNote;
  int? productShippingClassId;
  String? productWeight;
  String? productLength;
  String? productWidth;
  String? productHeight;
  String? productDimensions;
  int? productParentId;
  String? productAttributeid;
  List<int>? productCategoryIds;
  int? productDownloadExpiry;
  bool? productDownloadable;
  int? productDownloadLimit;
  List<dynamic>? productImageFeaturedImageLink;
  List<dynamic>? productGalleryImageIds;
  bool? productReviewsAllowed;
  String? productAverageRating;
  int? productReviewCount;

  ProductDetails(
      {this.productId,
        this.productType,
        this.productName,
        this.productSlug,
        this.productStatus,
        this.productFeatured,
        this.productVisibility,
        this.productDescription,
        this.productShortDescription,
        this.productSku,
        this.productMenuOrder,
        this.productVirtual,
        this.productLink,
        this.productPrice,
        this.productRegularPrice,
        this.productSalePrice,
        this.productTotalSales,
        this.productTaxStatus,
        this.productTaxClass,
        this.productManageStock,
        this.productStockStatus,
        this.productBackorders,
        this.productSoldIndividually,
        this.productPurchaseNote,
        this.productShippingClassId,
        this.productWeight,
        this.productLength,
        this.productWidth,
        this.productHeight,
        this.productDimensions,
        this.productParentId,
        this.productAttributeid,
        this.productCategoryIds,
        this.productDownloadExpiry,
        this.productDownloadable,
        this.productDownloadLimit,
        this.productImageFeaturedImageLink,
        this.productGalleryImageIds,
        this.productReviewsAllowed,
        this.productAverageRating,
        this.productReviewCount});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productType = json['product_type'];
    productName = json['product_name'];
    productSlug = json['product_slug'];
    productStatus = json['product_status'];
    productFeatured = json['product_featured'];
    productVisibility = json['product_visibility'];
    productDescription = json['product_description'];
    productShortDescription = json['product_short_description'];
    productSku = json['product_sku'];
    productMenuOrder = json['product_menu_order'];
    productVirtual = json['product_virtual'];
    productLink = json['product_link'];
    productPrice = json['product_price'];
    productRegularPrice = json['product_regular_price'];
    productSalePrice = json['product_sale_price'];
    productTotalSales = json['product_total_sales'];
    productTaxStatus = json['product_tax_status'];
    productTaxClass = json['product_tax_class'];
    productManageStock = json['product_manage_stock'];
    productStockStatus = json['product_stock_status'];
    productBackorders = json['product_backorders'];
    productSoldIndividually = json['product_sold_individually'];
    productPurchaseNote = json['product_purchase_note'];
    productShippingClassId = json['product_shipping_class_id'];
    productWeight = json['product_weight'];
    productLength = json['product_length'];
    productWidth = json['product_width'];
    productImageFeaturedImageLink = json['product_image_featured_image_link'];
    productHeight = json['product_height'];
    productDimensions = json['product_dimensions'];
    productParentId = json['product_parent_id'];
    productAttributeid = json['product_attributeid'];
    productDownloadExpiry = json['product_download_expiry'];
    productGalleryImageIds = json['product_category_ids'];
    productDownloadable = json['product_downloadable'];
    productDownloadLimit = json['product_download_limit'];
    productReviewsAllowed = json['product_reviews_allowed'];
    productAverageRating = json['product_average_rating'];
    productReviewCount = json['product_review_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_type'] = productType;
    data['product_name'] = productName;
    data['product_slug'] = productSlug;
    data['product_status'] = productStatus;
    data['product_featured'] = productFeatured;
    data['product_visibility'] = productVisibility;
    data['product_description'] = productDescription;
    data['product_short_description'] = productShortDescription;
    data['product_sku'] = productSku;
    data['product_menu_order'] = productMenuOrder;
    data['product_virtual'] = productVirtual;
    data['product_link'] = productLink;
    data['product_price'] = productPrice;
    data['product_regular_price'] = productRegularPrice;
    data['product_sale_price'] = productSalePrice;
    data['product_total_sales'] = productTotalSales;
    data['product_tax_status'] = productTaxStatus;
    data['product_tax_class'] = productTaxClass;
    data['product_manage_stock'] = productManageStock;
    data['product_stock_status'] = productStockStatus;
    data['product_backorders'] = productBackorders;
    data['product_sold_individually'] = productSoldIndividually;
    data['product_purchase_note'] = productPurchaseNote;
    data['product_shipping_class_id'] = productShippingClassId;
    data['product_weight'] = productWeight;
    data['product_length'] = productLength;
    data['product_width'] = productWidth;
    data['product_height'] = productHeight;
    data['product_dimensions'] = productDimensions;
    data['product_parent_id'] = productParentId;
    data['product_attributeid'] = productAttributeid;
    data['product_category_ids'] = productCategoryIds;
    data['product_download_expiry'] = productDownloadExpiry;
    data['product_downloadable'] = productDownloadable;
    data['product_download_limit'] = productDownloadLimit;
    data['product_image_featured_image_link'] =
        productImageFeaturedImageLink;
    data['product_gallery_image_ids'] = productGalleryImageIds;
    data['product_reviews_allowed'] = productReviewsAllowed;
    data['product_average_rating'] = productAverageRating;
    data['product_review_count'] = productReviewCount;
    return data;
  }
}
