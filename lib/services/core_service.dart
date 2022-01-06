import 'dart:convert';
import 'dart:io';

import 'package:demoproject/utils/global.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CoreService {
  CoreService._();

  factory CoreService.getInstance() => _instance;
  static final CoreService _instance = CoreService._();

  Future apiService(
      {header,
      required body,
      params,
      required METHOD method,
      required baseURL,
      required endpoint,
      required returnType}) async {
    var param = params;

    var uri =
        Uri.https(Uri.encodeFull(baseURL), Uri.encodeFull(endpoint), param);
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    if (header != null) {
      requestHeaders.addAll(header);
    }
    if (body != null) {
      body = json.encode(body);
    }
    debugPrint("Header :  $requestHeaders");
    debugPrint("Body :  $body");
    debugPrint("Params :  $params");
    debugPrint("URL :  $uri");
    debugPrint("Method :  $method");

    switch (method) {
      case METHOD.GET:
        {
          try {
            final response = await http.get(uri, headers: requestHeaders);

            return _returnResponse(response, returnType);
          } on SocketException {
            authController.showNoInternetToast("Oops! No Internet.",
                'It seems you have lost connection with internet. Check your connection setting and try again.');
          } on Exception catch (e) {
            debugPrint("Exception block : $e");

            authController.showNoInternetToast("Something Went wrong",
                'Try again or revisit the screen later.');
          }
        }
        break;

      default:
        {
          try {
            final response =
                await http.post(uri, headers: requestHeaders, body: body);
            var responseJson = _returnResponse(response, returnType);
            return responseJson;
          } on SocketException {
            authController.showNoInternetToast("Oops! No Internet.",
                'It seems you have lost connection with internet. Check your connection setting and try again.');
          } catch (error) {
            authController.showNoInternetToast(
                "Something went wrong", error.toString());
          }
        }
        break;
    }
  }

  dynamic _returnResponse(http.Response response, returnType) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        debugPrint("Response($returnType) :  $responseJson");
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body);
        debugPrint("Response($returnType) :  $responseJson");
        return responseJson;

      case 401:
    }
  }
}

enum METHOD { GET }
