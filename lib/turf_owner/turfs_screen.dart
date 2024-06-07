import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:flutter/cupertino.dart';

class TurfsScr extends StatefulWidget {
  const TurfsScr({super.key});

  @override
  State<TurfsScr> createState() => _TurfsScrState();
}

class _TurfsScrState extends State<TurfsScr> {
  // active toggle bool
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leadingWidth: screen.size.width,
        toolbarHeight: 110,
        leading: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screen.size.width * 0.04,
                ),
                Container(
                  margin: const EdgeInsets.all(2),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: MyColor.white),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ClipOval(
                      child: Image.asset("assets/images/Demopic.png"),
                      // child: CachedNetworkImage(
                      //   imageUrl: "",
                      //   progressIndicatorBuilder:
                      //       (context, url, downloadProgress) => Padding(
                      //     padding: const EdgeInsets.all(20.0),
                      //     child: SizedBox(
                      //       width: screen.size.width * 0.08,
                      //       child: CircularProgressIndicator(
                      //           color: MyColor.button,
                      //           value: downloadProgress.progress),
                      //     ),
                      //   ),
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.error),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screen.size.width * 0.02,
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi User',
                        style: TextStyle(
                          fontSize: 19,
                          color: MyColor.black,
                          fontFamily: ColorFamily.fontsPopinsDisplay,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const Icon(
                          //   Icons.location_on_outlined,
                          //   size: 15,
                          // ),
                          Expanded(
                            child: Text(
                              MyString.welcome.tr(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: MyColor.black,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      // InkWell(
                      //   radius: 20,
                      //   onTap: () {
                      //     debugPrint("navneet");
                      //   },
                      //   child: SizedBox(
                      //     width: 110,
                      //     height: 12,
                      //     child: Center(
                      //       child: Text(
                      //         MyString.changelocation.tr(),
                      //         style: const TextStyle(
                      //           fontSize: 10,
                      //           color: MyColor.green,
                      //           fontFamily: ColorFamily.fontsPopinsDisplay,
                      //           fontWeight: FontWeight.w300,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // InkWell(
                //   // onTap: () => scaffoldKey.currentState!.openEndDrawer(),
                //   child: Container(
                //     alignment: Alignment.centerRight,
                //     width: screen.size.width * 0.30,
                //     height: screen.size.height * 0.14,
                //     // color: Colors.amber,
                //     child: Image.asset(
                //       "assets/images/greenicons.png",
                //       fit: BoxFit.contain,
                //     ),
                //   ),
                // )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    MyString.yourTurfs.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    MyString.addTurf.tr(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Card(
                      elevation: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: screen.size.width * 0.90,
                        // height: 190,
                        child: Column(
                          children: [
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: MyColor.green,
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   width: screen.size.width * 0.92,
                            //   // height: 90,
                            //   child: const Padding(
                            //     padding: EdgeInsets.only(top: 8, bottom: 8),
                            //     child: Column(
                            //       children: [
                            //         Text(
                            //           "Wednesday 20 April 2023",
                            //           style: TextStyle(
                            //             fontSize: 15,
                            //             color: MyColor.white,
                            //             fontFamily:
                            //                 ColorFamily.fontsPopinsDisplay,
                            //             overflow: TextOverflow.ellipsis,
                            //             fontWeight: FontWeight.w600,
                            //           ),
                            //         ),
                            //         Text(
                            //           "1 Slot 11:00 am - 12:00 pm",
                            //           style: TextStyle(
                            //             fontSize: 12,
                            //             color: MyColor.white,
                            //             fontFamily:
                            //                 ColorFamily.fontsPopinsDisplay,
                            //             overflow: TextOverflow.ellipsis,
                            //             fontWeight: FontWeight.w400,
                            //           ),
                            //         ),
                            //         Text(
                            //           "1 Slot 11:00 am - 12:00 pm",
                            //           style: TextStyle(
                            //             fontSize: 12,
                            //             color: MyColor.white,
                            //             fontFamily:
                            //                 ColorFamily.fontsPopinsDisplay,
                            //             overflow: TextOverflow.ellipsis,
                            //             fontWeight: FontWeight.w400,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(2),
                                        height: 62,
                                        width: 62,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 4, color: MyColor.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: ClipOval(
                                            child: Image.asset(
                                                "assets/images/Ellipse 1.png"),
                                            // child: CachedNetworkImage(
                                            //   imageUrl: "",
                                            //   progressIndicatorBuilder:
                                            //       (context, url, downloadProgress) => Padding(
                                            //     padding: const EdgeInsets.all(20.0),
                                            //     child: SizedBox(
                                            //       width: screen.size.width * 0.08,
                                            //       child: CircularProgressIndicator(
                                            //           color: MyColor.button,
                                            //           value: downloadProgress.progress),
                                            //     ),
                                            //   ),
                                            //   errorWidget: (context, url, error) =>
                                            //       const Icon(Icons.error),
                                            //   fit: BoxFit.cover,
                                            // ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Sports Astro Turf',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: MyColor.black,
                                                fontFamily: ColorFamily
                                                    .fontsPopinsDisplay,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            // Image.asset(
                                            //   "assets/images/call_icon.png",
                                            //   width: 20,
                                            // )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'St. Francis Xavier High School Ground, Dias And Pereira Nagar, Naigaon West, Mumbai, Maharashtra',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: MyColor.black,
                                            fontFamily:
                                                ColorFamily.fontsPopinsDisplay,
                                            // overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            MyString.active.tr(),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: MyColor.black,
                                              fontFamily: ColorFamily
                                                  .fontsPopinsDisplay,
                                              // overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              child: Transform.scale(
                                                scale: 0.5,
                                                child: CupertinoSwitch(
                                                  thumbColor: MyColor.white,
                                                  activeColor: MyColor.green,
                                                  trackColor: MyColor.green,
                                                  value: _switchValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _switchValue = value;

                                                      if (_switchValue ==
                                                          true) {
                                                        // activeapi(
                                                        //     propertyDetialsGet
                                                        //         .data!.id
                                                        //         .toString(),
                                                        //     "1");
                                                      } else if (_switchValue ==
                                                          false) {
                                                        // activeapi(
                                                        //     propertyDetialsGet
                                                        //         .data!.id
                                                        //         .toString(),
                                                        //     "0");
                                                      }
                                                    });
                                                  },
                                                ),
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 22,
                                            width: 22,
                                            child: Image.asset(
                                                "assets/images/green_Calender.png"),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            height: 22,
                                            width: 22,
                                            child: Image.asset(
                                                "assets/images/edit_icon.png"),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            height: 22,
                                            width: 22,
                                            child: Image.asset(
                                                "assets/images/delete_icon.png"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
