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

  AddressInput({
    this.userId,
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
    this.shippingCountry,
  });

  AddressInput.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    shippingFirstName = json['billing_first_name'];
    shippingLastName = json['billing_last_name'];
    shippingEmail = json['billing_email'];
    shippingPhone = json['billing_phone'];
    shippingCompany = json['billing_company'];
    shippingAddress1 = json['billing_address_1'];
    shippingAddress2 = json['billing_address_2'];
    shippingCity = json['billing_city'];
    shippingPostcode = json['billing_postcode'];
    shippingState = json['billing_state'];
    shippingCountry = json['billing_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['billing_first_name'] = shippingFirstName;
    data['billing_last_name'] = shippingLastName;
    data['billing_email'] = shippingEmail;
    data['billing_phone'] = shippingPhone;
    data['billing_company'] = "NOT Available";
    data['billing_address_1'] = shippingAddress1;
    data['billing_address_2'] = shippingAddress2;
    data['billing_city'] = shippingCity;
    data['billing_postcode'] = shippingPostcode;
    data['billing_state'] = shippingState;
    data['billing_country'] = "IN";
    return data;
  }
}
