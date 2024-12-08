// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../helper/constants/key_constants.dart';
import '../../local/preference_util/preference_utils.dart';
import '../app_exceptions/app_exceptions.dart';

class BaseClientApi {
  static const int TIME_OUT_DURATION = 10;

  //GET
  String token = "";
  String baseUrl = "https://agripari.com/webservices/";

  Future<dynamic> get({required String api}) async {
    token = PreferenceUtils.getString(KeyConstants.GET_TOKEN_NAME);
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.get(uri, headers: {
        "Authorization": "Bearer $token",
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      debugPrint(response.body);
      return _processResponse(response);
    } on SocketException {
      return Future.error('No Internet connection 😢');
    } on TimeoutException {
      return Future.error('Server Connection Timeout 😢');
    } on UnAuthorizedException {
      return Future.error('Access denied UnAuthorized Request 👎');
    } on AccessDeniedException {
      return Future.error(
          'Access Restricted | Shield Security \nAccess from your IP address has been temporarily restricted.');
    } on FormatException {
      return Future.error('Bad response format 👎');
    } catch (e) {
      return Future.error(e);
    }
  }

  //POST
  Future<dynamic> post(String api, dynamic payloadObj) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      "Authorization": "Bearer $token",
    };
    token = PreferenceUtils.getString(KeyConstants.GET_TOKEN_NAME);
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .post(
            uri,
            body: payload,
            headers: headers,
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      debugPrint("payload : $payloadObj");
      debugPrint("uri : $uri");
      debugPrint("status code: ${response.statusCode}");
      debugPrint("token: $token");
      debugPrint("body ${response.body}");
      return _processResponse(response);
    } on SocketException {
      return Future.error('No Internet connection 😢');
    } on TimeoutException {
      return Future.error('Server Connection Timeout 😢');
    } on UnAuthorizedException {
      return Future.error('Access denied UnAuthorized Request 👎');
    } on AccessDeniedException {
      return Future.error(
          'Access Restricted | Shield Security \nAccess from your IP address has been temporarily restricted.');
    } on FormatException {
      return Future.error('Bad response format 👎');
    } catch (e) {
      return Future.error(e);
    }
  }

  //DELETE
  //OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 201:
        throw Exception(response.bodyBytes);
      case 400:
        throw BadRequestException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 401:
      case 422:
        throw BadRequestException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 500:
      case 503:
        throw AccessDeniedException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}

class OrderList {
  OrderList? orderList;
  bool? status;

  OrderList({this.orderList, this.status});

