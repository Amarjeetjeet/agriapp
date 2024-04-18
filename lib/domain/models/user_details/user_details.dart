class UserDetailResponse {
  UserDetail? userDetail;
  UserBillingAddress? userBillingAddress;
  UserShippingAddress? userShippingAddress;
  bool? status;

  UserDetailResponse(
      {this.userDetail,
        this.userBillingAddress,
        this.userShippingAddress,
        this.status});

  UserDetailResponse.fromJson(Map<String, dynamic> json) {
    userDetail = json['user_detail'] != null
        ? UserDetail.fromJson(json['user_detail'])
        : null;
    userBillingAddress = json['user_billing_address'] != null
        ? UserBillingAddress.fromJson(json['user_billing_address'])
        : null;
    userShippingAddress = json['user_shipping_address'] != null
        ? UserShippingAddress.fromJson(json['user_shipping_address'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userDetail != null) {
      data['user_detail'] = userDetail!.toJson();
    }
    if (userBillingAddress != null) {
      data['user_billing_address'] = userBillingAddress!.toJson();
    }
    if (userShippingAddress != null) {
      data['user_shipping_address'] = userShippingAddress!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class UserDetail {
  String? userId;
  String? userName;
  String? userLogin;
  String? userNiceName;
  String? userEmail;
  String? displayName;

  UserDetail(
      {this.userId,
        this.userName,
        this.userLogin,
        this.userNiceName,
        this.userEmail,
        this.displayName});

  UserDetail.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userLogin = json['user_login'];
    userNiceName = json['user_nicename'];
    userEmail = json['user_email'];
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_login'] = userLogin;
    data['user_nicename'] = userNiceName;
    data['user_email'] = userEmail;
    data['display_name'] = displayName;
    return data;
  }
}

class UserBillingAddress {
  String? billingFirstName;
  String? billingLastName;
  String? billingEmail;
  String? billingPhone;
  String? billingCompany;
  String? billingAddress1;
  String? billingAddress2;
  String? billingCity;
  String? billingPostcode;
  String? billingState;
  String? billingCountry;

  UserBillingAddress(
      {this.billingFirstName,
        this.billingLastName,
        this.billingEmail,
        this.billingPhone,
        this.billingCompany,
        this.billingAddress1,
        this.billingAddress2,
        this.billingCity,
        this.billingPostcode,
        this.billingState,
        this.billingCountry});

  UserBillingAddress.fromJson(Map<String, dynamic> json) {
    billingFirstName = json['billing_first_name'];
    billingLastName = json['billing_last_name'];
    billingEmail = json['billing_email'];
    billingPhone = json['billing_phone'];
    billingCompany = json['billing_company'];
    billingAddress1 = json['billing_address_1'];
    billingAddress2 = json['billing_address_2'];
    billingCity = json['billing_city'];
    billingPostcode = json['billing_postcode'];
    billingState = json['billing_state'];
    billingCountry = json['billing_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['billing_first_name'] = billingFirstName;
    data['billing_last_name'] = billingLastName;
    data['billing_email'] = billingEmail;
    data['billing_phone'] = billingPhone;
    data['billing_company'] = billingCompany;
    data['billing_address_1'] = billingAddress1;
    data['billing_address_2'] = billingAddress2;
    data['billing_city'] = billingCity;
    data['billing_postcode'] = billingPostcode;
    data['billing_state'] = billingState;
    data['billing_country'] = billingCountry;
    return data;
  }
}

class UserShippingAddress {
  String? shippingFirstName;
  String? shippingLastName;
  String? shippingEmail;
  String? shippingPhone;
  String? shippingCompany;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingCity;
  String? shippingPostcode;
  String? shippingState;
  String? shippingCountry;

  UserShippingAddress(
      {this.shippingFirstName,
        this.shippingLastName,
        this.shippingEmail,
        this.shippingPhone,
        this.shippingCompany,
        this.shippingAddress1,
        this.shippingAddress2,
        this.shippingCity,
        this.shippingPostcode,
        this.shippingState,
        this.shippingCountry});

  UserShippingAddress.fromJson(Map<String, dynamic> json) {
    shippingFirstName = json['shipping_first_name'];
    shippingLastName = json['shipping_last_name'];
    shippingEmail = json['shipping_email'];
    shippingPhone = json['shipping_phone'];
    shippingCompany = json['shipping_company'];
    shippingAddress1 = json['shipping_address_1'];
    shippingAddress2 = json['shipping_address_2'];
    shippingCity = json['shipping_city'];
    shippingPostcode = json['shipping_postcode'];
    shippingState = json['shipping_state'];
    shippingCountry = json['shipping_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shipping_first_name'] = shippingFirstName;
    data['shipping_last_name'] = shippingLastName;
    data['shipping_email'] = shippingEmail;
    data['shipping_phone'] = shippingPhone;
    data['shipping_company'] = shippingCompany;
    data['shipping_address_1'] = shippingAddress1;
    data['shipping_address_2'] = shippingAddress2;
    data['shipping_city'] = shippingCity;
    data['shipping_postcode'] = shippingPostcode;
    data['shipping_state'] = shippingState;
    data['shipping_country'] = shippingCountry;
    return data;
  }
}
