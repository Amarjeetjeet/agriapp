class OrderInput {
  CreateOrder? createOrder;

  OrderInput({this.createOrder});

  OrderInput.fromJson(Map<String, dynamic> json) {
    createOrder = json['create_order'] != null
        ? CreateOrder.fromJson(json['create_order'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createOrder != null) {
      data['create_order'] = createOrder!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'OrderInput{createOrder: $createOrder}';
  }
}

class CreateOrder {
  List<ProductData>? productData;
  UserData? userData;
  ShippingData? shippingData;
  CuponData? cuponData;
  PaymentData? paymentData;

  CreateOrder(
      {this.productData,
        this.userData,
        this.shippingData,
        this.cuponData,
        this.paymentData});

  CreateOrder.fromJson(Map<String, dynamic> json) {
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(ProductData.fromJson(v));
      });
    }
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
    shippingData = json['shipping_data'] != null
        ? ShippingData.fromJson(json['shipping_data'])
        : null;
    cuponData = json['cupon_data'] != null
        ? CuponData.fromJson(json['cupon_data'])
        : null;
    paymentData = json['payment_data'] != null
        ? PaymentData.fromJson(json['payment_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productData != null) {
      data['product_data'] = productData!.map((v) => v.toJson()).toList();
    }
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    if (shippingData != null) {
      data['shipping_data'] = shippingData!.toJson();
    }
    if (cuponData != null) {
      data['cupon_data'] = cuponData!.toJson();
    }
    if (paymentData != null) {
      data['payment_data'] = paymentData!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'CreateOrder{productData: $productData, userData: $userData, shippingData: $shippingData, cuponData: $cuponData, paymentData: $paymentData}';
  }
}

class ProductData {
  String? productId;
  String? qty;

  ProductData({this.productId, this.qty});

  ProductData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    qty = json['Qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['Qty'] = qty;
    return data;
  }

  @override
  String toString() {
    return 'ProductData{productId: $productId, qty: $qty}';
  }
}

class UserData {
  String? userId;
  String? firstName;
  String? lastName;
  String? company;
  String? email;
  String? phone;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;

  UserData(
      {this.userId,
        this.firstName,
        this.lastName,
        this.company,
        this.email,
        this.phone,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.postcode,
        this.country});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    email = json['email'];
    phone = json['phone'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['company'] = company;
    data['email'] = email;
    data['phone'] = phone;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['postcode'] = postcode;
    data['country'] = country;
    return data;
  }
}

class ShippingData {
  String? deviveryCharg;

  ShippingData({this.deviveryCharg});

  ShippingData.fromJson(Map<String, dynamic> json) {
    deviveryCharg = json['devivery_charg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['devivery_charg'] = deviveryCharg;
    return data;
  }
}

class CuponData {
  String? cuponCode;
  String? cuponType;

  CuponData({this.cuponCode, this.cuponType});

  CuponData.fromJson(Map<String, dynamic> json) {
    cuponCode = json['cupon_code'];
    cuponType = json['cupon_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cupon_code'] = cuponCode;
    data['cupon_type'] = cuponType;
    return data;
  }
}

class PaymentData {
  String? paymentMethod;
  String? paymentMethodTitle;

  PaymentData({this.paymentMethod, this.paymentMethodTitle});

  PaymentData.fromJson(Map<String, dynamic> json) {
    paymentMethod = json['payment_method'];
    paymentMethodTitle = json['payment_method_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_method'] = paymentMethod;
    data['payment_method_title'] = paymentMethodTitle;
    return data;
  }
}