  OrderList.fromJson(Map<String, dynamic> json) {
    orderList = json['order_list'] != null
        ? new OrderList.fromJson(json['order_list'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderList != null) {
      data['order_list'] = this.orderList!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Order {
  int? orderId;
  GetDateCreated? getDateCreated;
  String? status;
  int? subtotal;
  double? discount;
  String? shippingCharge;
  String? paymentMethod;
  String? total;
  List<ProductList>? productList;
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;

  Order(
      {this.orderId,
      this.getDateCreated,
      this.status,
      this.subtotal,
      this.discount,
      this.shippingCharge,
      this.paymentMethod,
      this.total,
      this.productList,
      this.billingAddress,
      this.shippingAddress});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    getDateCreated = json['get_date_created'] != null
        ? new GetDateCreated.fromJson(json['get_date_created'])
        : null;
    status = json['status'];
    subtotal = json['subtotal'];
    discount = json['discount'];
    shippingCharge = json['shipping_charge'];
    paymentMethod = json['payment_method'];
    total = json['total'];
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    if (this.getDateCreated != null) {
      data['get_date_created'] = this.getDateCreated!.toJson();
    }
    data['status'] = this.status;
    data['subtotal'] = this.subtotal;
    data['discount'] = this.discount;
    data['shipping_charge'] = this.shippingCharge;
    data['payment_method'] = this.paymentMethod;
    data['total'] = this.total;
    if (this.productList != null) {
      data['product_list'] = this.productList!.map((v) => v.toJson()).toList();
    }
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    return data;
  }
}

class GetDateCreated {
  String? date;
  int? timezoneType;
  String? timezone;

  GetDateCreated({this.date, this.timezoneType, this.timezone});

  GetDateCreated.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timezone_type'] = this.timezoneType;
    data['timezone'] = this.timezone;
    return data;
  }
}

class ProductList {
  String? productName;
  String? productImageLink;
  int? quantity;
  String? subtotal;
  String? total;

  ProductList(
      {this.productName,
      this.productImageLink,
      this.quantity,
      this.subtotal,
      this.total});

  ProductList.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productImageLink = json['product_image_link'];
    quantity = json['quantity'];
    subtotal = json['subtotal'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_image_link'] = this.productImageLink;
    data['quantity'] = this.quantity;
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    return data;
  }
}

class BillingAddress {
  String? billingFirstName;
  String? billingLastName;
  String? billingCompany;
  String? billingAddress1;
  String? billingAddress2;
  String? billingCity;
  String? billingState;
  String? billingPostcode;
  String? billingCountry;
  String? billingEmail;
  String? billingPhone;

  BillingAddress(
      {this.billingFirstName,
      this.billingLastName,
      this.billingCompany,
      this.billingAddress1,
      this.billingAddress2,
      this.billingCity,
      this.billingState,
      this.billingPostcode,
      this.billingCountry,
      this.billingEmail,
      this.billingPhone});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    billingFirstName = json['billing_first_name'];
    billingLastName = json['billing_last_name'];
    billingCompany = json['billing_company'];
    billingAddress1 = json['billing_address_1'];
    billingAddress2 = json['billing_address_2'];
    billingCity = json['billing_city'];
    billingState = json['billing_state'];
    billingPostcode = json['billing_postcode'];
    billingCountry = json['billing_country'];
    billingEmail = json['billing_email'];
    billingPhone = json['billing_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billing_first_name'] = this.billingFirstName;
    data['billing_last_name'] = this.billingLastName;
    data['billing_company'] = this.billingCompany;
    data['billing_address_1'] = this.billingAddress1;
    data['billing_address_2'] = this.billingAddress2;
    data['billing_city'] = this.billingCity;
    data['billing_state'] = this.billingState;
    data['billing_postcode'] = this.billingPostcode;
    data['billing_country'] = this.billingCountry;
    data['billing_email'] = this.billingEmail;
    data['billing_phone'] = this.billingPhone;
    return data;
  }
}

class ShippingAddress {
  String? shippingFirstName;
  String? shippingLastName;
  String? shippingCompany;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingCity;
  String? shippingState;
  String? shippingPostcode;
  String? shippingCountry;

  ShippingAddress(
      {this.shippingFirstName,
      this.shippingLastName,
      this.shippingCompany,
      this.shippingAddress1,
      this.shippingAddress2,
      this.shippingCity,
      this.shippingState,
      this.shippingPostcode,
      this.shippingCountry});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    shippingFirstName = json['shipping_first_name'];
    shippingLastName = json['shipping_last_name'];
    shippingCompany = json['shipping_company'];
    shippingAddress1 = json['shipping_address_1'];
    shippingAddress2 = json['shipping_address_2'];
    shippingCity = json['shipping_city'];
    shippingState = json['shipping_state'];
    shippingPostcode = json['shipping_postcode'];
    shippingCountry = json['shipping_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipping_first_name'] = this.shippingFirstName;
    data['shipping_last_name'] = this.shippingLastName;
    data['shipping_company'] = this.shippingCompany;
    data['shipping_address_1'] = this.shippingAddress1;
    data['shipping_address_2'] = this.shippingAddress2;
    data['shipping_city'] = this.shippingCity;
    data['shipping_state'] = this.shippingState;
    data['shipping_postcode'] = this.shippingPostcode;
    data['shipping_country'] = this.shippingCountry;
    return data;
  }
}
