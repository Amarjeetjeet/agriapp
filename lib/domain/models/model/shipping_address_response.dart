class ShippingAddressResponse {
  UserBillingAddress? userBillingAddress;
  bool? status;

  ShippingAddressResponse({this.userBillingAddress, this.status});

  ShippingAddressResponse.fromJson(Map<String, dynamic> json) {
    userBillingAddress = json['user_billing_address'] != null
        ? UserBillingAddress.fromJson(json['user_billing_address'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userBillingAddress != null) {
      data['user_billing_address'] = userBillingAddress!.toJson();
    }
    data['status'] = status;
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
