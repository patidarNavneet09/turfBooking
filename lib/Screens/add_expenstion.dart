import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/statusresponsemodel.dart';
import 'package:truckmanagement/Model/tripdetailsmodel.dart';
import 'package:truckmanagement/Screens/delivery_screen.dart';
import 'package:truckmanagement/Screens/expenstion_type.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/apiconstant.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/utils/mybuttons.dart';
import 'dart:convert' as convert;

class AddExpension extends StatefulWidget {
  final String? tripId;
  final String? truckId;
  const AddExpension({super.key, this.tripId, this.truckId});

  @override
  State<AddExpension> createState() => _AddExpensionState();
}

class _AddExpensionState extends State<AddExpension> {
  String startDate = '';
  String endDate = '';
  int indexbutton = 0;
  bool loading1 = true;

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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 09, right: 10),
        child: SingleChildScrollView(
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
              const Text(
                "Indore to Bhopal",
                style: TextStyle(
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
                          DateTime? pickedDate;
                          pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            //pickedDate output format => 2021-03-10 00:00:00.000
                            startDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            setState(() {});
                            //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement
                          } else {}
                        },
                        child: SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset("assets/images/calender.png")),
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
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 04,
                          ),
                          Text(
                            startDate == "" ? "25/01/2024" : startDate,
                            style: const TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                          DateTime? pickedDate;
                          pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            //pickedDate output format => 2021-03-10 00:00:00.000
                            endDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            setState(() {});
                            //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement
                          } else {}
                          setState(() {});
                        },
                        child: SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset("assets/images/calender.png")),
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
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 04,
                          ),
                          Text(
                            endDate == "" ? "30/01/2024" : endDate,
                            style: const TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                          child: Image.asset("assets/images/calender.png")),
                      SizedBox(
                        width: screens.width * 0.05,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Loading Location",
                            style: TextStyle(
                              fontSize: 12,
                              color: MyColor.greyText,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 04,
                          ),
                          Text(
                            "Indore",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                          child: Image.asset("assets/images/calender.png")),
                      SizedBox(
                        width: screens.width * 0.05,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Offloading Location",
                            style: TextStyle(
                              fontSize: 12,
                              color: MyColor.greyText,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 04,
                          ),
                          Text(
                            "Bhopal",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
              const Text(
                "General Cargo",
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
              const Text(
                "125 KG",
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
              const Text(
                "120 Liters",
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
              const Text(
                "\$${44}",
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
              const Text(
                "\$${50}",
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
              const Text(
                "\$${250}",
                style: TextStyle(
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8, left: 8, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add On Diesel",
                              style: TextStyle(
                                fontSize: 14,
                                color: MyColor.black,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
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
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: MyColor.button),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Image.asset("assets/images/demometer.png"),
                            ),
                            const Column(
                              children: [
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: MyColor.greyText,
                                    // overflow: TextOverflow.ellipsis,
                                    fontFamily: ColorFamily.fontsSFProDisplay,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "120 Liters",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: MyColor.black,
                                    // overflow: TextOverflow.ellipsis,
                                    fontFamily: ColorFamily.fontsSFProDisplay,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Text(
                                  "Unit Price",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: MyColor.greyText,
                                    // overflow: TextOverflow.ellipsis,
                                    fontFamily: ColorFamily.fontsSFProDisplay,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "\$${80}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: MyColor.black,
                                    // overflow: TextOverflow.ellipsis,
                                    fontFamily: ColorFamily.fontsSFProDisplay,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Text(
                                  "Fuel Station",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: MyColor.greyText,
                                    // overflow: TextOverflow.ellipsis,
                                    fontFamily: ColorFamily.fontsSFProDisplay,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Essar",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: MyColor.black,
                                    // overflow: TextOverflow.ellipsis,
                                    fontFamily: ColorFamily.fontsSFProDisplay,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.30,
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
                                  bottomRight: Radius.circular(09)),
                            ),
                            child: const Center(
                              child: Text(
                                "View",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: MyColor.white,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
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
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Enroute Diesel",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: MyColor.button),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset("assets/images/demometer.png"),
                          ),
                          const Column(
                            children: [
                              Text(
                                "Quantity",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "120 Liters",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "Unit Price",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${80}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "Fuel Station",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Essar",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
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
                                bottomRight: Radius.circular(09)),
                          ),
                          child: const Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 12,
                                color: MyColor.white,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Repairs",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: MyColor.button),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset("assets/images/demometer.png"),
                          ),
                          const Column(
                            children: [
                              Text(
                                "Shop Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Abc",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Spare Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Fuel Injector",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "Repair Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Engine",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Spare Cost",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${15}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "Repair Cost",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${20}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Total Amount",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${35}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
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
                                bottomRight: Radius.circular(09)),
                          ),
                          child: const Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 12,
                                color: MyColor.white,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tolls",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: MyColor.button),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset("assets/images/demometer.png"),
                          ),
                          const Column(
                            children: [
                              Text(
                                "Toll Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Roadway",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "Amount",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${80}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
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
                                bottomRight: Radius.circular(09)),
                          ),
                          child: const Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 12,
                                color: MyColor.white,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Road Accident",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: MyColor.button),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset("assets/images/demometer.png"),
                          ),
                          const Column(
                            children: [
                              Text(
                                "Accident Category",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Minor",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "Cost",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${80}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 14,
                          color: MyColor.greyText,
                          // overflow: TextOverflow.ellipsis,
                          fontFamily: ColorFamily.fontsSFProDisplay,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 08,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(
                          fontSize: 14,
                          color: MyColor.black,
                          // overflow: TextOverflow.ellipsis,
                          fontFamily: ColorFamily.fontsSFProDisplay,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
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
                                bottomRight: Radius.circular(09)),
                          ),
                          child: const Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 12,
                                color: MyColor.white,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fine",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: MyColor.button),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset("assets/images/demometer.png"),
                          ),
                          const Column(
                            children: [
                              Text(
                                "Fine Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Red Light",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "Cost",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${80}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23,
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
                          fontFamily: ColorFamily.fontsSFProDisplay,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 08,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(
                          fontSize: 14,
                          color: MyColor.black,
                          // overflow: TextOverflow.ellipsis,
                          fontFamily: ColorFamily.fontsSFProDisplay,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
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
                                bottomRight: Radius.circular(09)),
                          ),
                          child: const Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 12,
                                color: MyColor.white,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other Charges",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: MyColor.button),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset("assets/images/demometer.png"),
                          ),
                          const Column(
                            children: [
                              Text(
                                "Charge Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "PUC",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "Cost",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${80}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.black,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 14,
                          color: MyColor.greyText,
                          // overflow: TextOverflow.ellipsis,
                          fontFamily: ColorFamily.fontsSFProDisplay,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 08,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(
                          fontSize: 14,
                          color: MyColor.black,
                          // overflow: TextOverflow.ellipsis,
                          fontFamily: ColorFamily.fontsSFProDisplay,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
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
                                bottomRight: Radius.circular(09)),
                          ),
                          child: const Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 12,
                                color: MyColor.white,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Information",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: MyColor.button),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset("assets/images/demometer.png"),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.greyText,
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: ColorFamily.fontsSFProDisplay,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: MyColor.black,
                                          // overflow: TextOverflow.ellipsis,
                                          fontFamily:
                                              ColorFamily.fontsSFProDisplay,
                                          fontWeight: FontWeight.w400,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
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
                                bottomRight: Radius.circular(09)),
                          ),
                          child: const Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 12,
                                color: MyColor.white,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "End Trip Detail",
                            style: TextStyle(
                              fontSize: 14,
                              color: MyColor.black,
                              // overflow: TextOverflow.ellipsis,
                              fontFamily: ColorFamily.fontsSFProDisplay,
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
                          left: 8, right: 8, bottom: 2, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: MyColor.button),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Image.asset("assets/images/demometer.png"),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: MyColor.button),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset("assets/images/demometer.png"),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
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
                                bottomRight: Radius.circular(09)),
                          ),
                          child: const Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 12,
                                color: MyColor.white,
                                // overflow: TextOverflow.ellipsis,
                                fontFamily: ColorFamily.fontsSFProDisplay,
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
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
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
                                  builder: (context) => const ExpentionType()));

                          setState(() {});
                        },
                        name: "Add Expenses"),
                  ],
                ),
              ),
              Padding(
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DeliveryScreen()));

                          setState(() {});
                        },
                        name: "Mark as delivered"),
                  ],
                ),
              ),
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
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const StartTrip()));
      }
      indexbutton = 1;
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: jsonResponse['message']);
    }

    return Statusresponse.fromJson(jsonDecode(response.body));
  }
}
