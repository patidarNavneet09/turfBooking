import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/mytripmodel.dart';
import 'package:truckmanagement/Model/profilemodel.dart';
import 'package:truckmanagement/Screens/dashboard_screen.dart';
import 'package:truckmanagement/Screens/edit_profile.dart';
import 'package:truckmanagement/Screens/new_trip.dart';
import 'package:truckmanagement/Screens/start_trip.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/apiconstant.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/constant/stringfile.dart';
import 'dart:convert' as convert;

import '../Model/statusresponsemodel.dart';

String activetip = "";

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

bool loading1 = true;

class _HomescreenState extends State<Homescreen> {
  // location is variable
  dynamic locationId;
  dynamic status = '';
  int index = 0;
  MyTrip myTrip = MyTrip();
  // init -- screen calling aPI
  @override
  void initState() {
    super.initState();
    index = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) => profileGet(context));
    WidgetsBinding.instance
        .addPostFrameCallback((_) => mytripGet(context, "Pending"));
  }

  returnApi(String status) {
    String sts = "";
    debugPrint("status.............$status");
    if (status == "Loading") {
      sts = "Accepted";
    } else {
      sts = status;
    }
    mytripGet(context, sts);
  }

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    final data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
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
        body:
            loading1 == true ||
                    profilegetResponse.status != true ||
                    myTrip.status != true
                ? Center(
                    child: Image.asset("assets/images/gif_loader.gif"),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
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
                                  padding: const EdgeInsets.only(
                                      top: 25, bottom: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: screen.width * 0.03,
                                      ),
                                      ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: profilegetResponse
                                              .data!.image
                                              .toString(),
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              CircularProgressIndicator(
                                            color: MyColor.button,
                                            value: downloadProgress.progress,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                          height: screen.height * 0.08,
                                          width: screen.height * 0.08,
                                        ),
                                      ),
                                      SizedBox(
                                        width: screen.width * 0.02,
                                      ),
                                      SizedBox(
                                        // color: Colors.amber,
                                        width: screen.width * 0.70,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${profilegetResponse.data!.firstName.toString()} ${profilegetResponse.data!.lastName.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: MyColor.white,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    MyString.welcomeback.tr(),
                                                    // getGreeting(),
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      color: MyColor.white,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // const Expanded(
                                            //   child: Column(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment
                                            //             .spaceBetween,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.end,
                                            //     children: [
                                            //       Text(
                                            //         "Truck ID ",
                                            //         style: TextStyle(
                                            //           fontSize: 16,
                                            //           color: MyColor.white,
                                            //           // overflow: TextOverflow.ellipsis,
                                            //           fontFamily: ColorFamily
                                            //               .fontsSFProDisplay,
                                            //           fontWeight: FontWeight.w500,
                                            //         ),
                                            //       ),
                                            //       Text(
                                            //         "#2512325",
                                            //         style: TextStyle(
                                            //           fontSize: 13,
                                            //           color: MyColor.white,
                                            //           // overflow: TextOverflow.ellipsis,
                                            //           fontFamily: ColorFamily
                                            //               .fontsSFProDisplay,
                                            //           fontWeight: FontWeight.w400,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screen.height * 0.02,
                          ),
                          Text(
                            MyString.myTrips.tr(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: screen.height * 0.011,
                          ),
                          Card(
                            elevation: 0,
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: MyColor.greyText),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              height: screen.height * 0.08,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      status = "Pending";
                                      index = 0;
                                      mytripGet(context, status);
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: screen.width * 0.30,
                                      height: screen.height * 0.08,
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
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            )
                                          : const BoxDecoration(),
                                      child: Center(
                                        child: Text(
                                          MyString.newJobs.tr(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: index == 0
                                                ? Colors.white
                                                : MyColor.tabbar,
                                            // overflow: TextOverflow.ellipsis,
                                            fontFamily:
                                                ColorFamily.fontsSFProDisplay,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      status = "Accepted";
                                      mytripGet(context, status);
                                      index = 1;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: screen.width * 0.30,
                                      height: screen.height * 0.08,
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            )
                                          : const BoxDecoration(),
                                      child: Center(
                                        child: Text(
                                          MyString.active.tr(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: index == 1
                                                ? Colors.white
                                                : MyColor.tabbar,
                                            // overflow: TextOverflow.ellipsis,
                                            fontFamily:
                                                ColorFamily.fontsSFProDisplay,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      status = "Completed";
                                      mytripGet(context, status);
                                      index = 2;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: screen.width * 0.30,
                                      height: screen.height * 0.08,
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
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            )
                                          : const BoxDecoration(),
                                      child: Center(
                                        child: Text(
                                          MyString.completed.tr(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: index == 2
                                                ? Colors.white
                                                : MyColor.tabbar,
                                            // overflow: TextOverflow.ellipsis,
                                            fontFamily:
                                                ColorFamily.fontsSFProDisplay,
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
                          myTrip.status != true &&
                                  myTrip.message.toString() ==
                                      "Trips not Found!"
                              ? SizedBox(
                                  height: screen.height * 0.545,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          MyString.noData.tr(),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : index == 0
                                  ? SingleChildScrollView(
                                      child: myTrip.data!.isEmpty
                                          ? SizedBox(
                                              // color: Colors.amber,
                                              height: screen.height * 0.45,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      MyString.noData.tr(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                SizedBox(
                                                  height: screen.height * 0.545,
                                                  child: ListView.builder(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .only(bottom: 40),
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          myTrip.data!.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Stack(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                var tripId = myTrip
                                                                    .data![
                                                                        index]
                                                                    .id
                                                                    .toString();
                                                                var truckId = myTrip
                                                                    .data![
                                                                        index]
                                                                    .id
                                                                    .toString();
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) => NewTrip(
                                                                            tripId:
                                                                                tripId,
                                                                            truckId:
                                                                                truckId))).then((value) =>
                                                                    returnApi(myTrip
                                                                        .data![
                                                                            index]
                                                                        .status
                                                                        .toString()));
                                                              },
                                                              child: Card(
                                                                color: Colors
                                                                    .white,
                                                                surfaceTintColor:
                                                                    Colors
                                                                        .white,
                                                                elevation: 0,
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: MyColor
                                                                              .greyText),
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12)),
                                                                  child: Column(
                                                                      children: [
                                                                        const SizedBox(
                                                                          height:
                                                                              08,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.02,
                                                                            ),
                                                                            SizedBox(
                                                                                height: 20,
                                                                                width: 20,
                                                                                child: Image.asset("assets/images/triplocation.png")),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.02,
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.75,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        MyString.tripName.tr(),
                                                                                        style: const TextStyle(
                                                                                          fontSize: 12,
                                                                                          color: MyColor.textcolor,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        myTrip.data![index].name.toString(),
                                                                                        style: const TextStyle(
                                                                                          fontSize: 12,
                                                                                          color: MyColor.textcolor1,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      const CircleAvatar(
                                                                                        backgroundColor: MyColor.cardpendding,
                                                                                        radius: 5,
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text(
                                                                                        myTrip.data![index].status.toString() == "Pending" ? MyString.newJobs.tr() : "",
                                                                                        style: const TextStyle(
                                                                                          fontSize: 12,
                                                                                          color: MyColor.cardpendding,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w400,
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
                                                                          height:
                                                                              12,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.02,
                                                                            ),
                                                                            SizedBox(
                                                                                height: 20,
                                                                                width: 20,
                                                                                child: Image.asset("assets/images/calender.png")),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.02,
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.75,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        MyString.startDate.tr(),
                                                                                        style: const TextStyle(
                                                                                          fontSize: 12,
                                                                                          color: MyColor.textcolor,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        myTrip.data![index].startDate.toString(),
                                                                                        style: const TextStyle(
                                                                                          fontSize: 12,
                                                                                          color: MyColor.textcolor1,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w600,
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
                                                                          height:
                                                                              12,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.02,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(top: 5),
                                                                              child: SizedBox(height: 20, width: 20, child: Image.asset("assets/images/locationchart.png")),
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.02,
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.75,
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    MyString.loadingLocation.tr(),
                                                                                    style: const TextStyle(
                                                                                      fontSize: 12,
                                                                                      color: MyColor.textcolor,
                                                                                      // overflow: TextOverflow.ellipsis,
                                                                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: MediaQuery.of(context).size.width * 0.75,
                                                                                    child: Text(
                                                                                      myTrip.data![index].loadingLocation.toString(),
                                                                                      style: const TextStyle(
                                                                                        fontSize: 12,
                                                                                        color: MyColor.textcolor1,
                                                                                        // overflow: TextOverflow.ellipsis,
                                                                                        fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              12,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.02,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(top: 5, right: 0, left: 0),
                                                                              child: SizedBox(height: 22, width: MediaQuery.of(context).size.width * 0.05, child: Image.asset("assets/images/cargotype.png")),
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.02,
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.826,
                                                                              height: 50,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        MyString.cargoType.tr(),
                                                                                        style: const TextStyle(
                                                                                          fontSize: 12,
                                                                                          color: MyColor.textcolor,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        myTrip.data![index].typeOfCargo.toString(),
                                                                                        style: const TextStyle(
                                                                                          fontSize: 12,
                                                                                          color: MyColor.textcolor1,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.30,
                                                                                    height: 30,
                                                                                    decoration: const BoxDecoration(
                                                                                      // color: MyColor.Red_color,
                                                                                      gradient: LinearGradient(
                                                                                        begin: Alignment.centerLeft,
                                                                                        end: Alignment.centerRight,
                                                                                        tileMode: TileMode.mirror,
                                                                                        colors: [
                                                                                          MyColor.button1,
                                                                                          MyColor.button,
                                                                                        ],
                                                                                      ),
                                                                                      borderRadius: BorderRadius.only(
                                                                                          topLeft: Radius.circular(
                                                                                            12,
                                                                                          ),
                                                                                          bottomRight: Radius.circular(10)),
                                                                                    ),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        MyString.viewDetail.tr(),
                                                                                        style: const TextStyle(
                                                                                          fontSize: 12,
                                                                                          color: MyColor.white,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w500,
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
                                          child: myTrip.data!.isEmpty
                                              ? SizedBox(
                                                  height: screen.height * 0.45,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          MyString.noData.tr(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          screen.height * 0.545,
                                                      child: ListView.builder(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .only(
                                                                  bottom: 40),
                                                          shrinkWrap: true,
                                                          itemCount: myTrip
                                                              .data!.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Stack(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    var tripId = myTrip
                                                                        .data![
                                                                            index]
                                                                        .id
                                                                        .toString();
                                                                    var truckId = myTrip
                                                                        .data![
                                                                            index]
                                                                        .id
                                                                        .toString();
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                NewTrip(tripId: tripId, truckId: truckId))).then((value) => returnApi(myTrip
                                                                        .data![
                                                                            index]
                                                                        .status
                                                                        .toString()));
                                                                  },
                                                                  child: Card(
                                                                    color: Colors
                                                                        .white,
                                                                    surfaceTintColor:
                                                                        Colors
                                                                            .white,
                                                                    elevation:
                                                                        0,
                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              color: MyColor
                                                                                  .greyText),
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12)),
                                                                      child: Column(
                                                                          children: [
                                                                            const SizedBox(
                                                                              height: 08,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.02,
                                                                                ),
                                                                                SizedBox(height: 20, width: 20, child: Image.asset("assets/images/triplocation.png")),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.02,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.75,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            MyString.tripName.tr(),
                                                                                            style: const TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: MyColor.textcolor,
                                                                                              // overflow: TextOverflow.ellipsis,
                                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            myTrip.data![index].name.toString(),
                                                                                            style: const TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: MyColor.textcolor1,
                                                                                              // overflow: TextOverflow.ellipsis,
                                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          const CircleAvatar(
                                                                                            backgroundColor: MyColor.cardpendding,
                                                                                            radius: 5,
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            width: 5,
                                                                                          ),
                                                                                          Text(
                                                                                            myTrip.data![index].isstatus.toString(),
                                                                                            style: const TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: MyColor.cardpendding,
                                                                                              // overflow: TextOverflow.ellipsis,
                                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                              fontWeight: FontWeight.w400,
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
                                                                                  width: MediaQuery.of(context).size.width * 0.02,
                                                                                ),
                                                                                SizedBox(height: 20, width: 20, child: Image.asset("assets/images/calender.png")),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.02,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.75,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            MyString.startDate.tr(),
                                                                                            style: const TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: MyColor.textcolor,
                                                                                              // overflow: TextOverflow.ellipsis,
                                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            myTrip.data![index].startDate.toString(),
                                                                                            style: const TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: MyColor.textcolor1,
                                                                                              // overflow: TextOverflow.ellipsis,
                                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                              fontWeight: FontWeight.w600,
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
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.02,
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 5),
                                                                                  child: SizedBox(height: 20, width: 20, child: Image.asset("assets/images/locationchart.png")),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.02,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.75,
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        MyString.loadingLocation.tr(),
                                                                                        style: const TextStyle(
                                                                                          fontSize: 12,
                                                                                          color: MyColor.textcolor,
                                                                                          // overflow: TextOverflow.ellipsis,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: MediaQuery.of(context).size.width * 0.75,
                                                                                        child: Text(
                                                                                          myTrip.data![index].loadingLocation.toString(),
                                                                                          style: const TextStyle(
                                                                                            fontSize: 12,
                                                                                            color: MyColor.textcolor1,
                                                                                            // overflow: TextOverflow.ellipsis,
                                                                                            fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                        ),
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
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.02,
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 5, right: 0, left: 0),
                                                                                  child: SizedBox(height: 22, width: MediaQuery.of(context).size.width * 0.05, child: Image.asset("assets/images/cargotype.png")),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.02,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.826,
                                                                                  height: 50,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            MyString.cargoType.tr(),
                                                                                            style: const TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: MyColor.textcolor,
                                                                                              // overflow: TextOverflow.ellipsis,
                                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            myTrip.data![index].typeOfCargo.toString(),
                                                                                            style: const TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: MyColor.textcolor1,
                                                                                              // overflow: TextOverflow.ellipsis,
                                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.30,
                                                                                        height: 30,
                                                                                        decoration: const BoxDecoration(
                                                                                          // color: MyColor.Red_color,
                                                                                          gradient: LinearGradient(
                                                                                            begin: Alignment.centerLeft,
                                                                                            end: Alignment.centerRight,
                                                                                            tileMode: TileMode.mirror,
                                                                                            colors: [
                                                                                              MyColor.button1,
                                                                                              MyColor.button,
                                                                                            ],
                                                                                          ),
                                                                                          borderRadius: BorderRadius.only(
                                                                                              topLeft: Radius.circular(
                                                                                                12,
                                                                                              ),
                                                                                              bottomRight: Radius.circular(10)),
                                                                                        ),
                                                                                        child: Center(
                                                                                          child: Text(
                                                                                            MyString.viewDetail.tr(),
                                                                                            style: const TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: MyColor.white,
                                                                                              // overflow: TextOverflow.ellipsis,
                                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                              fontWeight: FontWeight.w500,
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
                                              child: myTrip.data!.isEmpty
                                                  ? SizedBox(
                                                      height:
                                                          screen.height * 0.45,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              MyString.noData
                                                                  .tr(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Column(
                                                      children: [
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.545,
                                                          child: ListView
                                                              .builder(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .only(
                                                                          bottom:
                                                                              40),
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount:
                                                                      myTrip
                                                                          .data!
                                                                          .length,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int index) {
                                                                    return Stack(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            var tripId =
                                                                                myTrip.data![index].id.toString();
                                                                            var truckId =
                                                                                myTrip.data![index].id.toString();
                                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => NewTrip(tripId: tripId, truckId: truckId))).then((value) =>
                                                                                returnApi(myTrip.data![index].status.toString()));
                                                                          },
                                                                          child:
                                                                              Card(
                                                                            color:
                                                                                Colors.white,
                                                                            surfaceTintColor:
                                                                                Colors.white,
                                                                            elevation:
                                                                                0,
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(border: Border.all(color: MyColor.greyText), color: Colors.white, borderRadius: BorderRadius.circular(12)),
                                                                              child: Column(children: [
                                                                                const SizedBox(
                                                                                  height: 08,
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.02,
                                                                                    ),
                                                                                    SizedBox(height: 20, width: 20, child: Image.asset("assets/images/triplocation.png")),
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.02,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.75,
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                MyString.tripName.tr(),
                                                                                                style: const TextStyle(
                                                                                                  fontSize: 12,
                                                                                                  color: MyColor.textcolor,
                                                                                                  // overflow: TextOverflow.ellipsis,
                                                                                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                myTrip.data![index].name.toString(),
                                                                                                style: const TextStyle(
                                                                                                  fontSize: 12,
                                                                                                  color: MyColor.textcolor1,
                                                                                                  // overflow: TextOverflow.ellipsis,
                                                                                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            children: [
                                                                                              const CircleAvatar(
                                                                                                backgroundColor: MyColor.cardcompleted,
                                                                                                radius: 5,
                                                                                              ),
                                                                                              const SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              Text(
                                                                                                myTrip.data![index].status.toString(),
                                                                                                style: const TextStyle(
                                                                                                  fontSize: 12,
                                                                                                  color: MyColor.cardcompleted,
                                                                                                  // overflow: TextOverflow.ellipsis,
                                                                                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                                  fontWeight: FontWeight.w400,
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
                                                                                      width: MediaQuery.of(context).size.width * 0.02,
                                                                                    ),
                                                                                    SizedBox(height: 20, width: 20, child: Image.asset("assets/images/calender.png")),
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.02,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.75,
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                MyString.startDate.tr(),
                                                                                                style: const TextStyle(
                                                                                                  fontSize: 12,
                                                                                                  color: MyColor.textcolor,
                                                                                                  // overflow: TextOverflow.ellipsis,
                                                                                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                myTrip.data![index].startDate.toString(),
                                                                                                style: const TextStyle(
                                                                                                  fontSize: 12,
                                                                                                  color: MyColor.textcolor1,
                                                                                                  // overflow: TextOverflow.ellipsis,
                                                                                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                                  fontWeight: FontWeight.w600,
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
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.02,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.only(top: 5),
                                                                                      child: SizedBox(height: 20, width: 20, child: Image.asset("assets/images/locationchart.png")),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.02,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.75,
                                                                                      child: Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            MyString.loadingLocation.tr(),
                                                                                            style: const TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: MyColor.textcolor,
                                                                                              // overflow: TextOverflow.ellipsis,
                                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: MediaQuery.of(context).size.width * 0.75,
                                                                                            child: Text(
                                                                                              myTrip.data![index].loadingLocation.toString(),
                                                                                              style: const TextStyle(
                                                                                                fontSize: 12,
                                                                                                color: MyColor.textcolor1,
                                                                                                // overflow: TextOverflow.ellipsis,
                                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                            ),
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
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.02,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.only(top: 5, right: 0, left: 0),
                                                                                      child: SizedBox(height: 22, width: screen.width * 0.05, child: Image.asset("assets/images/cargotype.png")),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.02,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width * 0.826,
                                                                                      height: 50,
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                MyString.cargoType.tr(),
                                                                                                style: const TextStyle(
                                                                                                  fontSize: 12,
                                                                                                  color: MyColor.textcolor,
                                                                                                  // overflow: TextOverflow.ellipsis,
                                                                                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                myTrip.data![index].typeOfCargo.toString(),
                                                                                                style: const TextStyle(
                                                                                                  fontSize: 12,
                                                                                                  color: MyColor.textcolor1,
                                                                                                  // overflow: TextOverflow.ellipsis,
                                                                                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Container(
                                                                                            width: screen.width * 0.30,
                                                                                            height: 30,
                                                                                            decoration: const BoxDecoration(
                                                                                              // color: MyColor.Red_color,
                                                                                              gradient: LinearGradient(
                                                                                                begin: Alignment.centerLeft,
                                                                                                end: Alignment.centerRight,
                                                                                                tileMode: TileMode.mirror,
                                                                                                colors: [
                                                                                                  MyColor.button1,
                                                                                                  MyColor.button,
                                                                                                ],
                                                                                              ),
                                                                                              borderRadius: BorderRadius.only(
                                                                                                  topLeft: Radius.circular(
                                                                                                    12,
                                                                                                  ),
                                                                                                  bottomRight: Radius.circular(10)),
                                                                                            ),
                                                                                            child: Center(
                                                                                              child: Text(
                                                                                                MyString.viewDetail.tr(),
                                                                                                style: const TextStyle(
                                                                                                  fontSize: 12,
                                                                                                  color: MyColor.white,
                                                                                                  // overflow: TextOverflow.ellipsis,
                                                                                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                                  fontWeight: FontWeight.w500,
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
                  ),
        // bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

// bottom navigation bar
  Container buildMyNavBar(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Container(
      height: screen.height * 0.09,
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
              Text(
                MyString.home.tr(),
                style: const TextStyle(
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
              Text(
                MyString.settings.tr(),
                style: const TextStyle(
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

// Api intrigration - get data from mytrip api like :- active , newjobds ,complated
  Future<MyTrip> mytripGet(BuildContext context, String status) async {
    // Utility.progressloadingDialog(context, true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response =
        await http.get(Uri.parse(ApiServer.mytripapi + status), headers: {
      "content-type": "application/json",
      "accept": "application/json",
      "Authorization":
          "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
    });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    loading1 = true;
    activetip = jsonResponse['active_tip'].toString();
    debugPrint("active_tip............>$activetip");
    if (jsonResponse['status'] == true) {
      myTrip = MyTrip.fromJson(jsonResponse);
      setState(() {
        loading1 = false;
      });
    } else {
      myTrip = MyTrip.fromJson(jsonResponse);
      setState(() {
        loading1 = false;
      });
    }
    // locationId are data set from start trip time for its id set and get location
    locationId = sharedPreferences.getString("trip_id");
    if (activetip.toString() != "0" && context.mounted && locationId != null) {
      debugPrint("navnnnnnn12121");
      updatelocationApi(context);
      timer = Timer.periodic(const Duration(minutes: 5), (timer) {
        debugPrint("navnnnnnn");
        updatelocationApi(context);
      });
      // forground();
    }

    return MyTrip.fromJson(jsonDecode(response.body));
  }

// Api intrigration - get data from profile api
  Future<ProfileGet> profileGet(
    BuildContext context,
  ) async {
    // Utility.progressloadingDialog(context, true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.get(Uri.parse(ApiServer.profiledetail), headers: {
      "content-type": "application/json",
      "accept": "application/json",
      "Authorization":
          "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
    });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    loading1 = true;
    if (jsonResponse['status'] == true) {
      profilegetResponse = ProfileGet.fromJson(jsonResponse);

      loading1 = false;
    } else {
      setState(() {
        loading1 = false;
      });
    }

    return ProfileGet.fromJson(jsonDecode(response.body));
  }

  Future<Statusresponse> updatelocationApi(
    BuildContext context,
  ) async {
    SharedPreferences p = await SharedPreferences.getInstance();
    String tripId = p.getString("trip_id").toString();
    var request = {};
    request['lat'] = currentLocation!.latitude.toString();
    request['lng'] = currentLocation!.longitude.toString();
    request['trip_id'] = tripId;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(
        logLevel: LogLevel.BODY,
      ),
    ]);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(ApiServer.updatelocation),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization":
              "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    if (jsonResponse['status'] == true) {
      debugPrint("response.body>>>>>>>>>>$jsonResponse");
      //   Fluttertoast.showToast(msg: jsonResponse['message']);
    }
    return Statusresponse.fromJson(jsonDecode(response.body));
  }

  forground() {
    // =========== this is for clickable notification in kill state ===========
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message == null && locationId != null) {
        debugPrint("navneertttttttttttt");
        timer = Timer.periodic(const Duration(seconds: 15), (timer) {
          debugPrint("navneert545ttttt");
          updatelocationApi(context);
        });
      } else {}
    });
  }
}
