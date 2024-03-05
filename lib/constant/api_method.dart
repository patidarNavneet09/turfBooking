import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import 'package:truckmanagement/constant/api_constant.dart';

class ApiCall {
  final Function? trueCase;
  Function(bool)? trueCasebool;
  final Function? falseCase;
  final String baseUrl;
  final Map<dynamic, dynamic> params;
  final bool isxClient;
  final Function(Map<String, dynamic>) fromJson;
  final Function(bool) setLoading;

  ApiCall({
    this.trueCase,
    this.trueCasebool,
    this.falseCase,
    required this.baseUrl,
    required this.params,
    required this.isxClient,
    required this.fromJson,
    required this.setLoading,
  });

  Future<void> customApiCall<Class>() async {
    String authenticate;
    String userId;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authenticate = prefs.getString('token').toString();
    userId = prefs.getString('user_id').toString();
    setLoading(true);
    var request = params;
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.post(
      Uri.parse(baseUrl),
      body: convert.jsonEncode(request),
      headers: isxClient == true
          ? {
              "content-type": "application/json",
              "accept": "application/json",
              "client": ApiServer.client,
            }
          : {
              "content-type": "application/json",
              "accept": "application/json",
              "X-AUTHTOKEN": authenticate,
              "X-USERID": userId,
            },
    );
    setLoading(false);
    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    if (jsonResponse['status'] == true) {
      Class parsedResponse = fromJson(jsonResponse);
      trueCase!(parsedResponse);
      trueCasebool!(true);
    } else {
      falseCase!();
    }
  }
}
