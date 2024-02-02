import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/tripdetailsmodel.dart';
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
      200.0, // Replace 200.0 with the desired scroll offset
      duration: const Duration(milliseconds: 900), // Adjust duration as needed
      curve: Curves.linear, // Adjust curve as needed
    );
  }

  Tripdetails tripdetails = Tripdetails();
  @override
  Widget build(BuildContext context) {
    print(tripdetails.message.toString());
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      // startDate == "" ? "25/01/2024" : startDate,
                                      tripdetails.data!.startDate.toString(),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      // endDate == "" ? "30/01/2024" : endDate,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        const Text(
                          "Box Truck",
                          style: TextStyle(
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
                        Text(
                          tripdetails.data!.truck.toString(),
                          style: const TextStyle(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 155, bottom: 15),
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
                                  btnWidth:
                                      MediaQuery.of(context).size.width * 0.90,
                                  btnHeight:
                                      MediaQuery.of(context).size.height * 0.07,
                                  onPressed: () {
                                    if (indexbutton == 0) {
                                      _scrollToPosition();
                                    }
                                    indexbutton = 1;
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => const StartTrip()));

                                    setState(() {});
                                  },
                                  name: "Accept"),
                            ],
                          ),
                        ),
                        indexbutton == 1
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 15),
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
                                        btnHeight:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        onPressed: () {
                                          indexbutton = 1;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const StartTrip()));

                                          setState(() {});
                                        },
                                        name: "Start Trip"),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
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
