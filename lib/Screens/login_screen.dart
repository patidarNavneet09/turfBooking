import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/login_model.dart';
import 'package:truckmanagement/Screens/dashboard_screen.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/api_constant.dart';
import 'package:truckmanagement/constant/api_method.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/constant/string_file.dart';
import 'package:truckmanagement/constant/utility.dart';
import 'package:truckmanagement/main.dart';
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

  /// init method to call with screen

  @override
  void initState() {
    pushFCMtoken();
    _getId();
    super.initState();
    iconsdata = 1;

    texthide = true;
  }

  /// isLoading bool and its method to set value to work

  bool isLoading = false;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  /// loadingLogin bool here

  bool loadingLogin = false;

  ///  loginResponse to call its model data LoginResponse

  LoginResponse loginResponse = LoginResponse();

  /// pushFCMtoken method to take FCM toekn in "fcmtoken" variable

  void pushFCMtoken() async {
    try {
      // Get the FCM token
      String? token = await messaging.getToken();
      fcmtoken = token.toString();
      // Store the FCM token in shared preferences
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("fcmtoken", fcmtoken.toString());
      debugPrint("FCM Token:>>>>>>>>>>>>>>> $fcmtoken");
    } catch (e) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      debugPrint("Error getting FCM token: $e");
      var check = preferences.getString("fcmtoken");
      if (check == null) {
        pushFCMtoken();

        debugPrint("Error getting FCM token>>>>>>>>>>>>.......check: $check");
      }
    }
  }

  /// _getId method to find mobile data like - devicetype and devide ID

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      devicetoken = iosDeviceInfo.identifierForVendor!;
      devicetype = "ios";

      return iosDeviceInfo.identifierForVendor;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      devicetoken = androidDeviceInfo.device;
      devicetype = "android";

      return androidDeviceInfo.device;
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
        title: Text(
          MyString.login.tr(),
          style: const TextStyle(
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
            const SizedBox(
              height: 25,
            ),
            Text(
              MyString.sENOTRACK.tr(),
              style: const TextStyle(
                  fontSize: 28,
                  color: Color(0xFF075693),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 57,
              child: Center(
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  controller: emailController,
                  // obscureText: texthide,
                  // controller: NameController
                  //   ..text =
                  //       snapshot.data!.data!.name.toString(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    // focusColor: MyColor.Red_color,
                    // fillColor: MyColor.Red_color,
                    // suffixIcon: InkWell(
                    //   radius: 30,
                    //   onTap: () {
                    //     if (texthide == true) {
                    //       iconsdata = 0;
                    //       texthide = false;
                    //       setState(() {});
                    //     } else if (texthide == false) {
                    //       iconsdata = 1;
                    //       texthide = true;
                    //       setState(() {});
                    //     }
                    //   },
                    //   // child: iconsdata == 0
                    // ? const SizedBox(
                    //     width: 2,
                    //     height: 0,
                    //     child: Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: Icon(
                    //         Icons.visibility_off,
                    //         color: MyColor.greyText,
                    //       ),
                    //     ))
                    //       child: SizedBox(
                    //           width: 2,
                    //           height: 0,
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Image.asset(
                    //                 "assets/images/img_eye.png"),
                    //           )),
                    // ),
                    // prefixIconColor: MaterialStateColor.resolveWith(
                    //     (states) =>
                    //         states.contains(MaterialState.focused)
                    //             ? MyColor.black
                    //             : Colors.grey),
                    hintText: MyString.email.tr(),
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
            ),
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
                          hintText: MyString.password.tr(),
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
                      onPressed: () async {
                        loadingLogin = true;
                        String email = emailController.text;
                        String password = passwordController.text;
                        if (email.isEmpty) {
                          Fluttertoast.showToast(
                              msg: MyString.pleaseEnterYourEmail.tr());
                        } else if (password.isEmpty) {
                          Fluttertoast.showToast(
                              msg: MyString.pleaseEnterYourPassword.tr());
                        } else {
                          // loginApi(context);

                          login();
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

  /// loginApi  method to post data to database to login
  login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    ApiCall(
      baseUrl: ApiServer.login,
      falseCase: () {
        debugPrint("failled");
      },
      fromJson: LoginResponse.fromJson,
      setLoading: (booldata) {
        Utility.progressloadingDialog(context, booldata);
      },
      params: {
        "email": emailController.text,
        'password': passwordController.text,
        'fcm_token': sharedPreferences.getString("fcmtoken").toString(),
        'device_type': devicetype,
        'device_id': devicetoken,
      },
      isxClient: true,
      trueCase: (loginResponse) {
        sharedPreferences.setString(
            "TOKEN", loginResponse.data!.token.toString());
      },
      trueCasebool: (booldata) {
        if (booldata && context.mounted) {
          sharedPreferences.setBool("isLogin", true);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const DashBoardscreen(
                        pagesProviderIndex: 0,
                      )),
              (Route<dynamic> route) => false);
        }
      },
    ).clientPostApiCall();
  }

/////
  Future<void> loginApi(
    BuildContext context,
  ) async {
    var request = {};
    setLoading(true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request['email'] = emailController.text;
    request['password'] = passwordController.text;
    request['fcm_token'] = sharedPreferences.getString("fcmtoken").toString();
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
