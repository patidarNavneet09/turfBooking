import 'package:flutter/material.dart';
import 'package:truckmanagement/Screens/editprofile.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 110,
                decoration: BoxDecoration(
                  // color: MyColor.Red_color,
                  // ignore: prefer_const_constructors
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    tileMode: TileMode.mirror,
                    colors: const [
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
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/Ellipse 18.png"),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Hello James",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: MyColor.white,
                                            // overflow: TextOverflow.ellipsis,
                                            fontFamily:
                                                ColorFamily.fontsSFProDisplay,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // Text(
                                        //   "Truck ID  ",
                                        //   style: TextStyle(
                                        //     fontSize: 16,
                                        //     color: MyColor.white,
                                        //     // overflow: TextOverflow.ellipsis,
                                        //     // fontFamily: ColorFamily.fontsSFProDisplay,
                                        //     fontWeight: FontWeight.w500,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "james@gmail.com",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: MyColor.white,
                                            // overflow: TextOverflow.ellipsis,
                                            fontFamily:
                                                ColorFamily.fontsSFProDisplay,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProfileSetting()));
                                  },
                                  child: const Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: MyColor.white,
                                      // overflow: TextOverflow.ellipsis,
                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
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
                              width: MediaQuery.of(context).size.width * 0.90,
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
                                      fontFamily: ColorFamily.fontsSFProDisplay,
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
                              width: MediaQuery.of(context).size.width * 0.90,
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
                                      fontFamily: ColorFamily.fontsSFProDisplay,
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
                              width: MediaQuery.of(context).size.width * 0.90,
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
                                      fontFamily: ColorFamily.fontsSFProDisplay,
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
                              width: MediaQuery.of(context).size.width * 0.90,
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
                                      fontFamily: ColorFamily.fontsSFProDisplay,
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
                              width: MediaQuery.of(context).size.width * 0.90,
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
                                      fontFamily: ColorFamily.fontsSFProDisplay,
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
