import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truckmanagement/Screens/notification.dart';

import 'package:truckmanagement/Screens/home_screen.dart';
import 'package:truckmanagement/Screens/setting_screen.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:location/location.dart';
import 'package:truckmanagement/constant/string_file.dart';

class DashBoardscreen extends StatefulWidget {
  final int pagesProviderIndex;
  const DashBoardscreen({super.key, required this.pagesProviderIndex});

  @override
  State<DashBoardscreen> createState() => _DashBoardscreenState();
}

LocationData? currentLocation;

class _DashBoardscreenState extends State<DashBoardscreen> {
  int pagesIndex = 0;
//  pagesScreen view all screen by index
  var pagesScreen = [
    const Homescreen(),
    const Setting(),
    const NotificationScreen()
  ];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set up a periodic timer to call the API every 5 minutes
    if (currentLocation == null) {
      getCurrentLocation();
    }
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) {
      getCurrentLocation();
    });
  }

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
  }

  @override
  void dispose() {
    // Dispose of the timer when the widget is removed from the widget tree
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildMyNavBar(context),
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            //ios..
            statusBarBrightness: Brightness.light,
            //android..
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: MyColor.white,
          ),
        ),
      ),
      body: pagesScreen[pagesIndex],
    );
  }

// Bottom navigation bar in dashboard screen
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.mirror,
          colors: [
            MyColor.button1,
            MyColor.button,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            radius: 30,
            onTap: () {
              pagesIndex = 0;
              setState(() {});
            },
            child: SizedBox(
              // color: Colors.amber,
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 25,
                      width: 30,
                      child: Image.asset("assets/images/Home.png",
                          color:
                              pagesIndex == 0 ? MyColor.white : Colors.grey)),
                  Text(
                    MyString.home.tr(),
                    style: TextStyle(
                      fontSize: 10,
                      color: pagesIndex == 0 ? MyColor.white : Colors.grey,
                      // overflow: TextOverflow.ellipsis,
                      fontFamily: ColorFamily.fontsSFProDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            radius: 30,
            onTap: () {
              pagesIndex = 1;
              setState(() {});
            },
            child: SizedBox(
              // color: Colors.amber,
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 25,
                      width: 30,
                      child: Image.asset("assets/images/setting.png",
                          color:
                              pagesIndex == 1 ? MyColor.white : Colors.grey)),
                  Text(
                    MyString.settings.tr(),
                    style: TextStyle(
                      fontSize: 10,
                      color: pagesIndex == 1 ? MyColor.white : Colors.grey,
                      // overflow: TextOverflow.ellipsis,
                      // fontFamily: ColorFamily.fontsSFProDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            radius: 30,
            onTap: () {
              pagesIndex = 2;
              setState(() {});
            },
            child: SizedBox(
              // color: Colors.amber,
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 25,
                      width: 30,
                      child: Image.asset("assets/images/notification.png",
                          height: 20,
                          width: 20,
                          color:
                              pagesIndex == 2 ? MyColor.white : Colors.grey)),
                  Text(
                    MyString.notification.tr(),
                    style: TextStyle(
                      fontSize: 10,
                      color: pagesIndex == 2 ? MyColor.white : Colors.grey,
                      // overflow: TextOverflow.ellipsis,
                      // fontFamily: ColorFamily.fontsSFProDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
