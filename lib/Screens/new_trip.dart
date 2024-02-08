import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/tripdetailsmodel.dart';
import 'package:truckmanagement/Screens/large_images.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'dart:convert' as convert;
import '../constant/apiconstant.dart';

class NewTrip extends StatefulWidget {
  final String? tripId;
  final String? truckId;
  const NewTrip({super.key, this.tripId, this.truckId});

  @override
  State<NewTrip> createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
  Tripdetails tripdetails = Tripdetails();
  bool loading1 = true;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => tripdetialsGet(
        context, widget.truckId.toString(), widget.tripId.toString()));
  }

  List tripData = [
    "Trip Detail",
    "Add On Diesel",
    "Enroute Diesel",
    "Repairs",
    "Tolls",
    "Road Accident",
    "Fine",
    "Other Charges",
    "Delivery Information",
  ];
  dynamic Index = 0;
  @override
  Widget build(BuildContext context) {
    var screens = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: false,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: screens.width,
        leading: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              width: screens.width * 0.10,
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ))),
                      Container(
                        width: screens.width * 0.82,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Trip Details",
                              style: TextStyle(
                                fontSize: 16,
                                color: MyColor.appbartext,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tripData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Index = index;
                              setState(() {});
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              shadowColor: Colors.black,
                              elevation: 0,
                              child: Container(
                                margin: const EdgeInsets.all(0),
                                height: 30,
                                // width: 100,
                                constraints:
                                    const BoxConstraints(minWidth: 100),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    // gradient: const LinearGradient(
                                    //   begin: Alignment.centerLeft,
                                    //   end: Alignment.centerRight,
                                    //   tileMode: TileMode.mirror,
                                    //   colors: [
                                    //     Color.fromARGB(255, 39, 37, 37),
                                    //     Color.fromARGB(255, 26, 75, 112),
                                    //   ],
                                    // ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          tripData[index].toString(),
                                          style: const TextStyle(
                                            color: MyColor.black,
                                          ),
                                        ),
                                        index == 0
                                            ? Container(
                                                width: 80,
                                                height: 2,
                                                color: Colors.black)
                                            : index == 1
                                                ? Container(
                                                    width: 110,
                                                    height: 2,
                                                    color: Colors.black)
                                                : index == 2
                                                    ? Container(
                                                        width: 110,
                                                        height: 2,
                                                        color: Colors.black)
                                                    : index == 3
                                                        ? Container(
                                                            width: 65,
                                                            height: 2,
                                                            color: Colors.black)
                                                        : index == 4
                                                            ? Container(
                                                                width: 35,
                                                                height: 2,
                                                                color: Colors
                                                                    .black)
                                                            : index == 5
                                                                ? Container(
                                                                    width: 105,
                                                                    height: 2,
                                                                    color: Colors
                                                                        .black)
                                                                : index == 6
                                                                    ? Container(
                                                                        width:
                                                                            40,
                                                                        height:
                                                                            2,
                                                                        color: Colors
                                                                            .black)
                                                                    : index == 7
                                                                        ? Container(
                                                                            width:
                                                                                100,
                                                                            height:
                                                                                2,
                                                                            color: Colors
                                                                                .black)
                                                                        : index ==
                                                                                8
                                                                            ? Container(
                                                                                width: 138,
                                                                                height: 2,
                                                                                color: Colors.black)
                                                                            : index == 9
                                                                                ? Container(width: 140, height: 2, color: Colors.black)
                                                                                : Container(width: 120, height: 2, color: Colors.black),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: tripdetails.status != true
          ? Center(
              child: Image.asset("assets/images/gif_loader.gif"),
            )
          : SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Index == 0
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Trip Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 04,
                              ),
                              Text(
                                tripdetails.data!.name.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screens.width * 0.03,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          // DateTime? pickedDate;
                                          // pickedDate = await showDatePicker(
                                          //     context: context,
                                          //     initialDate: DateTime.now(),
                                          //     firstDate: DateTime(
                                          //         2000), //DateTime.now() - not to allow to choose before today.
                                          //     lastDate: DateTime(2101));

                                          // if (pickedDate != null) {
                                          //   //pickedDate output format => 2021-03-10 00:00:00.000
                                          //   startDate =
                                          //       DateFormat('dd/MM/yyyy').format(pickedDate);
                                          //   setState(() {});
                                          //   //formatted date output using intl package =>  2021-03-16
                                          //   //you can implement different kind of Date Format here according to your requirement
                                          // } else {}
                                        },
                                        child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset(
                                                "assets/images/calender.png")),
                                      ),
                                      SizedBox(
                                        width: screens.width * 0.05,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Start Date",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: MyColor.greyText,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 04,
                                          ),
                                          Text(
                                            // startDate == null ? "25/01/2024" : startDate,
                                            tripdetails.data!.startDate
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: MyColor.black,
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
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screens.width * 0.03,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          // DateTime? pickedDate;
                                          // pickedDate = await showDatePicker(
                                          //     context: context,
                                          //     initialDate: DateTime.now(),
                                          //     firstDate: DateTime(
                                          //         2000), //DateTime.now() - not to allow to choose before today.
                                          //     lastDate: DateTime(2101));

                                          // if (pickedDate != null) {
                                          //   //pickedDate output format => 2021-03-10 00:00:00.000
                                          //   endDate =
                                          //       DateFormat('dd/MM/yyyy').format(pickedDate);
                                          //   setState(() {});
                                          //   //formatted date output using intl package =>  2021-03-16
                                          //   //you can implement different kind of Date Format here according to your requirement
                                          // } else {}
                                          // setState(() {});
                                        },
                                        child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset(
                                                "assets/images/calender.png")),
                                      ),
                                      SizedBox(
                                        width: screens.width * 0.05,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "End Date",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: MyColor.greyText,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 04,
                                          ),
                                          Text(
                                            // endDate == null ? "30/01/2024" : endDate,
                                            tripdetails.data!.endDate
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: MyColor.black,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: screens.width * 0.12,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screens.width * 0.03,
                                      ),
                                      SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/images/calender.png")),
                                      SizedBox(
                                        width: screens.width * 0.05,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Loading Location",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: MyColor.greyText,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 04,
                                          ),
                                          Text(
                                            tripdetails.data!.loadingLocation
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: MyColor.black,
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
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screens.width * 0.05,
                                      ),
                                      SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/images/calender.png")),
                                      SizedBox(
                                        width: screens.width * 0.05,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Offloading Location",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: MyColor.greyText,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 04,
                                          ),
                                          Text(
                                            tripdetails.data!.offloadingLocation
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: MyColor.black,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: screens.width * 0.04,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Cargo Type",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 04,
                              ),
                              Text(
                                tripdetails.data!.typeOfCargo.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Select Truck",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 04,
                              ),
                              Text(
                                // "Box Truck",
                                tripdetails.data!.truck.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Weight Of Cargo",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 04,
                              ),
                              Text(
                                "${tripdetails.data!.weightOfCargo.toString()} Kg",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Initial Diesel",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 04,
                              ),
                              Text(
                                tripdetails.data!.initialDiesel.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Mileage Allowances",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 04,
                              ),
                              Text(
                                "\$${tripdetails.data!.mileageAllowance.toString()}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Movement Sheet ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 04,
                              ),
                              Text(
                                "\$${tripdetails.data!.movementSheet.toString()}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Road Toll",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 04,
                              ),
                            ],
                          ),
                        )
                      : Index == 1
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //       width: 1, color: MyColor.greyText),
                                    //   borderRadius: const BorderRadius.all(
                                    //       Radius.circular(10)),
                                    // ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Add On Diesel",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.black,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                // color: Colors.amber,
                                                // height: screens.height * 0.08,
                                                width: screens.width * 0.20,
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Photos",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.greyText,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                // color: Colors.amber,
                                                // height: screens.height * 0.08,
                                                width: screens.width * 0.20,
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Quantity",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.greyText,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                // color: Colors.amber,
                                                // height: screens.height * 0.08,
                                                width: screens.width * 0.20,
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Unit Price",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.greyText,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                // color: Colors.amber,
                                                // height: screens.height * 0.08,
                                                width: screens.width * 0.20,
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Fuel Station",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.greyText,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            color:
                                                Color.fromARGB(255, 46, 44, 44),
                                            thickness: 1,
                                            indent: 2,
                                            endIndent: 2,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: tripdetails
                                                .data!.addOnDiesels!.length,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          // color: Colors.amber,
                                                          width: screens.width *
                                                              0.20,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                height: 40,
                                                                width: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: MyColor
                                                                          .button),
                                                                  borderRadius: const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10)),
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                LargeImages(
                                                                          imagesUrl: tripdetails
                                                                              .data!
                                                                              .addOnDiesels![index]
                                                                              .petrolStationImage
                                                                              .toString(),
                                                                          nameProperty:
                                                                              "Add On Diesel",
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            09)),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl: tripdetails
                                                                          .data!
                                                                          .addOnDiesels![
                                                                              index]
                                                                          .petrolStationImage
                                                                          .toString(),
                                                                      progressIndicatorBuilder: (context,
                                                                              url,
                                                                              downloadProgress) =>
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              MyColor.button,
                                                                          value:
                                                                              downloadProgress.progress,
                                                                        ),
                                                                      ),
                                                                      errorWidget: (context,
                                                                              url,
                                                                              error) =>
                                                                          const Icon(
                                                                              Icons.error),
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      height: screens
                                                                              .height *
                                                                          0.08,
                                                                      width: screens
                                                                              .width *
                                                                          0.08,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          // color: Colors.amber,
                                                          // height: screens.height * 0.08,
                                                          width: screens.width *
                                                              0.20,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  tripdetails
                                                                      .data!
                                                                      .addOnDiesels![
                                                                          index]
                                                                      .quantityInLitres
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: MyColor
                                                                        .black,

                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          // color: Colors.amber,
                                                          // height: screens.height * 0.08,
                                                          width: screens.width *
                                                              0.20,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  tripdetails
                                                                      .data!
                                                                      .addOnDiesels![
                                                                          index]
                                                                      .unitPrice
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: MyColor
                                                                        .black,

                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        SizedBox(
                                                          // color: Colors.amber,
                                                          // height: screens.height * 0.08,
                                                          width: screens.width *
                                                              0.17,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  tripdetails
                                                                      .data!
                                                                      .addOnDiesels![
                                                                          index]
                                                                      .petrolStation
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: MyColor
                                                                        .black,

                                                                    // overflow: TextOverflow.ellipsis,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        // Content below the Divider
                                                      ],
                                                    ),
                                                    const Divider(
                                                      color: Color.fromARGB(
                                                          255, 46, 44, 44),
                                                      thickness: 1,
                                                      indent: 2,
                                                      endIndent: 2,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Index == 2
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // decoration: BoxDecoration(
                                        //   border: Border.all(
                                        //       width: 1,
                                        //       color: MyColor.greyText),
                                        //   borderRadius: const BorderRadius.all(
                                        //       Radius.circular(10)),
                                        // ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Enroute Diesel",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    // color: Colors.amber,
                                                    // height: screens.height * 0.08,
                                                    width: screens.width * 0.20,
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Photos",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: MyColor
                                                                .greyText,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    // color: Colors.amber,
                                                    // height: screens.height * 0.08,
                                                    width: screens.width * 0.20,
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Quantity",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: MyColor
                                                                .greyText,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    // color: Colors.amber,
                                                    // height: screens.height * 0.08,
                                                    width: screens.width * 0.20,
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Unit Price",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: MyColor
                                                                .greyText,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    // color: Colors.amber,
                                                    // height: screens.height * 0.08,
                                                    width: screens.width * 0.20,
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Fuel Station",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: MyColor
                                                                .greyText,
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Divider(
                                                color: Color.fromARGB(
                                                    255, 46, 44, 44),
                                                thickness: 1,
                                                indent: 2,
                                                endIndent: 2,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: tripdetails.data!
                                                    .enrouteDiesels!.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              // color: Colors.amber,
                                                              width: screens
                                                                      .width *
                                                                  0.20,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              MyColor.button),
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              10)),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                LargeImages(
                                                                              imagesUrl: tripdetails.data!.enrouteDiesels![index].petrolStationImage.toString(),
                                                                              nameProperty: "Enroute Diesel",
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            const BorderRadius.all(Radius.circular(09)),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl: tripdetails
                                                                              .data!
                                                                              .enrouteDiesels![index]
                                                                              .petrolStationImage
                                                                              .toString(),
                                                                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: MyColor.button,
                                                                              value: downloadProgress.progress,
                                                                            ),
                                                                          ),
                                                                          errorWidget: (context, url, error) =>
                                                                              const Icon(Icons.error),
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          height:
                                                                              screens.height * 0.08,
                                                                          width:
                                                                              screens.width * 0.08,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              // color: Colors.amber,
                                                              // height: screens.height * 0.08,
                                                              width: screens
                                                                      .width *
                                                                  0.20,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      tripdetails
                                                                          .data!
                                                                          .enrouteDiesels![
                                                                              index]
                                                                          .quantity
                                                                          .toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: MyColor
                                                                            .black,

                                                                        // overflow: TextOverflow.ellipsis,
                                                                        fontFamily:
                                                                            ColorFamily.fontsSFProDisplay,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              // color: Colors.amber,
                                                              // height: screens.height * 0.08,
                                                              width: screens
                                                                      .width *
                                                                  0.20,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      tripdetails
                                                                          .data!
                                                                          .enrouteDiesels![
                                                                              index]
                                                                          .unitPrice
                                                                          .toString(),
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: MyColor
                                                                            .black,

                                                                        // overflow: TextOverflow.ellipsis,
                                                                        fontFamily:
                                                                            ColorFamily.fontsSFProDisplay,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              // color: Colors.amber,
                                                              // height: screens.height * 0.08,
                                                              width: screens
                                                                      .width *
                                                                  0.17,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      tripdetails
                                                                          .data!
                                                                          .enrouteDiesels![
                                                                              index]
                                                                          .petrolStation
                                                                          .toString(),
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: MyColor
                                                                            .black,

                                                                        // overflow: TextOverflow.ellipsis,
                                                                        fontFamily:
                                                                            ColorFamily.fontsSFProDisplay,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            // Content below the Divider
                                                          ],
                                                        ),
                                                        const Divider(
                                                          color: Color.fromARGB(
                                                              255, 46, 44, 44),
                                                          thickness: 1,
                                                          indent: 2,
                                                          endIndent: 2,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Index == 3
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            // decoration: BoxDecoration(
                                            //   border: Border.all(
                                            //       width: 1,
                                            //       color: MyColor.greyText),
                                            //   borderRadius:
                                            //       const BorderRadius.all(
                                            //           Radius.circular(10)),
                                            // ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Repairs",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: MyColor.black,
                                                          fontFamily: ColorFamily
                                                              .fontsSFProDisplay,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        // color: Colors.amber,
                                                        // height: screens.height * 0.08,
                                                        width: screens.width *
                                                            0.20,
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Photos",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: MyColor
                                                                    .greyText,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        // color: Colors.amber,
                                                        // height: screens.height * 0.08,
                                                        width: screens.width *
                                                            0.20,
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Shop Name",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: MyColor
                                                                    .greyText,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Repair Name",
                                                            style: TextStyle(
                                                              // fontSize: 14,
                                                              color: MyColor
                                                                  .greyText,
                                                              fontFamily:
                                                                  ColorFamily
                                                                      .fontsSFProDisplay,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        // color: Colors.amber,
                                                        // height: screens.height * 0.08,
                                                        width: screens.width *
                                                            0.20,
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Repair Cost",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: MyColor
                                                                    .greyText,
                                                                fontFamily:
                                                                    ColorFamily
                                                                        .fontsSFProDisplay,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    color: Color.fromARGB(
                                                        255, 46, 44, 44),
                                                    thickness: 1,
                                                    indent: 2,
                                                    endIndent: 2,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: tripdetails
                                                        .data!.repairs!.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  // color: Colors.amber,
                                                                  width: screens
                                                                          .width *
                                                                      0.20,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            40,
                                                                        width:
                                                                            40,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border: Border.all(
                                                                              width: 1,
                                                                              color: MyColor.button),
                                                                          borderRadius:
                                                                              const BorderRadius.all(Radius.circular(10)),
                                                                        ),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => LargeImages(
                                                                                  imagesUrl: tripdetails.data!.repairs![index].uploadBill.toString(),
                                                                                  nameProperty: "Repairs",
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                const BorderRadius.all(Radius.circular(09)),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              imageUrl: tripdetails.data!.repairs![index].uploadBill.toString(),
                                                                              progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: CircularProgressIndicator(
                                                                                  color: MyColor.button,
                                                                                  value: downloadProgress.progress,
                                                                                ),
                                                                              ),
                                                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                              fit: BoxFit.fill,
                                                                              height: screens.height * 0.08,
                                                                              width: screens.width * 0.08,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  // color: Colors.amber,
                                                                  // height: screens.height * 0.08,
                                                                  width: screens
                                                                          .width *
                                                                      0.20,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          tripdetails
                                                                              .data!
                                                                              .repairs![index]
                                                                              .shopName
                                                                              .toString(),
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                MyColor.black,

                                                                            // overflow: TextOverflow.ellipsis,
                                                                            fontFamily:
                                                                                ColorFamily.fontsSFProDisplay,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  // color: Colors.amber,
                                                                  // height: screens.height * 0.08,
                                                                  width: screens
                                                                          .width *
                                                                      0.20,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          tripdetails
                                                                              .data!
                                                                              .repairs![index]
                                                                              .repairName
                                                                              .toString(),
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                MyColor.black,

                                                                            // overflow: TextOverflow.ellipsis,
                                                                            fontFamily:
                                                                                ColorFamily.fontsSFProDisplay,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),

                                                                SizedBox(
                                                                  // color: Colors.amber,
                                                                  // height: screens.height * 0.08,
                                                                  width: screens
                                                                          .width *
                                                                      0.17,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          tripdetails
                                                                              .data!
                                                                              .repairs![index]
                                                                              .repairCost
                                                                              .toString(),
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                MyColor.black,

                                                                            // overflow: TextOverflow.ellipsis,
                                                                            fontFamily:
                                                                                ColorFamily.fontsSFProDisplay,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                // Content below the Divider
                                                              ],
                                                            ),
                                                            const Divider(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      46,
                                                                      44,
                                                                      44),
                                                              thickness: 1,
                                                              indent: 2,
                                                              endIndent: 2,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            // color: Colors.amber,
                                                            // height: screens.height * 0.08,
                                                            width:
                                                                screens.width *
                                                                    0.20,
                                                            child: const Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Photos",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: MyColor
                                                                        .greyText,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Spare Name",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: MyColor
                                                                      .greyText,
                                                                  fontFamily:
                                                                      ColorFamily
                                                                          .fontsSFProDisplay,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Spare Cost",
                                                                style:
                                                                    TextStyle(
                                                                  // fontSize: 14,
                                                                  color: MyColor
                                                                      .greyText,
                                                                  fontFamily:
                                                                      ColorFamily
                                                                          .fontsSFProDisplay,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Total Amount",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: MyColor
                                                                      .greyText,
                                                                  fontFamily:
                                                                      ColorFamily
                                                                          .fontsSFProDisplay,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Divider(
                                                        color: Color.fromARGB(
                                                            255, 46, 44, 44),
                                                        thickness: 1,
                                                        indent: 2,
                                                        endIndent: 2,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: tripdetails
                                                            .data!
                                                            .repairs!
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      // color: Colors.amber,
                                                                      width: screens
                                                                              .width *
                                                                          0.20,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                40,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              border: Border.all(width: 1, color: MyColor.button),
                                                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                    builder: (context) => LargeImages(
                                                                                      imagesUrl: tripdetails.data!.repairs![index].uploadBill.toString(),
                                                                                      nameProperty: "Repairs",
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: const BorderRadius.all(Radius.circular(09)),
                                                                                child: CachedNetworkImage(
                                                                                  imageUrl: tripdetails.data!.repairs![index].uploadBill.toString(),
                                                                                  progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: CircularProgressIndicator(
                                                                                      color: MyColor.button,
                                                                                      value: downloadProgress.progress,
                                                                                    ),
                                                                                  ),
                                                                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                                  fit: BoxFit.fill,
                                                                                  height: screens.height * 0.08,
                                                                                  width: screens.width * 0.08,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      // color: Colors.amber,
                                                                      // height: screens.height * 0.08,
                                                                      width: screens
                                                                              .width *
                                                                          0.20,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              tripdetails.data!.repairs![index].spareName.toString(),
                                                                              style: const TextStyle(
                                                                                fontSize: 14,
                                                                                color: MyColor.black,

                                                                                // overflow: TextOverflow.ellipsis,
                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      // color: Colors.amber,
                                                                      // height: screens.height * 0.08,
                                                                      width: screens
                                                                              .width *
                                                                          0.20,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              tripdetails.data!.repairs![index].spareCost.toString(),
                                                                              style: const TextStyle(
                                                                                fontSize: 14,
                                                                                color: MyColor.black,

                                                                                // overflow: TextOverflow.ellipsis,
                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),

                                                                    SizedBox(
                                                                      // color: Colors.amber,
                                                                      // height: screens.height * 0.08,
                                                                      width: screens
                                                                              .width *
                                                                          0.17,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              tripdetails.data!.repairs![index].totalAmount.toString(),
                                                                              style: const TextStyle(
                                                                                fontSize: 14,
                                                                                color: MyColor.black,

                                                                                // overflow: TextOverflow.ellipsis,
                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    // Content below the Divider
                                                                  ],
                                                                ),
                                                                const Divider(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          46,
                                                                          44,
                                                                          44),
                                                                  thickness: 1,
                                                                  indent: 2,
                                                                  endIndent: 2,
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Index == 4
                                      ? Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                // decoration: BoxDecoration(
                                                //   border: Border.all(
                                                //       width: 1,
                                                //       color: MyColor.greyText),
                                                //   borderRadius:
                                                //       const BorderRadius.all(
                                                //           Radius.circular(10)),
                                                // ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Tolls",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  MyColor.black,
                                                              fontFamily:
                                                                  ColorFamily
                                                                      .fontsSFProDisplay,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            // color: Colors.amber,
                                                            // height: screens.height * 0.08,
                                                            width:
                                                                screens.width *
                                                                    0.20,
                                                            child: const Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Photos",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: MyColor
                                                                        .greyText,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            // color: Colors.amber,
                                                            // height: screens.height * 0.08,
                                                            width:
                                                                screens.width *
                                                                    0.20,
                                                            child: const Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Toll Name",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: MyColor
                                                                        .greyText,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            // color: Colors.amber,
                                                            // height: screens.height * 0.08,
                                                            width:
                                                                screens.width *
                                                                    0.20,
                                                            child: const Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Amount",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: MyColor
                                                                        .greyText,
                                                                    fontFamily:
                                                                        ColorFamily
                                                                            .fontsSFProDisplay,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            // color: Colors.amber,
                                                            // height: screens.height * 0.08,
                                                            width:
                                                                screens.width *
                                                                    0.20,
                                                            // child: const Row(
                                                            //   mainAxisAlignment:
                                                            //       MainAxisAlignment.center,
                                                            //   children: [
                                                            //     Text(
                                                            //       "Fuel Station",
                                                            //       style: TextStyle(
                                                            //         fontSize: 14,
                                                            //         color: MyColor.greyText,
                                                            //         fontFamily: ColorFamily
                                                            //             .fontsSFProDisplay,
                                                            //         fontWeight:
                                                            //             FontWeight.w400,
                                                            //       ),
                                                            //     ),
                                                            //   ],
                                                            // ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Divider(
                                                        color: Color.fromARGB(
                                                            255, 46, 44, 44),
                                                        thickness: 1,
                                                        indent: 2,
                                                        endIndent: 2,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: tripdetails
                                                            .data!
                                                            .tolls!
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      // color: Colors.amber,
                                                                      width: screens
                                                                              .width *
                                                                          0.20,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                40,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              border: Border.all(width: 1, color: MyColor.button),
                                                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                    builder: (context) => LargeImages(
                                                                                      imagesUrl: tripdetails.data!.tolls![index].tollImage.toString(),
                                                                                      nameProperty: "Tolls",
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: const BorderRadius.all(Radius.circular(09)),
                                                                                child: CachedNetworkImage(
                                                                                  imageUrl: tripdetails.data!.tolls![index].tollImage.toString(),
                                                                                  progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: CircularProgressIndicator(
                                                                                      color: MyColor.button,
                                                                                      value: downloadProgress.progress,
                                                                                    ),
                                                                                  ),
                                                                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                                  fit: BoxFit.fill,
                                                                                  height: screens.height * 0.08,
                                                                                  width: screens.width * 0.08,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      // color: Colors.amber,
                                                                      // height: screens.height * 0.08,
                                                                      width: screens
                                                                              .width *
                                                                          0.20,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              tripdetails.data!.tolls![index].tollName.toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: const TextStyle(
                                                                                fontSize: 14,
                                                                                color: MyColor.black,

                                                                                // overflow: TextOverflow.ellipsis,
                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      // color: Colors.amber,
                                                                      // height: screens.height * 0.08,
                                                                      width: screens
                                                                              .width *
                                                                          0.20,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              textAlign: TextAlign.center,
                                                                              tripdetails.data!.tolls![index].amount.toString(),
                                                                              style: const TextStyle(
                                                                                fontSize: 14,
                                                                                color: MyColor.black,

                                                                                // overflow: TextOverflow.ellipsis,
                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),

                                                                    SizedBox(
                                                                      // color: Colors.amber,
                                                                      // height: screens.height * 0.08,
                                                                      width: screens
                                                                              .width *
                                                                          0.17,
                                                                      // c
                                                                    ),
                                                                    // Content below the Divider
                                                                  ],
                                                                ),
                                                                const Divider(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          46,
                                                                          44,
                                                                          44),
                                                                  thickness: 1,
                                                                  indent: 2,
                                                                  endIndent: 2,
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Index == 5
                                          ? Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    // decoration: BoxDecoration(
                                                    //   border: Border.all(
                                                    //       width: 1,
                                                    //       color:
                                                    //           MyColor.greyText),
                                                    //   borderRadius:
                                                    //       const BorderRadius
                                                    //               .all(
                                                    //           Radius.circular(
                                                    //               10)),
                                                    // ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Road Accident",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: MyColor
                                                                      .black,
                                                                  fontFamily:
                                                                      ColorFamily
                                                                          .fontsSFProDisplay,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                // color: Colors.amber,
                                                                // height: screens.height * 0.08,
                                                                width: screens
                                                                        .width *
                                                                    0.20,
                                                                child:
                                                                    const Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "Photos",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: MyColor
                                                                            .greyText,
                                                                        fontFamily:
                                                                            ColorFamily.fontsSFProDisplay,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                // color: Colors.amber,
                                                                // height: screens.height * 0.08,
                                                                // width: screens.width * 0.20,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "Accident Category",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: MyColor
                                                                            .greyText,
                                                                        fontFamily:
                                                                            ColorFamily.fontsSFProDisplay,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                // color: Colors.amber,
                                                                // height: screens.height * 0.08,
                                                                width: screens
                                                                        .width *
                                                                    0.20,
                                                                child:
                                                                    const Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "Cost",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: MyColor
                                                                            .greyText,
                                                                        fontFamily:
                                                                            ColorFamily.fontsSFProDisplay,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                // color: Colors.amber,
                                                                // height: screens.height * 0.08,
                                                                width: screens
                                                                        .width *
                                                                    0.10,
                                                                // child: const Row(
                                                                //   mainAxisAlignment:
                                                                //       MainAxisAlignment.center,
                                                                //   children: [
                                                                //     Text(
                                                                //       "Fuel Station",
                                                                //       style: TextStyle(
                                                                //         fontSize: 14,
                                                                //         color: MyColor.greyText,
                                                                //         fontFamily: ColorFamily
                                                                //             .fontsSFProDisplay,
                                                                //         fontWeight:
                                                                //             FontWeight.w400,
                                                                //       ),
                                                                //     ),
                                                                //   ],
                                                                // ),
                                                              ),
                                                            ],
                                                          ),
                                                          const Divider(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    46,
                                                                    44,
                                                                    44),
                                                            thickness: 1,
                                                            indent: 2,
                                                            endIndent: 2,
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          ListView.builder(
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            itemCount: tripdetails
                                                                .data!
                                                                .roadAccidents!
                                                                .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        2.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                          // color: Colors.amber,
                                                                          width:
                                                                              screens.width * 0.20,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                height: 40,
                                                                                width: 40,
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(width: 1, color: MyColor.button),
                                                                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                                ),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    Navigator.push(
                                                                                      context,
                                                                                      MaterialPageRoute(
                                                                                        builder: (context) => LargeImages(
                                                                                          imagesUrl: tripdetails.data!.roadAccidents![index].image.toString(),
                                                                                          nameProperty: "Road Accident",
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                  child: ClipRRect(
                                                                                    borderRadius: const BorderRadius.all(Radius.circular(09)),
                                                                                    child: CachedNetworkImage(
                                                                                      imageUrl: tripdetails.data!.roadAccidents![index].image.toString(),
                                                                                      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: CircularProgressIndicator(
                                                                                          color: MyColor.button,
                                                                                          value: downloadProgress.progress,
                                                                                        ),
                                                                                      ),
                                                                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                                      fit: BoxFit.fill,
                                                                                      height: screens.height * 0.08,
                                                                                      width: screens.width * 0.08,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          // color: Colors.amber,
                                                                          // height: screens.height * 0.08,
                                                                          width:
                                                                              screens.width * 0.20,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  tripdetails.data!.roadAccidents![index].accidentCategory.toString(),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: const TextStyle(
                                                                                    fontSize: 14,
                                                                                    color: MyColor.black,

                                                                                    // overflow: TextOverflow.ellipsis,
                                                                                    fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          // color: Colors.amber,
                                                                          // height: screens.height * 0.08,
                                                                          width:
                                                                              screens.width * 0.20,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  textAlign: TextAlign.center,
                                                                                  tripdetails.data!.roadAccidents![index].cost.toString(),
                                                                                  style: const TextStyle(
                                                                                    fontSize: 14,
                                                                                    color: MyColor.black,

                                                                                    // overflow: TextOverflow.ellipsis,
                                                                                    fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),

                                                                        SizedBox(
                                                                          // color: Colors.amber,
                                                                          // height: screens.height * 0.08,
                                                                          width:
                                                                              screens.width * 0.10,
                                                                          // c
                                                                        ),
                                                                        // Content below the Divider
                                                                      ],
                                                                    ),
                                                                    const Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "Description",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                MyColor.greyText,
                                                                            fontFamily:
                                                                                ColorFamily.fontsSFProDisplay,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            tripdetails.data!.roadAccidents![index].description.toString(),
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 14,
                                                                              color: MyColor.black,
                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const Divider(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          46,
                                                                          44,
                                                                          44),
                                                                      thickness:
                                                                          1,
                                                                      indent: 2,
                                                                      endIndent:
                                                                          2,
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Index == 6
                                              ? Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        // decoration:
                                                        //     BoxDecoration(
                                                        //   border: Border.all(
                                                        //       width: 1,
                                                        //       color: MyColor
                                                        //           .greyText),
                                                        //   borderRadius:
                                                        //       const BorderRadius
                                                        //               .all(
                                                        //           Radius
                                                        //               .circular(
                                                        //                   10)),
                                                        // ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            children: [
                                                              const Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Fine",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: MyColor
                                                                          .black,
                                                                      fontFamily:
                                                                          ColorFamily
                                                                              .fontsSFProDisplay,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    // color: Colors.amber,
                                                                    // height: screens.height * 0.08,
                                                                    width: screens
                                                                            .width *
                                                                        0.20,
                                                                    child:
                                                                        const Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "Photos",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                MyColor.greyText,
                                                                            fontFamily:
                                                                                ColorFamily.fontsSFProDisplay,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    // color: Colors.amber,
                                                                    // height: screens.height * 0.08,
                                                                    // width: screens.width * 0.20,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "Fine Name",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                MyColor.greyText,
                                                                            fontFamily:
                                                                                ColorFamily.fontsSFProDisplay,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    // color: Colors.amber,
                                                                    // height: screens.height * 0.08,
                                                                    width: screens
                                                                            .width *
                                                                        0.20,
                                                                    child:
                                                                        const Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "Amount",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                MyColor.greyText,
                                                                            fontFamily:
                                                                                ColorFamily.fontsSFProDisplay,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    // color: Colors.amber,
                                                                    // height: screens.height * 0.08,
                                                                    width: screens
                                                                            .width *
                                                                        0.10,
                                                                    // child: const Row(
                                                                    //   mainAxisAlignment:
                                                                    //       MainAxisAlignment.center,
                                                                    //   children: [
                                                                    //     Text(
                                                                    //       "Fuel Station",
                                                                    //       style: TextStyle(
                                                                    //         fontSize: 14,
                                                                    //         color: MyColor.greyText,
                                                                    //         fontFamily: ColorFamily
                                                                    //             .fontsSFProDisplay,
                                                                    //         fontWeight:
                                                                    //             FontWeight.w400,
                                                                    //       ),
                                                                    //     ),
                                                                    //   ],
                                                                    // ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const Divider(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        46,
                                                                        44,
                                                                        44),
                                                                thickness: 1,
                                                                indent: 2,
                                                                endIndent: 2,
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              ListView.builder(
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    tripdetails
                                                                        .data!
                                                                        .fines!
                                                                        .length,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        index) {
                                                                  return Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            SizedBox(
                                                                              // color: Colors.amber,
                                                                              width: screens.width * 0.20,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    height: 40,
                                                                                    width: 40,
                                                                                    decoration: BoxDecoration(
                                                                                      border: Border.all(width: 1, color: MyColor.button),
                                                                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                                    ),
                                                                                    child: InkWell(
                                                                                      onTap: () {
                                                                                        Navigator.push(
                                                                                          context,
                                                                                          MaterialPageRoute(
                                                                                            builder: (context) => LargeImages(
                                                                                              imagesUrl: tripdetails.data!.fines![index].image.toString(),
                                                                                              nameProperty: "Fine",
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: const BorderRadius.all(Radius.circular(09)),
                                                                                        child: CachedNetworkImage(
                                                                                          imageUrl: tripdetails.data!.fines![index].image.toString(),
                                                                                          progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: CircularProgressIndicator(
                                                                                              color: MyColor.button,
                                                                                              value: downloadProgress.progress,
                                                                                            ),
                                                                                          ),
                                                                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                                          fit: BoxFit.fill,
                                                                                          height: screens.height * 0.08,
                                                                                          width: screens.width * 0.08,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              // color: Colors.amber,
                                                                              // height: screens.height * 0.08,
                                                                              width: screens.width * 0.20,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      tripdetails.data!.fines![index].name.toString(),
                                                                                      textAlign: TextAlign.center,
                                                                                      style: const TextStyle(
                                                                                        fontSize: 14,
                                                                                        color: MyColor.black,

                                                                                        // overflow: TextOverflow.ellipsis,
                                                                                        fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              // color: Colors.amber,
                                                                              // height: screens.height * 0.08,
                                                                              width: screens.width * 0.20,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      textAlign: TextAlign.center,
                                                                                      tripdetails.data!.fines![index].amount.toString(),
                                                                                      style: const TextStyle(
                                                                                        fontSize: 14,
                                                                                        color: MyColor.black,

                                                                                        // overflow: TextOverflow.ellipsis,
                                                                                        fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),

                                                                            SizedBox(
                                                                              // color: Colors.amber,
                                                                              // height: screens.height * 0.08,
                                                                              width: screens.width * 0.10,
                                                                              // c
                                                                            ),
                                                                            // Content below the Divider
                                                                          ],
                                                                        ),
                                                                        const Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Description",
                                                                              style: TextStyle(
                                                                                fontSize: 14,
                                                                                color: MyColor.greyText,
                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                tripdetails.data!.fines![index].description.toString(),
                                                                                style: const TextStyle(
                                                                                  fontSize: 14,
                                                                                  color: MyColor.black,
                                                                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                  fontWeight: FontWeight.w400,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const Divider(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              46,
                                                                              44,
                                                                              44),
                                                                          thickness:
                                                                              1,
                                                                          indent:
                                                                              2,
                                                                          endIndent:
                                                                              2,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Index == 7
                                                  ? Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            // decoration:
                                                            //     BoxDecoration(
                                                            //   border: Border.all(
                                                            //       width: 1,
                                                            //       color: MyColor
                                                            //           .greyText),
                                                            //   borderRadius:
                                                            //       const BorderRadius
                                                            //               .all(
                                                            //           Radius.circular(
                                                            //               10)),
                                                            // ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                children: [
                                                                  const Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Other Charges",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              MyColor.black,
                                                                          fontFamily:
                                                                              ColorFamily.fontsSFProDisplay,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SizedBox(
                                                                        // color: Colors.amber,
                                                                        // height: screens.height * 0.08,
                                                                        width: screens.width *
                                                                            0.20,
                                                                        child:
                                                                            const Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              "Photos",
                                                                              style: TextStyle(
                                                                                fontSize: 14,
                                                                                color: MyColor.greyText,
                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        // color: Colors.amber,
                                                                        // height: screens.height * 0.08,
                                                                        // width: screens.width * 0.20,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              "Charge Name",
                                                                              style: TextStyle(
                                                                                fontSize: 14,
                                                                                color: MyColor.greyText,
                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        // color: Colors.amber,
                                                                        // height: screens.height * 0.08,
                                                                        width: screens.width *
                                                                            0.20,
                                                                        child:
                                                                            const Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              "Amount",
                                                                              style: TextStyle(
                                                                                fontSize: 14,
                                                                                color: MyColor.greyText,
                                                                                fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        // color: Colors.amber,
                                                                        // height: screens.height * 0.08,
                                                                        width: screens.width *
                                                                            0.10,
                                                                        // child: const Row(
                                                                        //   mainAxisAlignment:
                                                                        //       MainAxisAlignment.center,
                                                                        //   children: [
                                                                        //     Text(
                                                                        //       "Fuel Station",
                                                                        //       style: TextStyle(
                                                                        //         fontSize: 14,
                                                                        //         color: MyColor.greyText,
                                                                        //         fontFamily: ColorFamily
                                                                        //             .fontsSFProDisplay,
                                                                        //         fontWeight:
                                                                        //             FontWeight.w400,
                                                                        //       ),
                                                                        //     ),
                                                                        //   ],
                                                                        // ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Divider(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            46,
                                                                            44,
                                                                            44),
                                                                    thickness:
                                                                        1,
                                                                    indent: 2,
                                                                    endIndent:
                                                                        2,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  ListView
                                                                      .builder(
                                                                    physics:
                                                                        const NeverScrollableScrollPhysics(),
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemCount: tripdetails
                                                                        .data!
                                                                        .otherCharges!
                                                                        .length,
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                context,
                                                                            index) {
                                                                      return Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(2.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                SizedBox(
                                                                                  // color: Colors.amber,
                                                                                  width: screens.width * 0.20,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 40,
                                                                                        width: 40,
                                                                                        decoration: BoxDecoration(
                                                                                          border: Border.all(width: 1, color: MyColor.button),
                                                                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                                        ),
                                                                                        child: InkWell(
                                                                                          onTap: () {
                                                                                            Navigator.push(
                                                                                              context,
                                                                                              MaterialPageRoute(
                                                                                                builder: (context) => LargeImages(
                                                                                                  imagesUrl: tripdetails.data!.otherCharges![index].image.toString(),
                                                                                                  nameProperty: "Other Charges",
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                          child: ClipRRect(
                                                                                            borderRadius: const BorderRadius.all(Radius.circular(09)),
                                                                                            child: CachedNetworkImage(
                                                                                              imageUrl: tripdetails.data!.otherCharges![index].image.toString(),
                                                                                              progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: CircularProgressIndicator(
                                                                                                  color: MyColor.button,
                                                                                                  value: downloadProgress.progress,
                                                                                                ),
                                                                                              ),
                                                                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                                              fit: BoxFit.fill,
                                                                                              height: screens.height * 0.08,
                                                                                              width: screens.width * 0.08,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  // color: Colors.amber,
                                                                                  // height: screens.height * 0.08,
                                                                                  width: screens.width * 0.20,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          tripdetails.data!.otherCharges![index].name.toString(),
                                                                                          textAlign: TextAlign.center,
                                                                                          style: const TextStyle(
                                                                                            fontSize: 14,
                                                                                            color: MyColor.black,

                                                                                            // overflow: TextOverflow.ellipsis,
                                                                                            fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                            fontWeight: FontWeight.w400,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  // color: Colors.amber,
                                                                                  // height: screens.height * 0.08,
                                                                                  width: screens.width * 0.20,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          textAlign: TextAlign.center,
                                                                                          tripdetails.data!.otherCharges![index].amount.toString(),
                                                                                          style: const TextStyle(
                                                                                            fontSize: 14,
                                                                                            color: MyColor.black,

                                                                                            // overflow: TextOverflow.ellipsis,
                                                                                            fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                            fontWeight: FontWeight.w400,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),

                                                                                SizedBox(
                                                                                  // color: Colors.amber,
                                                                                  // height: screens.height * 0.08,
                                                                                  width: screens.width * 0.10,
                                                                                  // c
                                                                                ),
                                                                                // Content below the Divider
                                                                              ],
                                                                            ),
                                                                            const Row(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  "Description",
                                                                                  style: TextStyle(
                                                                                    fontSize: 14,
                                                                                    color: MyColor.greyText,
                                                                                    fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    tripdetails.data!.otherCharges![index].description.toString(),
                                                                                    style: const TextStyle(
                                                                                      fontSize: 14,
                                                                                      color: MyColor.black,
                                                                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                      fontWeight: FontWeight.w400,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            const Divider(
                                                                              color: Color.fromARGB(255, 46, 44, 44),
                                                                              thickness: 1,
                                                                              indent: 2,
                                                                              endIndent: 2,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Index == 8
                                                      ? Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                // decoration:
                                                                //     BoxDecoration(
                                                                //   border: Border.all(
                                                                //       width: 1,
                                                                //       color: MyColor
                                                                //           .greyText),
                                                                //   borderRadius: const BorderRadius
                                                                //           .all(
                                                                //       Radius.circular(
                                                                //           10)),
                                                                // ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    children: [
                                                                      const Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "Delivery Information",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              color: MyColor.black,
                                                                              fontFamily: ColorFamily.fontsSFProDisplay,
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          // SizedBox(
                                                                          //   // color: Colors.amber,
                                                                          //   // height: screens.height * 0.08,
                                                                          //   width:
                                                                          //       screens.width * 0.20,
                                                                          //   child:
                                                                          //       const Row(
                                                                          //     mainAxisAlignment: MainAxisAlignment.center,
                                                                          //     children: [
                                                                          //       Text(
                                                                          //         "Photos",
                                                                          //         style: TextStyle(
                                                                          //           fontSize: 14,
                                                                          //           color: MyColor.greyText,
                                                                          //           fontFamily: ColorFamily.fontsSFProDisplay,
                                                                          //           fontWeight: FontWeight.w400,
                                                                          //         ),
                                                                          //       ),
                                                                          //     ],
                                                                          //   ),
                                                                          // ),
                                                                          // const SizedBox(
                                                                          //   // color: Colors.amber,
                                                                          //   // height: screens.height * 0.08,
                                                                          //   // width: screens.width * 0.20,
                                                                          //   child:
                                                                          //       Row(
                                                                          //     mainAxisAlignment: MainAxisAlignment.center,
                                                                          //     children: [
                                                                          //       Text(
                                                                          //         "Charge Name",
                                                                          //         style: TextStyle(
                                                                          //           fontSize: 14,
                                                                          //           color: MyColor.greyText,
                                                                          //           fontFamily: ColorFamily.fontsSFProDisplay,
                                                                          //           fontWeight: FontWeight.w400,
                                                                          //         ),
                                                                          //       ),
                                                                          //     ],
                                                                          //   ),
                                                                          // ),
                                                                          // SizedBox(
                                                                          //   // color: Colors.amber,
                                                                          //   // height: screens.height * 0.08,
                                                                          //   width:
                                                                          //       screens.width * 0.20,
                                                                          //   child:
                                                                          //       const Row(
                                                                          //     mainAxisAlignment: MainAxisAlignment.center,
                                                                          //     children: [
                                                                          //       Text(
                                                                          //         "Amount",
                                                                          //         style: TextStyle(
                                                                          //           fontSize: 14,
                                                                          //           color: MyColor.greyText,
                                                                          //           fontFamily: ColorFamily.fontsSFProDisplay,
                                                                          //           fontWeight: FontWeight.w400,
                                                                          //         ),
                                                                          //       ),
                                                                          //     ],
                                                                          //   ),
                                                                          // ),
                                                                          SizedBox(
                                                                            // color: Colors.amber,
                                                                            // height: screens.height * 0.08,
                                                                            width:
                                                                                screens.width * 0.10,
                                                                            // child: const Row(
                                                                            //   mainAxisAlignment:
                                                                            //       MainAxisAlignment.center,
                                                                            //   children: [
                                                                            //     Text(
                                                                            //       "Fuel Station",
                                                                            //       style: TextStyle(
                                                                            //         fontSize: 14,
                                                                            //         color: MyColor.greyText,
                                                                            //         fontFamily: ColorFamily
                                                                            //             .fontsSFProDisplay,
                                                                            //         fontWeight:
                                                                            //             FontWeight.w400,
                                                                            //       ),
                                                                            //     ),
                                                                            //   ],
                                                                            // ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      ListView
                                                                          .builder(
                                                                        physics:
                                                                            const NeverScrollableScrollPhysics(),
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount: tripdetails
                                                                            .data!
                                                                            .otherCharges!
                                                                            .length,
                                                                        itemBuilder:
                                                                            (BuildContext context,
                                                                                index) {
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(2.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 40,
                                                                                          width: 40,
                                                                                          decoration: BoxDecoration(
                                                                                            border: Border.all(width: 1, color: MyColor.button),
                                                                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                                          ),
                                                                                          child: InkWell(
                                                                                            onTap: () {
                                                                                              Navigator.push(
                                                                                                context,
                                                                                                MaterialPageRoute(
                                                                                                  builder: (context) => LargeImages(
                                                                                                    imagesUrl: tripdetails.data!.otherCharges![index].image.toString(),
                                                                                                    nameProperty: "Delivery Information",
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            child: ClipRRect(
                                                                                              borderRadius: const BorderRadius.all(Radius.circular(09)),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: tripdetails.data!.otherCharges![index].image.toString(),
                                                                                                progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                                  child: CircularProgressIndicator(
                                                                                                    color: MyColor.button,
                                                                                                    value: downloadProgress.progress,
                                                                                                  ),
                                                                                                ),
                                                                                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                                                fit: BoxFit.fill,
                                                                                                height: screens.height * 0.08,
                                                                                                width: screens.width * 0.08,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    // SizedBox(
                                                                                    //   // color: Colors.amber,
                                                                                    //   // height: screens.height * 0.08,
                                                                                    //   width: screens.width * 0.20,
                                                                                    //   child: Row(
                                                                                    //     mainAxisAlignment: MainAxisAlignment.center,
                                                                                    //     children: [
                                                                                    //       Expanded(
                                                                                    //         child: Text(
                                                                                    //           tripdetails.data!.otherCharges![index].name.toString(),
                                                                                    //           textAlign: TextAlign.center,
                                                                                    //           style: const TextStyle(
                                                                                    //             fontSize: 14,
                                                                                    //             color: MyColor.black,

                                                                                    //             // overflow: TextOverflow.ellipsis,
                                                                                    //             fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                    //             fontWeight: FontWeight.w400,
                                                                                    //           ),
                                                                                    //         ),
                                                                                    //       ),
                                                                                    //     ],
                                                                                    //   ),
                                                                                    // ),
                                                                                    // SizedBox(
                                                                                    //   // color: Colors.amber,
                                                                                    //   // height: screens.height * 0.08,
                                                                                    //   width: screens.width * 0.20,
                                                                                    //   child: Row(
                                                                                    //     mainAxisAlignment: MainAxisAlignment.center,
                                                                                    //     children: [
                                                                                    //       Expanded(
                                                                                    //         child: Text(
                                                                                    //           textAlign: TextAlign.center,
                                                                                    //           tripdetails.data!.otherCharges![index].amount.toString(),
                                                                                    //           style: const TextStyle(
                                                                                    //             fontSize: 14,
                                                                                    //             color: MyColor.black,

                                                                                    //             // overflow: TextOverflow.ellipsis,
                                                                                    //             fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                    //             fontWeight: FontWeight.w400,
                                                                                    //           ),
                                                                                    //         ),
                                                                                    //       ),
                                                                                    //     ],
                                                                                    //   ),
                                                                                    // ),

                                                                                    SizedBox(
                                                                                      // color: Colors.amber,
                                                                                      // height: screens.height * 0.08,
                                                                                      width: screens.width * 0.10,
                                                                                      // c
                                                                                    ),
                                                                                    // Content below the Divider
                                                                                  ],
                                                                                ),
                                                                                const Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      "Description",
                                                                                      style: TextStyle(
                                                                                        fontSize: 14,
                                                                                        color: MyColor.greyText,
                                                                                        fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        tripdetails.data!.otherCharges![index].description.toString(),
                                                                                        style: const TextStyle(
                                                                                          fontSize: 14,
                                                                                          color: MyColor.black,
                                                                                          fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                          fontWeight: FontWeight.w400,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                const Divider(
                                                                                  color: Color.fromARGB(255, 46, 44, 44),
                                                                                  thickness: 1,
                                                                                  indent: 2,
                                                                                  endIndent: 2,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Column(
                                                          children: [],
                                                        )
                ],
              ),
            ),
    );
  }

  Future<Tripdetails> tripdetialsGet(
      BuildContext context, String truckId, String tripId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.get(
      Uri.parse(
        "${ApiServer.tripdetailsapi}truck_id=$truckId&trip_id=$tripId",
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "Authorization":
            "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
      },
    );

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    loading1 = true;
    if (jsonResponse['status'] == true) {
      tripdetails = Tripdetails.fromJson(jsonResponse);

      if (tripdetails.data!.status.toString() == "Accepted") {
        setState(() {});
      }
      setState(() {
        loading1 = false;
      });
    } else {
      tripdetails = Tripdetails.fromJson(jsonResponse);
      setState(() {
        loading1 = false;
      });
    }

    return Tripdetails.fromJson(jsonDecode(response.body));
  }
}
