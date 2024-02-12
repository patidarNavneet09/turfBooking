import 'dart:async';

import 'package:flutter/material.dart';
import 'package:truckmanagement/Screens/home_screen.dart';
import 'package:truckmanagement/Screens/settingscreen.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:location/location.dart';

class DashBoardscreen extends StatefulWidget {
  final int pagesProviderIndex;
  const DashBoardscreen({super.key, required this.pagesProviderIndex});

  @override
  State<DashBoardscreen> createState() => _DashBoardscreenState();
}

LocationData? currentLocation;

class _DashBoardscreenState extends State<DashBoardscreen> {
  int pagesIndex = 0;

  var pagesProvider = [const Homescreen(), const Setting()];
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
      body: pagesProvider[pagesIndex],
    );
  }

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
                      child: Image.asset("assets/images/Home.png")),
                  Text(
                    "Home",
                    style:  TextStyle(
                      fontSize: 10,
                      color:  pagesIndex == 0 ?  MyColor.white :Colors.grey,
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
                      child: Image.asset("assets/images/setting.png")),
                  Text(
                   "Settings" ,
                    style:  TextStyle(
                      fontSize: 10,
                      color: pagesIndex == 1 ?  MyColor.white :Colors.grey,
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
