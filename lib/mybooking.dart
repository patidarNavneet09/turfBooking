import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  int indexBoolingtime = 0;
  @override
  void initState() {
    indexBoolingtime = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          MyString.myBooking.tr(),
          style: const TextStyle(
            fontSize: 18,
            color: MyColor.black,
            fontFamily: ColorFamily.fontsPopinsDisplay,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexBoolingtime = 1;
                  });
                },
                child: Text(
                  MyString.upcoming.tr(),
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        indexBoolingtime == 1 ? MyColor.green : MyColor.black,
                    fontFamily: ColorFamily.fontsPopinsDisplay,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexBoolingtime = 2;
                  });
                },
                child: Text(
                  MyString.pastbooking.tr(),
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        indexBoolingtime == 2 ? MyColor.green : MyColor.black,
                    fontFamily: ColorFamily.fontsPopinsDisplay,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  indexBoolingtime == 1
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
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
                                      Container(
                                        decoration: BoxDecoration(
                                          color: MyColor.yellowlite,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        width: screen.size.width * 0.90,
                                        // height: 90,
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Wednesday 20 April 2023",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: MyColor.black,
                                                  fontFamily: ColorFamily
                                                      .fontsPopinsDisplay,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "1 Slot 11:00 am - 12:00 pm",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: MyColor.black,
                                                  fontFamily: ColorFamily
                                                      .fontsPopinsDisplay,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                "1 Slot 11:00 am - 12:00 pm",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: MyColor.black,
                                                  fontFamily: ColorFamily
                                                      .fontsPopinsDisplay,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
                                                  margin:
                                                      const EdgeInsets.all(2),
                                                  height: 62,
                                                  width: 62,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 4,
                                                        color: MyColor.white),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
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
                                                  Text(
                                                    'Sports Astro Turf',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: MyColor.black,
                                                      fontFamily: ColorFamily
                                                          .fontsPopinsDisplay,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'St. Francis Xavier High School Ground, Dias And Pereira Nagar, Naigaon West, Mumbai, Maharashtra',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: MyColor.black,
                                                      fontFamily: ColorFamily
                                                          .fontsPopinsDisplay,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : indexBoolingtime == 2
                          ? ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
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
                                          Container(
                                            decoration: BoxDecoration(
                                              color: MyColor.green,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            width: screen.size.width * 0.90,
                                            // height: 90,
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Wednesday 20 April 2023",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: MyColor.black,
                                                      fontFamily: ColorFamily
                                                          .fontsPopinsDisplay,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "1 Slot 11:00 am - 12:00 pm",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: MyColor.black,
                                                      fontFamily: ColorFamily
                                                          .fontsPopinsDisplay,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "1 Slot 11:00 am - 12:00 pm",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: MyColor.black,
                                                      fontFamily: ColorFamily
                                                          .fontsPopinsDisplay,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              2),
                                                      height: 62,
                                                      width: 62,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 4,
                                                            color:
                                                                MyColor.white),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Sports Astro Turf',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: MyColor.black,
                                                          fontFamily: ColorFamily
                                                              .fontsPopinsDisplay,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'St. Francis Xavier High School Ground, Dias And Pereira Nagar, Naigaon West, Mumbai, Maharashtra',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: MyColor.black,
                                                          fontFamily: ColorFamily
                                                              .fontsPopinsDisplay,
                                                          // overflow: TextOverflow.ellipsis,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                          : Center(child: Text(MyString.noBooking.tr())),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
