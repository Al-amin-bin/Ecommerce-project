import 'dart:convert';
import 'dart:math';

import 'package:ecommerce/Data/model/network_response.dart';
import 'package:ecommerce/Presentation/State_holders/auth_controller.dart';
import 'package:ecommerce/Presentation/UI/Screens/Auth/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../Application/app.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    Response response = await get(
      Uri.parse(url),headers: {'token':AuthController.accessToken.toString()}

    );
    print(response.statusCode.toString());
    print(response.body);
    try {
      if (response.statusCode == 200 ) {
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            body: jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        goToLogIn();
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode, body: null);
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }

  static Future<NetworkResponse> postRequest(
      String uri, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    Response response =
        await post(Uri.parse(uri), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'token': AuthController.accessToken.toString(),
    });
    print(response.statusCode.toString());
    print(response.body);
    try {
      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            body: jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          goToLogIn();
        }
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode, body: null);
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }

  static Future<void> goToLogIn() async {
    await AuthController.clear();
    Navigator.pushAndRemoveUntil(
        CraftyBay.globalKey.currentContext!,
        MaterialPageRoute(
            builder: (context) => const EmailVerificationScreen()),
        (route) => false);
  }
}
