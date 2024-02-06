import 'package:flutter/material.dart';
import 'package:truckmanagement/Screens/roadaccident.dart';
import 'package:truckmanagement/Screens/enroutediesel.dart';
import 'package:truckmanagement/Screens/fines.dart';
import 'package:truckmanagement/Screens/othercharges.dart';
import 'package:truckmanagement/Screens/repairs.dart';
import 'package:truckmanagement/Screens/tolls.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';

class ExpentionType extends StatefulWidget {
  final String? tripId;
  final String? truckId;
  const ExpentionType({super.key, this.tripId, this.truckId});

  @override
  State<ExpentionType> createState() => _ExpentionTypeState();
}

class _ExpentionTypeState extends State<ExpentionType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          "Select Expenses Type",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnrouteDiesel(
                                  tripId: widget.tripId,
                                  truckId: widget.truckId)));
                    },
                    leading: const Text(
                      "Enroute Diesel ",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColor.black,
                        // overflow: TextOverflow.ellipsis,
                        fontFamily: ColorFamily.fontsSFProDisplay,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RepairsScreen(
                                  tripId: widget.tripId,
                                  truckId: widget.truckId)));
                    },
                    leading: const Text(
                      "Repairs",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColor.black,
                        // overflow: TextOverflow.ellipsis,
                        fontFamily: ColorFamily.fontsSFProDisplay,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TollsScreen(
                                  tripId: widget.tripId,
                                  truckId: widget.truckId)));
                    },
                    leading: const Text(
                      "Tolls",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColor.black,
                        // overflow: TextOverflow.ellipsis,
                        fontFamily: ColorFamily.fontsSFProDisplay,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RoadAccident(
                                  tripId: widget.tripId,
                                  truckId: widget.truckId)));
                    },
                    leading: const Text(
                      "Road Accidents",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColor.black,
                        // overflow: TextOverflow.ellipsis,
                        fontFamily: ColorFamily.fontsSFProDisplay,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FinesScreen()));
                    },
                    leading: const Text(
                      "Fines",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColor.black,
                        // overflow: TextOverflow.ellipsis,
                        fontFamily: ColorFamily.fontsSFProDisplay,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtherCharges()));
                    },
                    leading: const Text(
                      "Other Charges",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColor.black,
                        // overflow: TextOverflow.ellipsis,
                        fontFamily: ColorFamily.fontsSFProDisplay,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
