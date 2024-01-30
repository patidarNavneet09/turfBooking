import 'package:flutter/material.dart';
import 'package:truckmanagement/Screens/homescreen.dart';
import 'package:truckmanagement/Screens/settingscreen.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';

class DashBoardscreen extends StatefulWidget {
  final int pagesProviderIndex;
  const DashBoardscreen({super.key, required this.pagesProviderIndex});

  @override
  State<DashBoardscreen> createState() => _DashBoardscreenState();
}

class _DashBoardscreenState extends State<DashBoardscreen> {
  int pagesIndex = 0;

  var pagesProvider = [const Homescreen(), const Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildMyNavBar(context),
      body: pagesProvider[pagesIndex],
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            radius: 30,
            onTap: () {
              pagesIndex = 0;

              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/images/Home.png")),
                SizedBox(
                  width: 30,
                  child: Text(
                    pagesIndex == 0 ? "Home" : "",
                    style: const TextStyle(
                      fontSize: 10,
                      color: MyColor.white,
                      // overflow: TextOverflow.ellipsis,
                      fontFamily: ColorFamily.fontsSFProDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            radius: 30,
            onTap: () {
              pagesIndex = 1;

              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/images/setting.png")),
                SizedBox(
                  width: 40,
                  child: Text(
                    pagesIndex == 1 ? "Settings" : "",
                    style: const TextStyle(
                      fontSize: 10,
                      color: MyColor.white,
                      // overflow: TextOverflow.ellipsis,
                      // fontFamily: ColorFamily.fontsSFProDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
