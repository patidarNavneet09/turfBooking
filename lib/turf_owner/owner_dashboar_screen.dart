import 'package:flutter/material.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/turf_owner/calender.dart';
import 'package:turfbooking/turf_owner/home_screen.dart';
import 'package:turfbooking/turf_owner/turfs_screen.dart';

class HomeDashBoardOwnerScr extends StatefulWidget {
  const HomeDashBoardOwnerScr({super.key});

  @override
  State<HomeDashBoardOwnerScr> createState() => _HomeDashBoardOwnerScrState();
}

class _HomeDashBoardOwnerScrState extends State<HomeDashBoardOwnerScr> {
  int pageIndex = 0;

  var pages = [
    const HomeScr(),
    const TurfsScr(),
    const TableCalender(),
    Container(),
    Container(),
  ];
  // Chatscreen(),

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildMyNavBar(context),
      body: pages[pageIndex],
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                    radius: 50,
                    customBorder: const CircleBorder(),
                    onTap: () {
                      // print(DateTime.now().timeZoneOffset.toString());
                      pageIndex = 0;
                      // print(pageIndex);
                      setState(() {});
                    },
                    child: SizedBox(
                      // color: Colors.amber,
                      height: 50,
                      width: 60,
                      child: Column(
                        children: [
                          // pageIndex == 0
                          //     ? const Icon(
                          //         Icons.pentagon_rounded,
                          //         color: MyColor.pink,
                          //       )
                          //     : const Icon(Icons.pentagon_outlined),
                          SizedBox(
                            height: pageIndex == 0 ? 23 : 23,
                            width: 25,
                            child: Image.asset("assets/images/Home.png"),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            // pageIndex == 0 ? "Explore" : "",
                            pageIndex == 0 ? "Home" : "",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    radius: 50,
                    customBorder: const CircleBorder(),
                    onTap: () {
                      // List<String> data = [
                      //   "/data/user/0/com.example.property_app/cache/file_picker/1000002094.mp4",
                      //   "/data/user/0/com.example.property_app/cache/file_picker/1000002094.mp4",
                      //   "/data/user/0/com.example.property_app/cache/file_picker/1000002094.mp4"
                      // ];
                      // uploadFiles(data);

                      pageIndex = 1;
                      // print(pageIndex);
                      setState(() {});
                    },
                    child: SizedBox(
                      // color: Colors.amber,
                      height: 50,
                      width: 60,
                      child: Column(
                        children: [
                          // pageIndex == 1
                          //     ? Icon(Icons.favorite_sharp,
                          //         color: pageIndex == 1
                          //             ? MyColor.pink
                          //             : Colors.black)
                          //     : const Icon(
                          //         Icons.favorite_outline_sharp,
                          //       ),
                          SizedBox(
                            height: 22,
                            width: 25,
                            child: Image.asset("assets/images/Turf.png"),
                            // child: SvgPicture.asset(
                            //   pageIndex == 1
                            //       ? "assets/images/ic_favarate_icon.svg"
                            //       : "assets/images/ic_favarate_icon.svg",
                            //   colorFilter: pageIndex == 1
                            //       ? const ColorFilter.mode(
                            //           MyColor.pink, BlendMode.srcIn)
                            //       : const ColorFilter.mode(
                            //           Colors.black, BlendMode.srcIn),
                            // ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            pageIndex == 1 ? "Turfs" : "",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    radius: 50,
                    customBorder: const CircleBorder(),
                    onTap: () {
                      pageIndex = 2;
                      // print(pageIndex);
                      setState(() {});
                    },
                    child: SizedBox(
                      // color: Colors.amber,
                      height: 50,
                      width: 60,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 22,
                            width: 25,
                            child: Image.asset("assets/images/calender.png"),
                            // child: SvgPicture.asset(
                            //   "assets/images/ic_stay_icon.svg",
                            //   colorFilter: pageIndex == 2
                            //       ? const ColorFilter.mode(
                            //           MyColor.pink, BlendMode.srcIn)
                            //       : const ColorFilter.mode(
                            //           Colors.black, BlendMode.srcIn),
                            // ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            pageIndex == 2 ? "Calender" : "",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    radius: 50,
                    customBorder: const CircleBorder(),
                    onTap: () {
                      pageIndex = 3;
                      // print(pageIndex);
                      setState(() {});
                    },
                    child: SizedBox(
                      // color: Colors.amber,
                      height: 50,
                      width: 60,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 25,
                            child: Image.asset(
                              "assets/images/notificationicon.png",
                            ),
                            // child: SvgPicture.asset(
                            //   "assets/images/ic_stay_icon.svg",
                            //   colorFilter: pageIndex == 2
                            //       ? const ColorFilter.mode(
                            //           MyColor.pink, BlendMode.srcIn)
                            //       : const ColorFilter.mode(
                            //           Colors.black, BlendMode.srcIn),
                            // ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            pageIndex == 3 ? "Notification" : "",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Container(
                  //   height: 40,
                  //   width: 60,
                  //   child: Column(
                  //     children: [
                  //       Icon(Icons.person_2_outlined,
                  //           color:
                  //               pageIndex == 3 ? MyColor.pink : Colors.black),
                  //       pageIndex == 3
                  //           ? Text(
                  //               "Profile",
                  //               style: TextStyle(
                  //                   fontSize: 10,
                  //                   fontWeight: FontWeight.w500,
                  //                   color: pageIndex == 3
                  //                       ? MyColor.pink
                  //                       : Colors.black),
                  //             )
                  //           : Text("")
                  //     ],
                  //   ),
                  // )
                  InkWell(
                    radius: 50,
                    customBorder: const CircleBorder(),
                    onTap: () {
                      pageIndex = 4;
                      // print(pageIndex);
                      setState(() {});
                    },
                    child: SizedBox(
                      // color: Colors.amber,
                      height: 50,
                      width: 60,
                      child: Column(
                        children: [
                          SizedBox(
                              height: 24,
                              width: 25,
                              child: Image.asset(
                                "assets/images/profile.png",
                              )),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            pageIndex == 4 ? "Profile" : "",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
