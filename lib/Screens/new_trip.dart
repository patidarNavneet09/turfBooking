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
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/utils/mybuttons.dart';
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
  Statusresponse statusresponse = Statusresponse();
  bool loading1 = true;
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => tripdetialsGet(
        context, widget.truckId.toString(), widget.tripId.toString()));
  }

  apihit() {
    tripdetialsGet(
        context, widget.truckId.toString(), widget.tripId.toString());
  }

  void _scrollToPosition() {
    _controller.animateTo(
      410.0, // Replace 200.0 with the desired scroll offset
      duration: const Duration(seconds: 2), // Adjust duration as needed
      curve: Curves.ease, // Adjust curve as needed
    );
  }

  @override
  void dispose() {
    // Dispose the ScrollController when not needed
    _controller.dispose();
    super.dispose();
  }

  List tripData = [];
  dynamic indexx = 0;
  int indexbutton = 0;
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
                          child: SizedBox(
                              width: screens.width * 0.10,
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ))),
                      SizedBox(
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
                              indexx = index;
                              debugPrint("Index>>>>>>>>>${indexx.toString()}");
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
      bottomNavigationBar: tripdetails.status != true ? null : button(),
      body: tripdetails.status != true
          ? Center(
              child: Image.asset("assets/images/gif_loader.gif"),
            )
          : SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  tripData.contains("Trip Detail") == true && indexx == 0
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                            // color: Colors.amber,
                                            child: Text(
                                              tripdetails.data!.loadingLocation
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: MyColor.black,
                                                // overflow: TextOverflow.ellipsis,
                                                fontFamily: ColorFamily
                                                    .fontsSFProDisplay,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                            // color: Colors.amber,
                                            child: Text(
                                              tripdetails
                                                  .data!.offloadingLocation
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: MyColor.black,
                                                // overflow: TextOverflow.ellipsis,
                                                fontFamily: ColorFamily
                                                    .fontsSFProDisplay,
                                                fontWeight: FontWeight.w400,
                                              ),
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
                      : indexx ==
                              tripData.indexWhere((element) =>
                                  element.contains("Add On Diesel") &&
                                  tripdetails.data!.addOnDiesels!.isNotEmpty)
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                                                borderRadius:
                                                                    const BorderRadius
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
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: MyColor
                                                                            .button,
                                                                        value: downloadProgress
                                                                            .progress,
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
                                                                  fontSize: 14,
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
                                                                  fontSize: 14,
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
                                                                  fontSize: 14,
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
                              ],
                            )
                          : indexx ==
                                  tripData.indexWhere((element) =>
                                      element.contains("Enroute Diesel") &&
                                      tripdetails
                                          .data!.enrouteDiesels!.isNotEmpty)
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                                          color:
                                                              MyColor.greyText,
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
                                                          color:
                                                              MyColor.greyText,
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
                                                          color:
                                                              MyColor.greyText,
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
                                                          color:
                                                              MyColor.greyText,
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
                                              itemCount: tripdetails
                                                  .data!.enrouteDiesels!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
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
                                                                screens.width *
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
                                                                        color: MyColor
                                                                            .button),
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              LargeImages(
                                                                            imagesUrl:
                                                                                tripdetails.data!.enrouteDiesels![index].petrolStationImage.toString(),
                                                                            nameProperty:
                                                                                "Enroute Diesel",
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
                                                                            .enrouteDiesels![index]
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
                                                                            const Icon(Icons.error),
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        height: screens.height *
                                                                            0.08,
                                                                        width: screens.width *
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
                                                            width:
                                                                screens.width *
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
                                                            width:
                                                                screens.width *
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
                                                            width:
                                                                screens.width *
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
                                  ],
                                )
                              : indexx ==
                                      tripData.indexWhere((element) =>
                                          element.contains("Repairs") &&
                                          tripdetails.data!.repairs!.isNotEmpty)
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      // color: Colors.amber,
                                                      // height: screens.height * 0.08,
                                                      width:
                                                          screens.width * 0.20,
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
                                                      width:
                                                          screens.width * 0.20,
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
                                                            fontFamily: ColorFamily
                                                                .fontsSFProDisplay,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      // color: Colors.amber,
                                                      // height: screens.height * 0.08,
                                                      width:
                                                          screens.width * 0.20,
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
                                                                      height:
                                                                          40,
                                                                      width: 40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            width:
                                                                                1,
                                                                            color:
                                                                                MyColor.button),
                                                                        borderRadius:
                                                                            const BorderRadius.all(Radius.circular(10)),
                                                                      ),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator
                                                                              .push(
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
                                                                            imageUrl:
                                                                                tripdetails.data!.repairs![index].uploadBill.toString(),
                                                                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: CircularProgressIndicator(
                                                                                color: MyColor.button,
                                                                                value: downloadProgress.progress,
                                                                              ),
                                                                            ),
                                                                            errorWidget: (context, url, error) =>
                                                                                const Icon(Icons.error),
                                                                            fit:
                                                                                BoxFit.fill,
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
                                                          width: screens.width *
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
                                                              "Spare Name",
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
                                                        const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Spare Cost",
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
                                                        const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Total Amount",
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
                                                                            border:
                                                                                Border.all(width: 1, color: MyColor.button),
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
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            tripdetails.data!.repairs![index].spareName.toString(),
                                                                            style:
                                                                                const TextStyle(
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
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            tripdetails.data!.repairs![index].spareCost.toString(),
                                                                            style:
                                                                                const TextStyle(
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
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            tripdetails.data!.repairs![index].totalAmount.toString(),
                                                                            style:
                                                                                const TextStyle(
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
                                      ],
                                    )
                                  : indexx ==
                                          tripData.indexWhere((element) =>
                                              element.contains("Tolls") &&
                                              tripdetails
                                                  .data!.tolls!.isNotEmpty)
                                      ? Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                                "Toll Name",
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
                                                                "Amount",
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
                                                        ),
                                                        SizedBox(
                                                          // color: Colors.amber,
                                                          // height: screens.height * 0.08,
                                                          width: screens.width *
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
                                                          .data!.tolls!.length,
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
                                                                            border:
                                                                                Border.all(width: 1, color: MyColor.button),
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
                                                                                    imagesUrl: tripdetails.data!.tolls![index].tollImage.toString(),
                                                                                    nameProperty: "Tolls",
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                ClipRRect(
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
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            tripdetails.data!.tolls![index].tollName.toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                const TextStyle(
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
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            tripdetails.data!.tolls![index].amount.toString(),
                                                                            style:
                                                                                const TextStyle(
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
                                          ],
                                        )
                                      : indexx ==
                                              tripData.indexWhere((element) =>
                                                  element.contains("Road Accident") &&
                                                  tripdetails
                                                      .data!
                                                      .roadAccidents!
                                                      .isNotEmpty)
                                          ? Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                                              style: TextStyle(
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
                                                              width: screens
                                                                      .width *
                                                                  0.20,
                                                              child: const Row(
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
                                                              .roadAccidents!
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
                                                                        width: screens.width *
                                                                            0.20,
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
                                                                        width: screens.width *
                                                                            0.20,
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
                                                                        width: screens.width *
                                                                            0.20,
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
                                                                        width: screens.width *
                                                                            0.10,
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
                                                                          tripdetails
                                                                              .data!
                                                                              .roadAccidents![index]
                                                                              .description
                                                                              .toString(),
                                                                          style:
                                                                              const TextStyle(
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
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : indexx ==
                                                  tripData.indexWhere((element) =>
                                                      element.contains("Fine") &&
                                                      tripdetails.data!.fines!
                                                          .isNotEmpty)
                                              ? Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
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
                                                              shrinkWrap: true,
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
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          SizedBox(
                                                                            // color: Colors.amber,
                                                                            width:
                                                                                screens.width * 0.20,
                                                                            child:
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
                                                                            width:
                                                                                screens.width * 0.20,
                                                                            child:
                                                                                Row(
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
                                                                            width:
                                                                                screens.width * 0.20,
                                                                            child:
                                                                                Row(
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
                                                                            width:
                                                                                screens.width * 0.10,
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
                                                                            style:
                                                                                TextStyle(
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
                                                                            child:
                                                                                Text(
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
                                                  ],
                                                )
                                              : indexx == tripData.indexWhere((element) => element.contains("Other Charges") && tripdetails.data!.otherCharges!.isNotEmpty)
                                                  ? Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                                                                        color: MyColor
                                                                            .black,
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
                                                                      width: screens
                                                                              .width *
                                                                          0.20,
                                                                      child:
                                                                          const Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            "Photos",
                                                                            style:
                                                                                TextStyle(
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
                                                                            style:
                                                                                TextStyle(
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
                                                                      width: screens
                                                                              .width *
                                                                          0.20,
                                                                      child:
                                                                          const Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            "Amount",
                                                                            style:
                                                                                TextStyle(
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
                                                                ListView
                                                                    .builder(
                                                                  physics:
                                                                      const NeverScrollableScrollPhysics(),
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount:
                                                                      tripdetails
                                                                          .data!
                                                                          .otherCharges!
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
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
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
                                                      ],
                                                    )
                                                  : indexx == tripData.indexWhere((element) => element.contains("Delivery Information") && tripdetails.data!.deliveryNote!.isNotEmpty)
                                                      ? Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Column(
                                                                  children: [
                                                                    const Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "Delivery Information",
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
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
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
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                          ],
                                                        )
                                                      : SizedBox(
                                                          height: MediaQuery.of(context).size.height * 0.70,
                                                          child: const Center(
                                                            child:
                                                                Text("No data"),
                                                          )),
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
    tripData.clear();
    if (jsonResponse['status'] == true) {
      tripdetails = Tripdetails.fromJson(jsonResponse);

      if (tripdetails.data!.status.toString() == "Accepted") {
        indexbutton = 1;
        setState(() {});
      }

      // Check if tripdetails.data!.addOnDiesels is not null and not empty

      if (tripdetails.status == true) {
        tripData.add("Trip Detail");
      }
      if (tripdetails.data!.addOnDiesels!.isNotEmpty) {
        tripData.add("Add On Diesel");
      }
      if (tripdetails.data!.enrouteDiesels!.isNotEmpty) {
        tripData.add("Enroute Diesel");
      }

      if (tripdetails.data!.repairs!.isNotEmpty) {
        tripData.add("Repairs");
      }

      if (tripdetails.data!.tolls!.isNotEmpty) {
        tripData.add("Tolls");
      }

      if (tripdetails.data!.roadAccidents!.isNotEmpty) {
        tripData.add("Road Accident");
      }

      if (tripdetails.data!.fines!.isNotEmpty) {
        tripData.add("Fine");
      }

      if (tripdetails.data!.otherCharges!.isNotEmpty) {
        tripData.add("Other Charges");
      }

      if (tripdetails.data!.deliveryNote!.isNotEmpty) {
        tripData.add("Delivery Information");
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
      if (indexbutton == 1) {
        // _scrollToPosition();
      }
      debugPrint("statusresponse.data!.status${statusresponse.data!.status}");
      if (statusresponse.data!.status == "Accepted" && context.mounted) {
        // Navigator.pop(context);
        // debugPrint("DAta");
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const StartTrip()));
        indexbutton = 1;
        setState(() {});
      }
    } else {
      Fluttertoast.showToast(msg: jsonResponse['message']);
    }

    return Statusresponse.fromJson(jsonDecode(response.body));
  }

  button() {
    return tripdetails.data!.addOnDiesels!.isEmpty && indexbutton != 1
        ? Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                    color: indexbutton == 1
                        ? const Color(0xffD9D9D9)
                        : MyColor.transparent,
                    textStyle: const TextStyle(
                      color: MyColor.white,
                      fontSize: 16,
                      fontFamily: ColorFamily.fontsSFProDisplay,
                      fontWeight: FontWeight.w600,
                    ),
                    btnWidth: MediaQuery.of(context).size.width * 0.90,
                    btnHeight: MediaQuery.of(context).size.height * 0.07,
                    onPressed: () {
                      if (indexbutton != 1) {
                        acceptApi(context, "Accepted",
                            tripdetails.data!.id.toString());
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const StartTrip()));
                      indexbutton = 1;
                      setState(() {});
                    },
                    name: tripdetails.data!.status.toString() != "Accepted"
                        ? "Accept"
                        : "Accept"),
              ],
            ),
          )
        : tripdetails.data!.isStatus.toString() == "Accepted" &&
                tripdetails.data!.isStatus.toString() == "Accepted" &&
                tripdetails.data!.addOnDiesels!.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                        textStyle: const TextStyle(
                          color: MyColor.white,
                          fontSize: 16,
                          fontFamily: ColorFamily.fontsSFProDisplay,
                          fontWeight: FontWeight.w600,
                        ),
                        btnWidth: MediaQuery.of(context).size.width * 0.90,
                        btnHeight: MediaQuery.of(context).size.height * 0.07,
                        onPressed: () {
                          // acceptApi(context, "On the way",
                          //     tripdetails.data!.id.toString());

                          // indexbutton = 1;
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StartTrip(
                                          tripId: widget.tripId,
                                          truckId: widget.truckId)))
                              .then((value) => apihit());

                          setState(() {});
                        },
                        name: "Start Trip"),
                  ],
                ),
              )
            : tripdetails.data!.addOnDiesels!.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(
                        top: tripdetails.data!.addOnDiesels!.isEmpty ? 5 : 50,
                        bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                            textStyle: const TextStyle(
                              color: MyColor.white,
                              fontSize: 16,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w600,
                            ),
                            btnWidth: MediaQuery.of(context).size.width * 0.90,
                            onPressed: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddOnDieselscreen(
                                                  tripId: widget.tripId,
                                                  truckId: widget.truckId)))
                                  .then((value) => apihit());
                            },
                            name: "Add On Diesel"),
                      ],
                    ),
                  )
                : tripdetails.data!.isStatus.toString() != "Accepted" &&
                        tripdetails.data!.endTrip!.isEmpty &&
                        tripdetails.data!.deliveryNote!.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(
                            top: tripdetails.data!.addOnDiesels!.isEmpty
                                ? 10
                                : 30,
                            bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppButton(
                                textStyle: const TextStyle(
                                  color: MyColor.white,
                                  fontSize: 16,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w600,
                                ),
                                btnWidth:
                                    MediaQuery.of(context).size.width * 0.90,
                                onPressed: () {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ExpentionType(
                                                      tripId: widget.tripId,
                                                      truckId: widget.truckId)))
                                      .then((value) => apihit());

                                  setState(() {});
                                },
                                name: "Add Expenses"),
                          ],
                        ),
                      )
                    : tripdetails.data!.otherCharges != null &&
                            tripdetails.data!.endTrip!.isEmpty &&
                            tripdetails.data!.deliveryNote!.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: tripdetails.data!.otherCharges != null
                                    ? 05
                                    : 30,
                                bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppButton(
                                    textStyle: const TextStyle(
                                      color: MyColor.white,
                                      fontSize: 16,
                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    btnWidth:
                                        MediaQuery.of(context).size.width *
                                            0.90,
                                    onPressed: () {
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DeliveryScreen(
                                                          tripId: widget.tripId,
                                                          truckId:
                                                              widget.truckId)))
                                          .then((value) => apihit());

                                      setState(() {});
                                    },
                                    name: "Mark as delivered"),
                              ],
                            ),
                          )
                        : tripdetails.data!.endTrip!.isEmpty &&
                                tripdetails.data!.deliveryNote!.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: tripdetails.data!.otherCharges !=
                                                null &&
                                            tripdetails
                                                .data!.deliveryNote!.isEmpty
                                        ? 05
                                        : 30,
                                    bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppButton(
                                        textStyle: const TextStyle(
                                          color: MyColor.white,
                                          fontSize: 16,
                                          fontFamily:
                                              ColorFamily.fontsSFProDisplay,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        btnWidth:
                                            MediaQuery.of(context).size.width *
                                                0.90,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EndTripscr(
                                                          tripId: widget.tripId,
                                                          truckId: widget
                                                              .truckId))).then(
                                              (value) => apihit());

                                          setState(() {});
                                        },
                                        name: "End Trip"),
                                  ],
                                ),
                              )
                            : null;
  }
}
