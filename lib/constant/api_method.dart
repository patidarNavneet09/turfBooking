import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import 'package:truckmanagement/constant/api_constant.dart';

class ApiCall {
  final Function trueCase;
  Function(bool)? trueCasebool;
  final Function? falseCase;
  final String baseUrl;
  final Map<dynamic, dynamic>? params;
  final bool isxClient;
  final Function(Map<String, dynamic>)? fromJson;
  final Function(bool) setLoading;

  ApiCall({
    required this.trueCase,
    this.trueCasebool,
    this.falseCase,
    required this.baseUrl,
    this.params,
    required this.isxClient,
    this.fromJson,
    required this.setLoading,
  });

  Future<void> clientPostApiCall<Class>() async {
    String authenticate;
    String userId;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authenticate = prefs.getString('token').toString();
    userId = prefs.getString('user_id').toString();
    debugPrint(authenticate);
    debugPrint(userId);
    setLoading(true);
    var request = params;
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http
        .post(Uri.parse(baseUrl), body: convert.jsonEncode(request), headers: {
      "content-type": "application/json",
      "accept": "application/json",
      "client": ApiServer.client,
    });
    setLoading(false);
    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    if (jsonResponse['status'] == true) {
      Class parsedResponse = fromJson!(jsonResponse);
      trueCase(parsedResponse);
      trueCasebool!(true);
    } else {
      falseCase!();
    }
  }

  Future<void> customApiCall<Class>() async {
    String tokenauthenticate;
    String userId;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenauthenticate = prefs.getString('TOKEN').toString();
    userId = prefs.getString('user_id').toString();
    setLoading(true);
    debugPrint(userId);
    // var request = params;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.get(
      Uri.parse(baseUrl),
      // body: convert.jsonEncode(request),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "Authorization": "Bearer $tokenauthenticate"
      },
    );
    setLoading(false);
    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    if (jsonResponse['status'] == true) {
      Class parsedResponse = fromJson!(jsonResponse);
      trueCase(parsedResponse);
      trueCasebool!(false);
    } else {
      falseCase!();
    }
  }
}
