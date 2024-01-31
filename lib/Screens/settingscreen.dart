import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Screens/editprofile.dart';
import 'package:truckmanagement/Screens/homescreen.dart';
import 'package:truckmanagement/Screens/loginscreen.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/utils/mybuttons.dart';
import 'dart:convert' as convert;
import '../constant/apiconstant.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var Screen = MediaQuery.of(context);
    return MediaQuery(
      data: Screen,
      child: Scaffold(
        body: loading1 == true
            ? Center(
                child: Image.asset("assets/images/gif_loader.gif"),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // height: Screen.height * 0.12,
                        decoration: BoxDecoration(
                          // color: MyColor.Red_color,
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.mirror,
                            colors: [
                              MyColor.button1,
                              MyColor.button,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25, bottom: 25),
                              child: Container(
                                color: Colors.transparent,
                                width: Screen.size.width * 0.942,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: Screen.size.width * 0.02,
                                    ),
                                    SizedBox(
                                      width: Screen.size.width *
                                          0.17, // Adjust width as needed
                                      height: Screen.size.height *
                                          0.08, // Adjust height as needed
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: profilegetResponse
                                              .data!.image
                                              .toString(),
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: CircularProgressIndicator(
                                              color: MyColor.button,
                                              value: downloadProgress.progress,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Screen.size.width * 0.02,
                                    ),
                                    SizedBox(
                                      width: Screen.size.width * 0.50,
                                      // color: Colors.red,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "${profilegetResponse.data!.firstName.toString()} ${profilegetResponse.data!.lastName.toString()}",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: MyColor.white,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  profilegetResponse.data!.email
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: MyColor.white,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: Screen.size.width * 0.20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ProfileSetting()));
                                            },
                                            child: const Expanded(
                                              child: Text(
                                                "Edit Profile",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.white,
                                                  // overflow: TextOverflow.ellipsis,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: Screen.size.width * 0.02,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Card(
                                surfaceTintColor: Colors.white,
                                elevation: 1,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 55,
                                      width: Screen.size.width * 0.90,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Image.asset(
                                            "assets/images/triplocation.png",
                                            height: 20,
                                            width: 13,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "My Trip",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: MyColor.listviewtext,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Card(
                                surfaceTintColor: Colors.white,
                                elevation: 1,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 55,
                                      width: Screen.size.width * 0.90,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Image.asset(
                                            "assets/images/helpcenter.png",
                                            height: 20,
                                            width: 13,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Help Centre",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: MyColor.listviewtext,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Card(
                                surfaceTintColor: Colors.white,
                                elevation: 1,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 55,
                                      width: Screen.size.width * 0.90,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Image.asset(
                                            "assets/images/termcondition.png",
                                            height: 20,
                                            width: 13,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Terms & Conditions",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: MyColor.listviewtext,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Card(
                                surfaceTintColor: Colors.white,
                                elevation: 1,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 55,
                                      width: Screen.size.width * 0.90,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Image.asset(
                                            "assets/images/privacypolicy.png",
                                            height: 20,
                                            width: 13,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Privacy Policy",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: MyColor.listviewtext,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Center(
                                        child: Text(
                                          "Are you sure, you want to logout ?",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: MyColor.button,
                                            // overflow: TextOverflow.ellipsis,
                                            fontFamily:
                                                ColorFamily.fontsSFProDisplay,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 15,
                                                  top: 5),
                                              child: AppButton(
                                                padding:
                                                    const EdgeInsets.all(0.1),
                                                btnHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.05,
                                                btnWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.25,
                                                name: 'Yes',
                                                onPressed: () {
                                                  logout(context);
                                                },
                                              ),
                                            ),
                                            // Container(
                                            //   height: MediaQuery.of(context)
                                            //           .size
                                            //           .height *
                                            //       0.06,
                                            //   width: 1.5,
                                            //   color: Colors.blueGrey,
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 15,
                                                  top: 5),
                                              child: AppButton(
                                                padding:
                                                    const EdgeInsets.all(0.1),
                                                btnHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.05,
                                                btnWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.25,
                                                name: 'No',
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Card(
                                  surfaceTintColor: Colors.white,
                                  elevation: 1,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 55,
                                        width: Screen.size.width * 0.90,
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Image.asset(
                                              "assets/images/logout.png",
                                              height: 20,
                                              width: 13,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            const Text(
                                              "Logout",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: MyColor.listviewtext,
                                                // overflow: TextOverflow.ellipsis,
                                                fontFamily: ColorFamily
                                                    .fontsSFProDisplay,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> logout(
    BuildContext context,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    HttpWithMiddleware http = HttpWithMiddleware.build(
      middlewares: [
        HttpLogger(logLevel: LogLevel.BODY),
      ],
    );

    var response = await http.post(Uri.parse(ApiServer.logout), headers: {
      "content-type": "application/json",
      "accept": "application/json",

      "Authorization":
          "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
      // "USERID": sharedPreferences.getString("User_Id").toString(),
    });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    loading1 = true;
    if (jsonResponse['status'] == true) {
      loading1 = false;
      sharedPreferences.clear();
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Login()),
            (Route<dynamic> route) => false);
      }

      setState(() {});
    } else {
      setState(() {});
    }
  }
}
