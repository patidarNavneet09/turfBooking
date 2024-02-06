import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/statusresponsemodel.dart';
import 'package:truckmanagement/Model/tripdetailsmodel.dart';
import 'package:truckmanagement/Screens/add_on_diesel.dart';
import 'package:truckmanagement/Screens/delivery_screen.dart';
import 'package:truckmanagement/Screens/end_trip.dart';
import 'package:truckmanagement/Screens/expenstion_type.dart';
import 'package:truckmanagement/Screens/large_images.dart';
import 'package:truckmanagement/Screens/start_trip.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/apiconstant.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/utils/mybuttons.dart';
import 'dart:convert' as convert;

class TripDetials extends StatefulWidget {
  final String? tripId;
  final String? truckId;
  const TripDetials({super.key, this.tripId, this.truckId});

  @override
  State<TripDetials> createState() => _TripDetialsState();
}

class _TripDetialsState extends State<TripDetials> {
  bool loading1 = true;
  String startDate = '';
  String endDate = '';
  int indexbutton = 0;
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => tripdetialsGet(
        context, widget.truckId.toString(), widget.tripId.toString()));
  }

  @override
  void dispose() {
    // Dispose the ScrollController when not needed
    _controller.dispose();
    super.dispose();
  }

  // Method to scroll to a particular position
  void _scrollToPosition() {
    _controller.animateTo(
      410.0, // Replace 200.0 with the desired scroll offset
      duration: const Duration(seconds: 2), // Adjust duration as needed
      curve: Curves.ease, // Adjust curve as needed
    );
  }

  apihit() {
    tripdetialsGet(
        context, widget.truckId.toString(), widget.tripId.toString());
  }

  Tripdetails tripdetails = Tripdetails();
  Statusresponse statusresponse = Statusresponse();
  @override
  Widget build(BuildContext context) {
    var screens = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          "Trip Details",
          style: TextStyle(
            fontSize: 16,
            color: MyColor.appbartext,
            // overflow: TextOverflow.ellipsis,
            fontFamily: ColorFamily.fontsSFProDisplay,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: tripdetails.message.toString() == "Trip not found!"
          ? const Center(child: Text("Trip not found!"))
          : tripdetails.status != true
              ? Center(
                  child: Image.asset("assets/images/gif_loader.gif"),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 10, top: 09, right: 10),
                  child: SingleChildScrollView(
                      controller: _controller,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          tripdetails.data!.endDate.toString(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text(
                              "\$${tripdetails.data!.roadToll.toString()}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: MyColor.black,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            tripdetails.data!.addOnDiesel == null
                                ? Container()
                                : const SizedBox(
                                    height: 12,
                                  ),
                            tripdetails.data!.addOnDiesel == null
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColor.greyText),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 8, left: 8, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Add On Diesel",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: MyColor.black,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Icon(Icons.keyboard_arrow_down)
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: MyColor.button),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      LargeImages(
                                                                        imagesUrl: tripdetails
                                                                            .data!
                                                                            .addOnDiesel!
                                                                            .petrolStationImage
                                                                            .toString(),
                                                                        nameProperty:
                                                                            "Add On Diesel",
                                                                      )));
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  09)),
                                                      child: CachedNetworkImage(
                                                        imageUrl: tripdetails
                                                            .data!
                                                            .addOnDiesel!
                                                            .petrolStationImage
                                                            .toString(),
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    downloadProgress) =>
                                                                Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              CircularProgressIndicator(
                                                            color:
                                                                MyColor.button,
                                                            value:
                                                                downloadProgress
                                                                    .progress,
                                                          ),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                        fit: BoxFit.fill,
                                                        height: screens.height *
                                                            0.08,
                                                        width: screens.width *
                                                            0.08,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    const Text(
                                                      "Quantity",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.greyText,
                                                        // overflow: TextOverflow.ellipsis,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      tripdetails
                                                          .data!
                                                          .addOnDiesel!
                                                          .quantityInLitres
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.black,
                                                        // overflow: TextOverflow.ellipsis,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Text(
                                                      "Unit Price",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.greyText,
                                                        // overflow: TextOverflow.ellipsis,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      "\$${tripdetails.data!.addOnDiesel!.unitPrice.toString()}",
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.black,
                                                        // overflow: TextOverflow.ellipsis,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Text(
                                                      "Fuel Station",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.greyText,
                                                        // overflow: TextOverflow.ellipsis,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      tripdetails
                                                          .data!
                                                          .addOnDiesel!
                                                          .petrolStation
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: MyColor.black,
                                                        // overflow: TextOverflow.ellipsis,
                                                        fontFamily: ColorFamily
                                                            .fontsSFProDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.30,
                                                height: 20,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                            09,
                                                          ),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  09)),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "View",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: MyColor.white,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                            tripdetails.data!.enrouteDiesel == null
                                ? Container()
                                : const SizedBox(
                                    height: 12,
                                  ),
                            tripdetails.data!.enrouteDiesel == null
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColor.greyText),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, left: 8, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Enroute Diesel",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.black,
                                                  // overflow: TextOverflow.ellipsis,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: MyColor.button),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    LargeImages(
                                                                      imagesUrl: tripdetails
                                                                          .data!
                                                                          .enrouteDiesel!
                                                                          .petrolStationImage
                                                                          .toString(),
                                                                      nameProperty:
                                                                          "Enroute Diesel",
                                                                    )));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                09)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: tripdetails
                                                          .data!
                                                          .enrouteDiesel!
                                                          .petrolStationImage
                                                          .toString(),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: MyColor.button,
                                                          value:
                                                              downloadProgress
                                                                  .progress,
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.fill,
                                                      height:
                                                          screens.height * 0.08,
                                                      width:
                                                          screens.width * 0.08,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Quantity",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    tripdetails.data!
                                                        .enrouteDiesel!.quantity
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Unit Price",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${tripdetails.data!.enrouteDiesel!.unitPrice.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Fuel Station",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    tripdetails
                                                        .data!
                                                        .enrouteDiesel!
                                                        .petrolStation
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.30,
                                              height: 20,
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
                                                      09,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(09)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: MyColor.white,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                            tripdetails.data!.repairs.toString() == "null"
                                ? Container()
                                : const SizedBox(
                                    height: 12,
                                  ),
                            tripdetails.data!.repairs.toString() == "null"
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColor.greyText),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, left: 8, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Repairs",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.black,
                                                  // overflow: TextOverflow.ellipsis,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: MyColor.button),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    LargeImages(
                                                                      imagesUrl: tripdetails
                                                                          .data!
                                                                          .repairs!
                                                                          .uploadBill
                                                                          .toString(),
                                                                      nameProperty:
                                                                          "Repairs",
                                                                    )));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                09)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: tripdetails
                                                          .data!
                                                          .repairs!
                                                          .uploadBill
                                                          .toString(),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: MyColor.button,
                                                          value:
                                                              downloadProgress
                                                                  .progress,
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.fill,
                                                      height:
                                                          screens.height * 0.08,
                                                      width:
                                                          screens.width * 0.08,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Shop Name",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    tripdetails
                                                        .data!.repairs!.shopName
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    "Spare Name",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    tripdetails.data!.repairs!
                                                        .spareName
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Repair Name",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    tripdetails.data!.repairs!
                                                        .repairName
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    "Spare Cost",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${tripdetails.data!.repairs!.spareCost.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Repair Cost",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${tripdetails.data!.repairs!.repairCost.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    "Total Amount",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${tripdetails.data!.repairs!.totalAmount.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.30,
                                              height: 20,
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
                                                      09,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(09)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: MyColor.white,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                            tripdetails.data!.repairs.toString() == "null"
                                ? Container()
                                : const SizedBox(
                                    height: 12,
                                  ),
                            tripdetails.data!.tolls.toString() == "null"
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColor.greyText),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, left: 8, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Tolls",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.black,
                                                  // overflow: TextOverflow.ellipsis,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: MyColor.button),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    LargeImages(
                                                                      imagesUrl: tripdetails
                                                                          .data!
                                                                          .tolls!
                                                                          .tollImage
                                                                          .toString(),
                                                                      nameProperty:
                                                                          "Tolls",
                                                                    )));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                09)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: tripdetails
                                                          .data!
                                                          .tolls!
                                                          .tollImage
                                                          .toString(),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: MyColor.button,
                                                          value:
                                                              downloadProgress
                                                                  .progress,
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.fill,
                                                      height:
                                                          screens.height * 0.08,
                                                      width:
                                                          screens.width * 0.08,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Toll Name",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    tripdetails
                                                        .data!.tolls!.tollName
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Amount",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${tripdetails.data!.tolls!.amount.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.23,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.30,
                                              height: 20,
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
                                                      09,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(09)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: MyColor.white,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                            tripdetails.data!.tolls.toString() == "null"
                                ? Container()
                                : const SizedBox(
                                    height: 12,
                                  ),
                            tripdetails.data!.roadAccident.toString() == "null"
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColor.greyText),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, left: 8, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Road Accident",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.black,
                                                  // overflow: TextOverflow.ellipsis,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8, bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: MyColor.button),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    LargeImages(
                                                                      imagesUrl: tripdetails
                                                                          .data!
                                                                          .roadAccident!
                                                                          .image
                                                                          .toString(),
                                                                      nameProperty:
                                                                          "Road Accident",
                                                                    )));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                09)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: tripdetails
                                                          .data!
                                                          .roadAccident!
                                                          .image
                                                          .toString(),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: MyColor.button,
                                                          value:
                                                              downloadProgress
                                                                  .progress,
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.fill,
                                                      height:
                                                          screens.height * 0.08,
                                                      width:
                                                          screens.width * 0.08,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Accident Category",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    tripdetails
                                                        .data!
                                                        .roadAccident!
                                                        .accidentCategory
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Cost",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${tripdetails.data!.roadAccident!.cost.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.23,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 08,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(
                                            "Description",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: MyColor.greyText,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 08,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(
                                            tripdetails
                                                .data!.roadAccident!.description
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
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.30,
                                              height: 20,
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
                                                      09,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(09)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: MyColor.white,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                            tripdetails.data!.roadAccident.toString() == "null"
                                ? Container()
                                : const SizedBox(
                                    height: 12,
                                  ),
                            tripdetails.data!.fine.toString() == "null"
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColor.greyText),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, left: 8, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Fine",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.black,
                                                  // overflow: TextOverflow.ellipsis,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: MyColor.button),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    LargeImages(
                                                                      imagesUrl: tripdetails
                                                                          .data!
                                                                          .fine!
                                                                          .image
                                                                          .toString(),
                                                                      nameProperty:
                                                                          "Fine",
                                                                    )));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                09)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: tripdetails
                                                          .data!.fine!.image
                                                          .toString(),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: MyColor.button,
                                                          value:
                                                              downloadProgress
                                                                  .progress,
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.fill,
                                                      height:
                                                          screens.height * 0.08,
                                                      width:
                                                          screens.width * 0.08,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Fine Name",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    tripdetails.data!.fine!.name
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Cost",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${tripdetails.data!.fine!.amount.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.23,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            "Description",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: MyColor.greyText,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 05,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(
                                            tripdetails.data!.fine!.description
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
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.30,
                                              height: 20,
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
                                                      09,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(09)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: MyColor.white,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                            tripdetails.data!.fine.toString() == "null"
                                ? Container()
                                : const SizedBox(
                                    height: 12,
                                  ),
                            tripdetails.data!.otherCharges.toString() == "null"
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColor.greyText),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, left: 8, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Other Charges",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.black,
                                                  // overflow: TextOverflow.ellipsis,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: MyColor.button),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    LargeImages(
                                                                      imagesUrl: tripdetails
                                                                          .data!
                                                                          .otherCharges!
                                                                          .image
                                                                          .toString(),
                                                                      nameProperty:
                                                                          "Other Charges",
                                                                    )));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                09)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: tripdetails
                                                          .data!
                                                          .otherCharges!
                                                          .image
                                                          .toString(),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: MyColor.button,
                                                          value:
                                                              downloadProgress
                                                                  .progress,
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.fill,
                                                      height:
                                                          screens.height * 0.08,
                                                      width:
                                                          screens.width * 0.08,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Charge Name",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    tripdetails.data!
                                                        .otherCharges!.name
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Cost",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${tripdetails.data!.otherCharges!.amount.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.black,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.23,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(
                                            "Description",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: MyColor.greyText,
                                              // overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 02,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(
                                            tripdetails
                                                .data!.otherCharges!.description
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
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.30,
                                              height: 20,
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
                                                      09,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(09)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: MyColor.white,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                            const SizedBox(
                              height: 12,
                            ),
                            tripdetails.data!.deliveryInformation.toString() ==
                                    "null"
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColor.greyText),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8, top: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Delivery Information",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.black,
                                                  // overflow: TextOverflow.ellipsis,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8, bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: MyColor.button),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    LargeImages(
                                                                      imagesUrl: tripdetails
                                                                          .data!
                                                                          .deliveryInformation!
                                                                          .image
                                                                          .toString(),
                                                                      nameProperty:
                                                                          "Delivery Information",
                                                                    )));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                09)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: tripdetails
                                                          .data!
                                                          .deliveryInformation!
                                                          .image
                                                          .toString(),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: MyColor.button,
                                                          value:
                                                              downloadProgress
                                                                  .progress,
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.fill,
                                                      height:
                                                          screens.height * 0.08,
                                                      width:
                                                          screens.width * 0.08,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Description",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: MyColor.greyText,
                                                      // overflow: TextOverflow.ellipsis,
                                                      fontFamily: ColorFamily
                                                          .fontsSFProDisplay,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.70,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            tripdetails
                                                                .data!
                                                                .deliveryInformation!
                                                                .deliveryNote
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  MyColor.black,
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
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.30,
                                              height: 20,
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
                                                      09,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(09)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: MyColor.white,
                                                    // overflow: TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsSFProDisplay,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                            const SizedBox(
                              height: 12,
                            ),
                            tripdetails.data!.endTripDetail.toString() == "null"
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: MyColor.greyText),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8, top: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "End Trip Detail",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: MyColor.black,
                                                  // overflow: TextOverflow.ellipsis,
                                                  fontFamily: ColorFamily
                                                      .fontsSFProDisplay,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 0,
                                              bottom: 0,
                                              top: 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color:
                                                                MyColor.button),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10)),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          LargeImages(
                                                                            imagesUrl:
                                                                                tripdetails.data!.endTripDetail!.dieselMeterImage.toString(),
                                                                            nameProperty:
                                                                                "Delivery Information",
                                                                          )));
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          09)),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: tripdetails
                                                                .data!
                                                                .endTripDetail!
                                                                .dieselMeterImage
                                                                .toString(),
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: MyColor
                                                                    .button,
                                                                value:
                                                                    downloadProgress
                                                                        .progress,
                                                              ),
                                                            ),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Icon(Icons
                                                                    .error),
                                                            fit: BoxFit.fill,
                                                            height:
                                                                screens.height *
                                                                    0.08,
                                                            width:
                                                                screens.width *
                                                                    0.08,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color:
                                                              MyColor.button),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        LargeImages(
                                                                          imagesUrl: tripdetails
                                                                              .data!
                                                                              .endTripDetail!
                                                                              .odometerImage
                                                                              .toString(),
                                                                          nameProperty:
                                                                              "Delivery Information",
                                                                        )));
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    09)),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: tripdetails
                                                              .data!
                                                              .endTripDetail!
                                                              .odometerImage
                                                              .toString(),
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      downloadProgress) =>
                                                                  Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: MyColor
                                                                  .button,
                                                              value:
                                                                  downloadProgress
                                                                      .progress,
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                          fit: BoxFit.fill,
                                                          height:
                                                              screens.height *
                                                                  0.08,
                                                          width: screens.width *
                                                              0.08,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.30,
                                                    height: 20,
                                                    decoration:
                                                        const BoxDecoration(
                                                      // color: MyColor.Red_color,
                                                      gradient: LinearGradient(
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
                                                                09,
                                                              ),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          09)),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "View",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: MyColor.white,
                                                          // overflow: TextOverflow.ellipsis,
                                                          fontFamily: ColorFamily
                                                              .fontsSFProDisplay,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            tripdetails.data!.isStatus.toString() == "Accepted"
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppButton(
                                            color: indexbutton == 1
                                                ? const Color(0xffD9D9D9)
                                                : MyColor.transparent,
                                            textStyle: const TextStyle(
                                              color: MyColor.white,
                                              fontSize: 16,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            btnWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            btnHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            onPressed: () {
                                              if (indexbutton != 1) {
                                                acceptApi(
                                                    context,
                                                    "Accepted",
                                                    tripdetails.data!.id
                                                        .toString());
                                              }

                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) => const StartTrip()));

                                              setState(() {});
                                            },
                                            name: "Accept"),
                                      ],
                                    ),
                                  )
                                : Container(),
                            indexbutton == 1 &&
                                    tripdetails.data!.isStatus.toString() ==
                                        "Accepted"
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppButton(
                                            textStyle: const TextStyle(
                                              color: MyColor.white,
                                              fontSize: 16,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            btnWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            btnHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            onPressed: () {
                                              // acceptApi(context, "On the way",
                                              //     tripdetails.data!.id.toString());

                                              // indexbutton = 1;
                                              Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              StartTrip(
                                                                  tripId: widget
                                                                      .tripId,
                                                                  truckId: widget
                                                                      .truckId)))
                                                  .then((value) => apihit());

                                              setState(() {});
                                            },
                                            name: "Start Trip"),
                                      ],
                                    ),
                                  )
                                : Container(),
                            tripdetails.data!.addOnDiesel.toString() == 'null'
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppButton(
                                            textStyle: const TextStyle(
                                              color: MyColor.white,
                                              fontSize: 16,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            btnWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            onPressed: () {
                                              Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddOnDieselscreen(
                                                                  tripId: widget
                                                                      .tripId,
                                                                  truckId: widget
                                                                      .truckId)))
                                                  .then((value) => apihit());
                                            },
                                            name: "Add On Diesel"),
                                      ],
                                    ),
                                  )
                                : Container(),
                            tripdetails.data!.isStatus.toString() !=
                                        "Accepted" &&
                                    tripdetails.data!.endTripDetail
                                            .toString() ==
                                        "null"
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: tripdetails.data!.addOnDiesel
                                                    .toString() ==
                                                'null'
                                            ? 10
                                            : 30,
                                        bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppButton(
                                            textStyle: const TextStyle(
                                              color: MyColor.white,
                                              fontSize: 16,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            btnWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            onPressed: () {
                                              Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ExpentionType(
                                                                  tripId: widget
                                                                      .tripId,
                                                                  truckId: widget
                                                                      .truckId)))
                                                  .then((value) => apihit());

                                              setState(() {});
                                            },
                                            name: "Add Expenses"),
                                      ],
                                    ),
                                  )
                                : Container(),
                            tripdetails.data!.otherCharges != null &&
                                    tripdetails.data!.endTripDetail
                                            .toString() ==
                                        "null"
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: tripdetails.data!.otherCharges !=
                                                null
                                            ? 05
                                            : 30,
                                        bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppButton(
                                            textStyle: const TextStyle(
                                              color: MyColor.white,
                                              fontSize: 16,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            btnWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            onPressed: () {
                                              Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DeliveryScreen(
                                                                  tripId: widget
                                                                      .tripId,
                                                                  truckId: widget
                                                                      .truckId)))
                                                  .then((value) => apihit());

                                              setState(() {});
                                            },
                                            name: "Mark as delivered"),
                                      ],
                                    ),
                                  )
                                : Container(),
                            tripdetails.data!.endTripDetail.toString() ==
                                        "null" &&
                                    tripdetails.data!.deliveryInformation
                                            .toString() !=
                                        "null"
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: tripdetails.data!.otherCharges !=
                                                null
                                            ? 05
                                            : 30,
                                        bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppButton(
                                            textStyle: const TextStyle(
                                              color: MyColor.white,
                                              fontSize: 16,
                                              fontFamily:
                                                  ColorFamily.fontsSFProDisplay,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            btnWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            onPressed: () {
                                              Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EndTrip(
                                                                  tripId: widget
                                                                      .tripId,
                                                                  truckId: widget
                                                                      .truckId)))
                                                  .then((value) => apihit());

                                              setState(() {});
                                            },
                                            name: "End Trip"),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ]))),
    );
  }

  Future<Tripdetails> tripdetialsGet(
      BuildContext context, String truckId, String tripId) async {
    // Utility.progressloadingDialog(context, true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.get(
        Uri.parse(
            "${ApiServer.tripdetailsapi}truck_id=$truckId&trip_id=$tripId"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization":
              "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    loading1 = true;
    if (jsonResponse['status'] == true) {
      tripdetails = Tripdetails.fromJson(jsonResponse);

      if (tripdetails.data!.status.toString() == "Accepted") {
        indexbutton = 1;

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

  Future<Statusresponse> acceptApi(
    BuildContext context,
    String? status,
    String? tripId,
  ) async {
    var request = {};
    request['status'] = status;
    request['trip_id'] = tripId;

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(
        logLevel: LogLevel.BODY,
      ),
    ]);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(ApiServer.tripaccept),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization":
              "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    if (jsonResponse['status'] == true) {
      statusresponse = Statusresponse.fromJson(jsonResponse);
      if (indexbutton == 0) {
        _scrollToPosition();
      }
      debugPrint("statusresponse.data!.status${statusresponse.data!.status}");
      if (statusresponse.data!.status == "Accepted" && context.mounted) {
        debugPrint("DAta");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StartTrip()));
      }
      indexbutton = 1;
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: jsonResponse['message']);
    }

    return Statusresponse.fromJson(jsonDecode(response.body));
  }
}
