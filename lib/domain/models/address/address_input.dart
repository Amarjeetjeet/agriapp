class AddressInput {
  String? userId;
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

  AddressInput(
      {this.userId,
        this.shippingFirstName,
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

  AddressInput.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
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
    data['user_id'] = userId;
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
