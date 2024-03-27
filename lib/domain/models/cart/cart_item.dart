class CartItems {
  int? productId;
  String? productName;
  String? productImage;
  double? regularPrice;
  double? discountedPrice;
  int? quantity;

  CartItems(
      {this.productId,
        this.productName,
        this.productImage,
        this.regularPrice,
        this.discountedPrice,
        this.quantity});

  CartItems.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productImage = json['productImage'];
    regularPrice = json['regularPrice'];
    discountedPrice = json['discountedPrice'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
    data['productImage'] = productImage;
    data['regularPrice'] = regularPrice;
    data['discountedPrice'] = discountedPrice;
    data['quantity'] = quantity;
    return data;
  }

  @override
  String toString() {
    return 'CartItems{productId: $productId, productName: $productName, productImage: $productImage, regularPrice: $regularPrice, discountedPrice: $discountedPrice, quantity: $quantity}';
  }
}
