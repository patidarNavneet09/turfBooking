import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/loginmodel.dart';
import 'package:truckmanagement/Screens/dashboard_screen.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/apiconstant.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/utils/mybuttons.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:convert' as convert;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool texthide = true;
bool texthide1 = true;
dynamic iconsdata;
dynamic iconsdata1;

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

  bool isLoading = false;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  bool loadingLogin = false;
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
              exit(0);
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
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 57,
                  child: Center(
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      controller: emailController,
                      obscureText: texthide,
                      // controller: NameController
                      //   ..text =
                      //       snapshot.data!.data!.name.toString(),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // focusColor: MyColor.Red_color,
                        // fillColor: MyColor.Red_color,
                        suffixIcon: InkWell(
                          radius: 30,
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
                              ? const SizedBox(
                                  width: 2,
                                  height: 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.visibility_off,
                                      color: MyColor.greyText,
                                    ),
                                  ))
                              : SizedBox(
                                  width: 2,
                                  height: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        "assets/images/img_eye.png"),
                                  )),
                        ),
                        // prefixIconColor: MaterialStateColor.resolveWith(
                        //     (states) =>
                        //         states.contains(MaterialState.focused)
                        //             ? MyColor.black
                        //             : Colors.grey),
                        hintText: "  Email",
                        hintStyle: const TextStyle(
                            color: Colors.black,
                            fontFamily: ColorFamily.fontsSFProDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.greyText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.greyText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 57,
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        controller: passwordController,
                        obscureText: texthide1,
                        // controller: NameController
                        //   ..text =
                        //       snapshot.data!.data!.name.toString(),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          // focusColor: MyColor.Red_color,
                          // fillColor: MyColor.Red_color,
                          suffixIcon: InkWell(
                            radius: 30,
                            onTap: () {
                              if (texthide1 == true) {
                                iconsdata1 = 0;
                                texthide1 = false;
                                setState(() {});
                              } else if (texthide1 == false) {
                                iconsdata1 = 1;
                                texthide1 = true;
                                setState(() {});
                              }
                            },
                            child: iconsdata1 == 0
                                ? const SizedBox(
                                    width: 2,
                                    height: 0,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.visibility_off,
                                        color: MyColor.greyText,
                                      ),
                                    ))
                                : SizedBox(
                                    width: 2,
                                    height: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/images/img_eye.png"),
                                    )),
                          ),
                          // prefixIconColor: MaterialStateColor.resolveWith(
                          //     (states) =>
                          //         states.contains(MaterialState.focused)
                          //             ? MyColor.black
                          //             : Colors.grey),
                          hintText: "  Password",
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColor.greyText),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColor.greyText),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                      isLoading: isLoading,
                      // color: MyColor.transparent,
                      textStyle: const TextStyle(
                        color: MyColor.white,
                        fontSize: 16,
                        fontFamily: ColorFamily.fontsSFProDisplay,
                        fontWeight: FontWeight.w600,
                      ),
                      btnWidth: MediaQuery.of(context).size.width * 0.90,
                      onPressed: () {
                        loadingLogin = true;
                        String email = emailController.text;
                        String password = passwordController.text;
                        if (email.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Your Email");
                        } else if (password.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Your Password");
                        } else {
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
    setLoading(true);
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
    loadingLogin = true;
    setLoading(false);
    if (jsonResponse['status'] == true) {
      loadingLogin = false;
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
    } else {
      Fluttertoast.showToast(msg: jsonResponse['message']);
    }

    return;
  }
}
