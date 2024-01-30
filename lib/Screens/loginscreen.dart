import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/loginmodel.dart';
import 'package:truckmanagement/Screens/dashboardscreen.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/apiconstant.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/utils/mybuttons.dart';
import 'package:truckmanagement/utils/textfields.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:convert' as convert;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool texthide = true;
dynamic iconsdata;

class _LoginState extends State<Login> {
  String devicetoken = "";
  String devicetype = "";
  String devicename = "";
  @override
  void initState() {
    _getId();
    super.initState();
    iconsdata = 1;

    texthide = true;
  }

  LoginResponse loginResponse = LoginResponse();
  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    debugPrint("devicetoken>>>>>>>>>>>>$devicetoken");
    debugPrint("device_name>>>>>>>>>>$devicename");
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      devicetoken = iosDeviceInfo.identifierForVendor!;
      devicename = iosDeviceInfo.model!;
      devicetype = "ios";
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      devicetoken = androidDeviceInfo.androidId!;
      devicename = androidInfo.model!;

      devicetype = "android";

      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            color: MyColor.appbartext,
            // overflow: TextOverflow.ellipsis,
            fontFamily: ColorFamily.fontsSFProDisplay,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                elevation: 1,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  obscureText: texthide,
                  decoration: const InputDecoration().prefixIconTextField(
                      suffix: InkWell(
                        onTap: () {
                          if (texthide == true) {
                            iconsdata = 0;
                            texthide = false;
                            setState(() {});
                          } else if (texthide == false) {
                            iconsdata = 1;
                            texthide = true;
                            setState(() {});
                          }
                        },
                        child: iconsdata == 0
                            ? SizedBox(
                                width: 2,
                                height: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset("assets/images/img_eye.png"),
                                ))
                            : SizedBox(
                                width: 2,
                                height: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset("assets/images/img_eye.png"),
                                )),
                      ),
                      hintText: "Email"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                elevation: 1,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: texthide,
                  decoration: const InputDecoration().prefixIconTextField(
                      suffix: InkWell(
                        onTap: () {
                          if (texthide == true) {
                            iconsdata = 0;
                            texthide = false;
                            setState(() {});
                          } else if (texthide == false) {
                            iconsdata = 1;
                            texthide = true;
                            setState(() {});
                          }
                        },
                        child: iconsdata == 0
                            ? SizedBox(
                                width: 2,
                                height: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset("assets/images/img_eye.png"),
                                ))
                            : SizedBox(
                                width: 2,
                                height: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset("assets/images/img_eye.png"),
                                )),
                      ),
                      hintText: "Password"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                      // color: MyColor.transparent,
                      textStyle: const TextStyle(
                        color: MyColor.white,
                        fontSize: 16,
                        fontFamily: ColorFamily.fontsSFProDisplay,
                        fontWeight: FontWeight.w600,
                      ),
                      btnWidth: MediaQuery.of(context).size.width * 0.90,
                      onPressed: () {
                        String email = emailController.text;
                        String password = passwordController.text;
                        if (email.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Your Email");
                        } else if (password.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Your Password");
                        } else {
                          // print("Mobile.length >>>>>>${mobile.length}");
                          loginApi(context);
                        }
                      },
                      name: "Login"),
                ],
              ),
            )
          ]),
        ),
      ),

      // bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Future<void> loginApi(
    BuildContext context,
  ) async {
    var request = {};

    request['email'] = emailController.text;
    request['password'] = passwordController.text;
    request['fcm_token'] = "123456";
    request['device_type'] = devicetype;
    request['device_id'] = devicetoken;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(
        logLevel: LogLevel.BODY,
      ),
    ]);

    var response = await http.post(Uri.parse(ApiServer.login),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "client": ApiServer.client
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    if (jsonResponse['status'] == true) {
      loginResponse = LoginResponse.fromJson(jsonResponse);

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
          "TOKEN", loginResponse.data!.token.toString());
      if (context.mounted) {
        sharedPreferences.setBool("isLogin", true);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const DashBoardscreen(
                      pagesProviderIndex: 0,
                    )),
            (Route<dynamic> route) => false);
      }
    } else {}

    return;
  }
}
