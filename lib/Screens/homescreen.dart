import 'package:flutter/material.dart';
import 'package:truckmanagement/Screens/tripdetials.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

int index = 0;

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
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
                          child: const Column(
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
                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Truck ID  ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: MyColor.white,
                                      // overflow: TextOverflow.ellipsis,
                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Good Morning!",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: MyColor.white,
                                      // overflow: TextOverflow.ellipsis,
                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    " #2512325",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: MyColor.white,
                                      // overflow: TextOverflow.ellipsis,
                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              "My Trips",
              style: TextStyle(
                fontSize: 18,
                color: MyColor.black,
                // overflow: TextOverflow.ellipsis,
                fontFamily: ColorFamily.fontsSFProDisplay,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.011,
            ),
            Card(
              elevation: 1,
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(width: 2.1, color: MyColor.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        index = 0;
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: index == 0
                            ? BoxDecoration(
                                color: Colors.white,
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  tileMode: TileMode.mirror,
                                  colors: [
                                    MyColor.button1,
                                    MyColor.button,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              )
                            : const BoxDecoration(),
                        child: Center(
                          child: Text(
                            "Active",
                            style: TextStyle(
                              fontSize: 16,
                              color: index == 0 ? Colors.white : MyColor.tabbar,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        index = 1;
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: index == 1
                            ? BoxDecoration(
                                color: Colors.white,
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  tileMode: TileMode.mirror,
                                  colors: [
                                    MyColor.button1,
                                    MyColor.button,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              )
                            : const BoxDecoration(),
                        child: Center(
                          child: Text(
                            "Pending",
                            style: TextStyle(
                              fontSize: 16,
                              color: index == 1 ? Colors.white : MyColor.tabbar,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        index = 2;
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: index == 2
                            ? BoxDecoration(
                                color: Colors.white,
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  tileMode: TileMode.mirror,
                                  colors: [
                                    MyColor.button1,
                                    MyColor.button,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              )
                            : const BoxDecoration(),
                        child: Center(
                          child: Text(
                            "Completed",
                            style: TextStyle(
                              fontSize: 16,
                              color: index == 2 ? Colors.white : MyColor.tabbar,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            index == 0
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.545,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TripDetials()));
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        surfaceTintColor: Colors.white,
                                        child: Column(children: [
                                          const SizedBox(
                                            height: 08,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/triplocation.png")),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.75,
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Trip Name",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColor
                                                                .textcolor,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Indore to Bhopal",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColor
                                                                .textcolor1,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.green,
                                                          radius: 5,
                                                        ),
                                                        Text(
                                                          "  Accepted",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.green,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/calender.png")),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.75,
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Start Date",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColor
                                                                .textcolor,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          "December 22, 2023",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColor
                                                                .textcolor1,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/locationchart.png")),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.75,
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Loading Location",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColor
                                                                .textcolor,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Indore",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColor
                                                                .textcolor1,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: SizedBox(
                                                    height: 22,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.05,
                                                    child: Image.asset(
                                                        "assets/images/cargotype.png")),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.832,
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    const Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Cargo Type",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColor
                                                                .textcolor,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          "General Cargo",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColor
                                                                .textcolor1,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.30,
                                                      height: 30,
                                                      decoration:
                                                          const BoxDecoration(
                                                        // color: MyColor.Red_color,
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                          tileMode:
                                                              TileMode.mirror,
                                                          colors: [
                                                            MyColor.button1,
                                                            MyColor.button,
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                  12,
                                                                ),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10)),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          "View Detail",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                MyColor.white,
                                                            // overflow: TextOverflow.ellipsis,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                : index == 1
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.545,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TripDetials()));
                                          },
                                          child: Card(
                                            color: Colors.white,
                                            surfaceTintColor: Colors.white,
                                            child: Column(children: [
                                              const SizedBox(
                                                height: 08,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                  ),
                                                  SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Image.asset(
                                                          "assets/images/triplocation.png")),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Trip Name",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .textcolor,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            Text(
                                                              "Indore to Bhopal",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .textcolor1,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  MyColor
                                                                      .cardpendding,
                                                              radius: 5,
                                                            ),
                                                            Text(
                                                              "  New Job",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .cardpendding,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                  ),
                                                  SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Image.asset(
                                                          "assets/images/calender.png")),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Start Date",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .textcolor,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            Text(
                                                              "December 22, 2023",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .textcolor1,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                  ),
                                                  SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Image.asset(
                                                          "assets/images/locationchart.png")),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Loading Location",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .textcolor,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            Text(
                                                              "Indore",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .textcolor1,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    child: SizedBox(
                                                        height: 22,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.05,
                                                        child: Image.asset(
                                                            "assets/images/cargotype.png")),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.832,
                                                    height: 50,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        const Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Cargo Type",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .textcolor,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            Text(
                                                              "General Cargo",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .textcolor1,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.30,
                                                          height: 30,
                                                          decoration:
                                                              const BoxDecoration(
                                                            // color: MyColor.Red_color,
                                                            gradient:
                                                                LinearGradient(
                                                              begin: Alignment
                                                                  .centerLeft,
                                                              end: Alignment
                                                                  .centerRight,
                                                              tileMode: TileMode
                                                                  .mirror,
                                                              colors: [
                                                                MyColor.button1,
                                                                MyColor.button,
                                                              ],
                                                            ),
                                                            borderRadius: BorderRadius
                                                                .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                      12,
                                                                    ),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10)),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              "View Detail",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: MyColor
                                                                    .white,
                                                                // overflow: TextOverflow.ellipsis,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      )
                    : index == 2
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.545,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Stack(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const TripDetials()));
                                              },
                                              child: Card(
                                                color: Colors.white,
                                                surfaceTintColor: Colors.white,
                                                child: Column(children: [
                                                  const SizedBox(
                                                    height: 08,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                      ),
                                                      SizedBox(
                                                          height: 20,
                                                          width: 20,
                                                          child: Image.asset(
                                                              "assets/images/triplocation.png")),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Trip Name",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .textcolor,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "Indore to Bhopal",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .textcolor1,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                CircleAvatar(
                                                                  backgroundColor:
                                                                      MyColor
                                                                          .cardcompleted,
                                                                  radius: 5,
                                                                ),
                                                                Text(
                                                                  "  Completed",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .cardcompleted,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                      ),
                                                      SizedBox(
                                                          height: 20,
                                                          width: 20,
                                                          child: Image.asset(
                                                              "assets/images/calender.png")),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Start Date",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .textcolor,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "December 22, 2023",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .textcolor1,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                      ),
                                                      SizedBox(
                                                          height: 20,
                                                          width: 20,
                                                          child: Image.asset(
                                                              "assets/images/locationchart.png")),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Loading Location",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .textcolor,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "Indore",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .textcolor1,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 5),
                                                        child: SizedBox(
                                                            height: 22,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.05,
                                                            child: Image.asset(
                                                                "assets/images/cargotype.png")),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.832,
                                                        height: 50,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            const Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Cargo Type",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .textcolor,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "General Cargo",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .textcolor1,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.30,
                                                              height: 30,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                // color: MyColor.Red_color,
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .centerLeft,
                                                                  end: Alignment
                                                                      .centerRight,
                                                                  tileMode:
                                                                      TileMode
                                                                          .mirror,
                                                                  colors: [
                                                                    MyColor
                                                                        .button1,
                                                                    MyColor
                                                                        .button,
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius
                                                                    .only(
                                                                        topLeft:
                                                                            Radius
                                                                                .circular(
                                                                          12,
                                                                        ),
                                                                        bottomRight:
                                                                            Radius.circular(10)),
                                                              ),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "View Detail",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: MyColor
                                                                        .white,
                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ]),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          )
                        : Container()
          ],
        ),
      ),
      // bottomNavigationBar: buildMyNavBar(context),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/Home.png")),
              const Text(
                "Home",
                style: TextStyle(
                  fontSize: 10,
                  color: MyColor.white,
                  // overflow: TextOverflow.ellipsis,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/setting.png")),
              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 10,
                  color: MyColor.white,
                  // overflow: TextOverflow.ellipsis,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
