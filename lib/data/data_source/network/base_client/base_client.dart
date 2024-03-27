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
    token = PreferenceUtils.getString(KeyConstants.GET_TOKEN_NAME);
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http.post(uri, body: payload, headers: {
        "Authorization": "Bearer $token",
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      debugPrint("status code: $response.statusCode");
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
