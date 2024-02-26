import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
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
import 'package:truckmanagement/constant/stringfile.dart';
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

class _NewTripState extends State<NewTrip> with TickerProviderStateMixin {
  Tripdetails tripdetails = Tripdetails();
  Statusresponse statusresponse = Statusresponse();
  bool loading1 = true;
  final ScrollController _controller = ScrollController();
  String btnName = MyString.Accept.tr();

  bool _open = false;

  void toggle() {
    setState(() {
      _open = !_open;
    });
  }

  Animation<double>? animation;
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    // _open = widget.initialOpen ?? false;
    WidgetsBinding.instance.addPostFrameCallback((_) => tripdetialsGet(
        context, widget.truckId.toString(), widget.tripId.toString()));
  }

  apihit() {
    btnName = "";
    setState(() {});
    tripdetialsGet(
        context, widget.truckId.toString(), widget.tripId.toString());
  }

  void scrollToPosition() {
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

  bool isfloating = false;
  List tripData = [];
  dynamic indexx = 0;
  int indexbutton = 0;
  final key = GlobalKey<ExpandableFabState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              MyString.TripDetails.tr(),
                              style: const TextStyle(
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
                      padding: const EdgeInsets.only(left: 15, right: 18),
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
                                        left: 0, right: 3),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 10),
                                          decoration: BoxDecoration(
                                            gradient: indexx != index
                                                ? const LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      MyColor.divider,
                                                      MyColor.divider,
                                                    ],
                                                  )
                                                : const LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      MyColor.button1,
                                                      MyColor.button,
                                                    ],
                                                  ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Text(
                                            tripData[index].toString(),
                                            style: TextStyle(
                                              color: indexx != index
                                                  ? Colors.black
                                                  : MyColor.white,
                                            ),
                                          ),
                                        ),
                                        /* index == 0
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
                                                                                : Container(width: 120, height: 2, color: Colors.black),*/
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

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      //Init Floating Action Bubble
      floatingActionButton: tripdetails.status == true
          ? tripdetails.data!.status.toString() == "Loading" &&
                  tripdetails.data!.isStatus.toString() != "Accepted"
              ? Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  alignment: Alignment.bottomRight,
                  // width:300,
                  child: isfloating == false
                      ? togglebutton(Icons.add)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            /*      Padding(
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
              ),
              SizedBox(height: 10,),*/
                            tripdetails.data!.isStatus.toString() !=
                                        "Delivered" &&
                                    tripdetails.data!.enrouteDiesels!.isEmpty
                                ? AppButton(
                                    textStyle: const TextStyle(
                                      color: MyColor.white,
                                      fontSize: 16,
                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    btnWidth:
                                        MediaQuery.of(context).size.width *
                                            0.60,
                                    onPressed: () {
                                      isfloating = false;
                                      setState(() {});
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddOnDieselscreen(
                                                          tripId: widget.tripId,
                                                          truckId:
                                                              widget.truckId)))
                                          .then((value) => apihit());
                                    },
                                    name: MyString.AddOnDiesel.tr(),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 10,
                            ),
                            tripdetails.data!.isStatus.toString() != "Delivered"
                                ? AppButton(
                                    textStyle: const TextStyle(
                                      color: MyColor.white,
                                      fontSize: 16,
                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    btnWidth:
                                        MediaQuery.of(context).size.width *
                                            0.60,
                                    onPressed: () {
                                      isfloating = false;
                                      setState(() {});
                                      debugPrint(
                                          " tripdetails.data!.isStatus.toString()..........>${tripdetails.data!.isStatus.toString()}");
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ExpentionType(
                                                          tripId: widget.tripId,
                                                          truckId:
                                                              widget.truckId)))
                                          .then((value) => apihit());

                                      setState(() {});
                                    },
                                    name: MyString.AddExpenses.tr(),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 10,
                            ),
                            tripdetails.data!.isStatus.toString() != "Delivered"
                                ? Row(
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
                                                0.60,
                                        onPressed: () {
                                          isfloating = false;
                                          setState(() {});
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DeliveryScreen(
                                                          tripId: widget.tripId,
                                                          truckId: widget
                                                              .truckId))).then(
                                              (value) => apihit());

                                          setState(() {});
                                        },
                                        name: MyString.Markasdelivered.tr(),
                                      ),
                                    ],
                                  )
                                : Container(),
                            tripdetails.data!.isStatus.toString() == "Completed"
                                ? Container()
                                : tripdetails.data!.isStatus.toString() ==
                                        "Delivered"
                                    ? AppButton(
                                        textStyle: const TextStyle(
                                          color: MyColor.white,
                                          fontSize: 16,
                                          fontFamily:
                                              ColorFamily.fontsSFProDisplay,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        btnWidth:
                                            MediaQuery.of(context).size.width *
                                                0.60,
                                        onPressed: () {
                                          isfloating = false;
                                          setState(() {});
                                          debugPrint(
                                              " tripdetails.data!.isStatus.toString()..........>${tripdetails.data!.isStatus.toString()}");
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
                                        name: MyString.EndTrip.tr(),
                                      )
                                    : Container(),
                            const SizedBox(
                              height: 10,
                            ),
                            togglebutton(Icons.clear),
                            const SizedBox(height: 0),
                          ],
                        ),
                )
              : null
          : null,

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
                            children: [
                              /* Row(
                                children: [
                                  Expanded(
                                    child: const Text(
                                      "Trip Name",
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
                                  Expanded(
                                    child: Text(
                                      tripdetails.data!.name.toString(),
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
                                ],
                              ),

                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                height: 1,
                                color: MyColor.greyText,
                              ),
                              SizedBox(
                                height: 8,
                              ),*/

                              rowUi(MyString.TripId.tr(),
                                  tripdetails.data!.tripnumber.toString()),

                              dividerUi(),
                              rowUi(MyString.CustomerName.tr(),
                                  tripdetails.data!.name.toString()),

                              dividerUi(),

                              rowUi(MyString.StartDate.tr(),
                                  tripdetails.data!.startDate.toString()),

                              dividerUi(),

                              /* Row(
                                children: [
                                  Expanded(
                                    child: const Text(
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
                                  ),
                                  Expanded(
                                    child: Text(
                                      // startDate == null ? "25/01/2024" : startDate,
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
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                height: 1,
                                color: MyColor.greyText,
                              ),
                              SizedBox(
                                height: 8,
                              ),*/

                              rowUi(MyString.LoadingLocation.tr(),
                                  tripdetails.data!.loadingLocation.toString()),

                              dividerUi(),

                              /* Row(
                                children: [
                                  Expanded(
                                    child: const Text(
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
                                  ),
                                  Expanded(
                                    child: Text(
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
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                height: 1,
                                color: MyColor.greyText,
                              ),
                              SizedBox(
                                height: 8,
                              ),*/

                              rowUi(
                                  MyString.OffloadingLocation.tr(),
                                  tripdetails.data!.offloadingLocation
                                      .toString()),

                              dividerUi(),
                              /*Row(
                                children: [
                                  Expanded(
                                    child: const Text(
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
                                  ),
                                  Expanded(
                                    child: Text(
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
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                height: 1,
                                color: MyColor.greyText,
                              ),
                              SizedBox(
                                height: 8,
                              ),*/

                              rowUi(MyString.EndDate.tr(),
                                  tripdetails.data!.endDate.toString()),

                              dividerUi(),

                              /*Row(
                                children: [
                                  Expanded(
                                    child: const Text(
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
                                  ),
                                  Expanded(
                                    child: Text(
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
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                height: 1,
                                color: MyColor.greyText,
                              ),
                              SizedBox(
                                height: 8,
                              ),*/

                              rowUi(MyString.CargoType.tr(),
                                  tripdetails.data!.typeOfCargo.toString()),

                              dividerUi(),

                              rowUi(MyString.AssignedTruck.tr(),
                                  tripdetails.data!.truck.toString()),

                              dividerUi(),

                              rowUi(MyString.TruckPlate.tr(),
                                  tripdetails.data!.platenumber.toString()),

                              dividerUi(),

                              rowUi(MyString.WeightOfCargo.tr(),
                                  "${tripdetails.data!.weightOfCargo.toString()} Kg"),

                              dividerUi(),

                              rowUi(MyString.InitialDiesel.tr(),
                                  tripdetails.data!.initialDiesel.toString()),

                              dividerUi(),

                              rowUi(MyString.MileageAllowances.tr(),
                                  "${tripdetails.data!.mileageAllowanceCur.toString()} ${tripdetails.data!.mileageAllowance.toString()}"),

                              dividerUi(),

                              rowUi(MyString.MovementSheet.tr(),
                                  "${tripdetails.data!.movementSheetCurr.toString()} ${tripdetails.data!.movementSheet.toString()}"),

                              dividerUi(),

                              rowUi(MyString.RoadToll.tr(),
                                  "${tripdetails.data!.roadTollCurr.toString()} ${tripdetails.data!.roadToll.toString()}"),

                              const SizedBox(
                                height: 30,
                              )
                              // dividerUi(),
                              //
                              // rowUi("Road Toll","\$${tripdetails.data!.roadToll.toString()}"),
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              MyString.AddOnDiesel.tr(),
                                              style: const TextStyle(
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
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    MyString.Photos.tr(),
                                                    style: const TextStyle(
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
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    MyString.Quantity.tr(),
                                                    style: const TextStyle(
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
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    MyString.UnitPrice.tr(),
                                                    style: const TextStyle(
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
                                              //  width: screens.width * 0.20,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    MyString.FuelStation.tr(),
                                                    style: const TextStyle(
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
                                        dividerUi(),
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
                                                        child: Container(
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
                                                                    .all(Radius
                                                                        .circular(
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
                                                                        .addOnDiesels![
                                                                            index]
                                                                        .petrolStationImage
                                                                        .toString(),
                                                                    nameProperty:
                                                                        MyString.AddOnDiesel
                                                                            .tr(),
                                                                  ),
                                                                ),
                                                              );
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
                                                                    .addOnDiesels![
                                                                        index]
                                                                    .petrolStationImage
                                                                    .toString(),
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            downloadProgress) =>
                                                                        Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
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
                                                                    const Icon(Icons
                                                                        .error),
                                                                fit:
                                                                    BoxFit.fill,
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
                                                      ),

                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
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
                                                                            .addOnDiesels![index]
                                                                            .quantityInLitres
                                                                            .toString(),
                                                                        textAlign:
                                                                            TextAlign.start,
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
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        tripdetails
                                                                            .data!
                                                                            .addOnDiesels![index]
                                                                            .unitPrice
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
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        tripdetails
                                                                            .data!
                                                                            .addOnDiesels![index]
                                                                            .petrolStation
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
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 12,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${MyString.Date.tr()} :",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
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
                                                                          .w600,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                tripdetails
                                                                    .data!
                                                                    .addOnDiesels![
                                                                        index]
                                                                    .date
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
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
                                                                          .w300,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )

                                                      // Content below the Divider
                                                    ],
                                                  ),
                                                  dividerUi()
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  MyString.EnrouteDiesel.tr(),
                                                  style: const TextStyle(
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
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        MyString.Photos.tr(),
                                                        style: const TextStyle(
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
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        MyString.Quantity.tr(),
                                                        style: const TextStyle(
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
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        MyString.UnitPrice.tr(),
                                                        style: const TextStyle(
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
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        MyString.FuelStation
                                                            .tr(),
                                                        style: const TextStyle(
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
                                            dividerUi(),
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
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(10)),
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
                                                                                MyString.EnrouteDiesel.tr(),
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
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
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
                                                      dividerUi()
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      MyString.Repairs.tr(),
                                                      style: const TextStyle(
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
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            MyString.Photos
                                                                .tr(),
                                                            style:
                                                                const TextStyle(
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
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            MyString.ShopName
                                                                .tr(),
                                                            style:
                                                                const TextStyle(
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
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          MyString.RepairName
                                                              .tr(),
                                                          style:
                                                              const TextStyle(
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
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            MyString.RepairCost
                                                                .tr(),
                                                            style:
                                                                const TextStyle(
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
                                                dividerUi(),
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
                                                                        borderRadius: const BorderRadius
                                                                            .all(
                                                                            Radius.circular(10)),
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
                                                                                nameProperty: MyString.Repairs.tr(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius: const BorderRadius
                                                                              .all(
                                                                              Radius.circular(09)),
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
                                                          dividerUi()
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
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                MyString.Photos
                                                                    .tr(),
                                                                style:
                                                                    const TextStyle(
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
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              MyString.SpareName
                                                                  .tr(),
                                                              style:
                                                                  const TextStyle(
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
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              MyString.SpareCost
                                                                  .tr(),
                                                              style:
                                                                  const TextStyle(
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
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              MyString.TotalAmount
                                                                  .tr(),
                                                              style:
                                                                  const TextStyle(
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
                                                    dividerUi(),
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
                                                                                    nameProperty: MyString.Repairs.tr(),
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
                                                              dividerUi()
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
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          MyString.Tolls.tr(),
                                                          style:
                                                              const TextStyle(
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
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                MyString.Photos
                                                                    .tr(),
                                                                style:
                                                                    const TextStyle(
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
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                MyString.TollName
                                                                    .tr(),
                                                                style:
                                                                    const TextStyle(
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
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                MyString.Amount
                                                                    .tr(),
                                                                style:
                                                                    const TextStyle(
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
                                                    dividerUi(),
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
                                                                                    nameProperty: MyString.Tolls.tr(),
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
                                                              dividerUi()
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
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              MyString.RoadAccident
                                                                  .tr(),
                                                              style:
                                                                  const TextStyle(
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
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    MyString.Photos
                                                                        .tr(),
                                                                    style:
                                                                        const TextStyle(
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
                                                              // width: screens.width * 0.20,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    MyString.AccidentCategory
                                                                        .tr(),
                                                                    style:
                                                                        const TextStyle(
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
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    MyString.Cost
                                                                        .tr(),
                                                                    style:
                                                                        const TextStyle(
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
                                                        dividerUi(),
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
                                                                                        nameProperty: MyString.RoadAccident.tr(),
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
                                                                            0.30,
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
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        MyString.Description
                                                                            .tr(),
                                                                        style:
                                                                            const TextStyle(
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
                                                                  dividerUi()
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
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  MyString.Fine
                                                                      .tr(),
                                                                  style:
                                                                      const TextStyle(
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
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        MyString.Photos
                                                                            .tr(),
                                                                        style:
                                                                            const TextStyle(
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
                                                                  // width: screens.width * 0.20,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        MyString.FineName
                                                                            .tr(),
                                                                        style:
                                                                            const TextStyle(
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
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        MyString.Amount
                                                                            .tr(),
                                                                        style:
                                                                            const TextStyle(
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
                                                            dividerUi(),
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
                                                                                            nameProperty: MyString.Fine.tr(),
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
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            MyString.Description.tr(),
                                                                            style:
                                                                                const TextStyle(
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
                                                                      dividerUi()
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
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      MyString.OtherCharges
                                                                          .tr(),
                                                                      style:
                                                                          const TextStyle(
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
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            MyString.Photos.tr(),
                                                                            style:
                                                                                const TextStyle(
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
                                                                      // width: screens.width * 0.20,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            MyString.ChargeName.tr(),
                                                                            style:
                                                                                const TextStyle(
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
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            MyString.Amount.tr(),
                                                                            style:
                                                                                const TextStyle(
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
                                                                dividerUi(),
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
                                                                      padding: const EdgeInsets
                                                                          .all(
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
                                                                                                nameProperty: MyString.OtherCharges.tr(),
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
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                MyString.Description.tr(),
                                                                                style: const TextStyle(
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
                                                                          dividerUi()
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
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          MyString.DeliveryInformation
                                                                              .tr(),
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
                                                                              .deliveryNote!
                                                                              .isNotEmpty
                                                                          ? 1
                                                                          : tripdetails
                                                                              .data!
                                                                              .deliveryNote!
                                                                              .length,
                                                                      itemBuilder:
                                                                          (BuildContext context,
                                                                              index) {
                                                                        return Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              2.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    MyString.Description.tr(),
                                                                                    style: const TextStyle(
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
                                                                                      tripdetails.data!.deliveryNote![index].deliveryNote.toString(),
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

                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              // dividerUi(),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 150,
                                                                                        width: 150,
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
                                                                                                  imagesUrl: tripdetails.data!.deliveryNote![index].image.toString(),
                                                                                                  nameProperty: MyString.DeliveryInformation.tr(),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                          child: ClipRRect(
                                                                                            borderRadius: const BorderRadius.all(Radius.circular(09)),
                                                                                            child: CachedNetworkImage(
                                                                                              imageUrl: tripdetails.data!.deliveryNote![index].image.toString(),
                                                                                              progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: CircularProgressIndicator(
                                                                                                  color: MyColor.button,
                                                                                                  value: downloadProgress.progress,
                                                                                                ),
                                                                                              ),
                                                                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                                              fit: BoxFit.fill,
                                                                                              height: screens.height * 0.2,
                                                                                              width: screens.width * 0.2,
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
                                                                                    width: screens.width * 0.10,
                                                                                  ),
                                                                                ],
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
                                                      : indexx == tripData.indexWhere((element) => element.contains("End Trip") && tripdetails.data!.endTrip!.isNotEmpty)
                                                          ? Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              MyString.EndTrip.tr(),
                                                                              style: const TextStyle(
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
                                                                            SizedBox(
                                                                              // color: Colors.amber,
                                                                              // height: screens.height * 0.08,
                                                                              width: screens.width * 0.40,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    MyString.OdometerImage.tr(),
                                                                                    style: const TextStyle(
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
                                                                              // width: screens.width * 0.20,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    MyString.DieselmeterImage.tr(),
                                                                                    style: const TextStyle(
                                                                                      fontSize: 14,
                                                                                      color: MyColor.greyText,
                                                                                      fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                      fontWeight: FontWeight.w400,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            // SizedBox(
                                                                            //   // color: Colors.amber,
                                                                            //   // height: screens.height * 0.08,
                                                                            //   width: screens.width * 0.20,
                                                                            //   child: const Row(
                                                                            //     mainAxisAlignment: MainAxisAlignment.center,
                                                                            //     children: [
                                                                            //       Text(
                                                                            //         "",
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
                                                                              width: screens.width * 0.10,
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
                                                                        dividerUi(),
                                                                        ListView
                                                                            .builder(
                                                                          physics:
                                                                              const NeverScrollableScrollPhysics(),
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemCount: tripdetails
                                                                              .data!
                                                                              .endTrip!
                                                                              .length,
                                                                          itemBuilder:
                                                                              (BuildContext context, index) {
                                                                            return Padding(
                                                                              padding: const EdgeInsets.all(2.0),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        // color: Colors.amber,
                                                                                        width: screens.width * 0.40,
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
                                                                                                        imagesUrl: tripdetails.data!.endTrip![index].odometerImage.toString(),
                                                                                                        nameProperty: MyString.EndTrip.tr(),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: const BorderRadius.all(Radius.circular(09)),
                                                                                                  child: CachedNetworkImage(
                                                                                                    imageUrl: tripdetails.data!.endTrip![index].odometerImage.toString(),
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
                                                                                        width: screens.width * 0.40,
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
                                                                                                        imagesUrl: tripdetails.data!.endTrip![index].dieselMeterImage.toString(),
                                                                                                        nameProperty: MyString.EndTrip.tr(),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: const BorderRadius.all(Radius.circular(09)),
                                                                                                  child: CachedNetworkImage(
                                                                                                    imageUrl: tripdetails.data!.endTrip![index].dieselMeterImage.toString(),
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
                                                                                        width: screens.width * 0.10,
                                                                                        // c
                                                                                      ),
                                                                                      // Content below the Divider
                                                                                    ],
                                                                                  ),
                                                                                  // const Row(
                                                                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                                                                  //   children: [
                                                                                  //     Text(
                                                                                  //       "Description",
                                                                                  //       style: TextStyle(
                                                                                  //         fontSize: 14,
                                                                                  //         color: MyColor.greyText,
                                                                                  //         fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                  //         fontWeight: FontWeight.w400,
                                                                                  //       ),
                                                                                  //     ),
                                                                                  //   ],
                                                                                  // ),
                                                                                  // Row(
                                                                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                                                                  //   children: [
                                                                                  //     Expanded(
                                                                                  //       child: Text(
                                                                                  //         tripdetails.data!.otherCharges![index].description.toString(),
                                                                                  //         style: const TextStyle(
                                                                                  //           fontSize: 14,
                                                                                  //           color: MyColor.black,
                                                                                  //           fontFamily: ColorFamily.fontsSFProDisplay,
                                                                                  //           fontWeight: FontWeight.w400,
                                                                                  //         ),
                                                                                  //       ),
                                                                                  //     ),
                                                                                  //   ],
                                                                                  // ),
                                                                                  dividerUi()
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
                                                              child: Center(
                                                                child: Text(
                                                                    MyString.NoData
                                                                        .tr()),
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

    debugPrint("jsonResponse.................$jsonResponse");
    loading1 = true;
    tripData.clear();
    if (jsonResponse['status'] == true) {
      tripdetails = Tripdetails.fromJson(jsonResponse);

      if (tripdetails.data!.status.toString() == "Accepted") {
        btnName = "Truck Loading";
        setState(() {});
      }
      if (tripdetails.data!.status.toString() == "Loading") {
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
      if (tripdetails.data!.endTrip!.isNotEmpty) {
        tripData.add("End Trip");
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
      // if (indexbutton == 1) {
      //   btnName = "Loading";
      // }
      debugPrint("statusresponse.data!.status${statusresponse.data!.status}");
      if (statusresponse.data!.status == "Accepted" && context.mounted) {
        debugPrint(
            "status............................${statusresponse.data!.status}");
        btnName = "Truck Loading";
        setState(() {});
      }
      if (statusresponse.data!.status.toString() == "Loading") {
        debugPrint(
            "status 55............................${statusresponse.data!.status}");
        indexbutton = 1;
        btnName = "Start Trip";
        setState(() {});
      } else {
        Fluttertoast.showToast(msg: jsonResponse['message']);
      }
    } else if (jsonResponse['status'] != true) {
      Fluttertoast.showToast(msg: jsonResponse['message']);
    }
    return Statusresponse.fromJson(jsonDecode(response.body));
  }

  button() {
    return tripdetails.data!.addOnDiesels!.isEmpty &&
            indexbutton != 1 &&
            tripdetails.data!.status != "Completed"
        ? Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 15),
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
                        // tripdetails.data!.isStatus.toString() == "Accepted" && tripdetails.data!.status.toString() == "Accepted" && tripdetails.data!.addOnDiesels!.isEmpty && context.mounted
                        if (btnName == "Truck Loading") {
                          acceptApi(context, "Loading",
                              tripdetails.data!.id.toString());
                        } else {
                          acceptApi(context, "Accepted",
                              tripdetails.data!.id.toString());
                        }
                      }
                      // indexbutton = 1;
                      setState(() {});
                    },
                    name: btnName),
              ],
            ),
          )
        :
        /*tripdetails.data!.isStatus.toString() == "Accepted" && tripdetails.data!.status.toString() == "Accepted" &&
    tripdetails.data!.addOnDiesels!.isEmpty
    ?
    Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: AppButton(
          textStyle: const TextStyle(
            color: MyColor.white,
            fontSize: 16,
            fontFamily: ColorFamily.fontsSFProDisplay,
            fontWeight: FontWeight.w600,
          ),
          btnWidth: MediaQuery.of(context).size.width * 0.90,
          btnHeight: MediaQuery.of(context).size.height * 0.07,
          onPressed: () {
            acceptApi(context, "Loading", tripdetails.data!.id.toString());
            setState(() {});
          },
          name: "Loading"),
    )
        : */
        tripdetails.data!.status.toString() != "Loading" &&
                    tripdetails.data!.status != "Completed" &&
                    tripdetails.data!.isStatus.toString() != "On the way" &&
                    tripdetails.data!.addOnDiesels!.isEmpty ||
                tripdetails.data!.addOnDiesels!.isEmpty &&
                    btnName == "Start Trip" &&
                    tripdetails.data!.status != "Completed"
            ? Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: AppButton(
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
              )
            : tripdetails.data!.addOnDiesels!.isEmpty
                ? Visibility(
                    visible: false,
                    child: Padding(
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
                              btnWidth:
                                  MediaQuery.of(context).size.width * 0.90,
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
                    ),
                  )
                : tripdetails.data!.isStatus.toString() != "Accepted" &&
                        tripdetails.data!.endTrip!.isEmpty &&
                        tripdetails.data!.deliveryNote!.isEmpty
                    ? Visibility(
                        visible: false,
                        child: Padding(
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
                                    debugPrint(
                                        " tripdetails.data!.isStatus.toString()..........>${tripdetails.data!.isStatus.toString()}");
                                    /*  Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ExpentionType(
                                                        tripId: widget.tripId,
                                                        truckId: widget.truckId)))
                                        .then((value) => apihit());*/

                                    setState(() {});
                                  },
                                  name: "Add Expenses"),
                            ],
                          ),
                        ),
                      )
                    : tripdetails.data!.otherCharges != null &&
                            tripdetails.data!.endTrip!.isEmpty &&
                            tripdetails.data!.deliveryNote!.isEmpty
                        ? Visibility(
                            visible: false,
                            child: Padding(
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
                                                    DeliveryScreen(
                                                        tripId: widget.tripId,
                                                        truckId: widget
                                                            .truckId))).then(
                                            (value) => apihit());

                                        setState(() {});
                                      },
                                      name: "Mark as delivered"),
                                ],
                              ),
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

  rowUi(String title, String value) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: MyColor.greyText,
                  // overflow: TextOverflow.ellipsis,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Text(
                // "Box Truck",
                value,
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
      ],
    );
  }

  dividerUi() {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Divider(
          height: 1,
          color: MyColor.divider.withOpacity(0.80),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  dividerUi1() {
    return Column(
      children: [
        Divider(
          height: 1,
          color: MyColor.divider.withOpacity(0.80),
        ),
      ],
    );
  }

  togglebutton(IconData icon) {
    return InkWell(
        onTap: () {
          isfloating = !isfloating;
          setState(() {});
        },
        child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    MyColor.button1,
                    MyColor.button,
                  ],
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Icon(
              icon,
              color: Colors.white,
            )));
  }
}
