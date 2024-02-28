import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:truckmanagement/Screens/road_accident.dart';
import 'package:truckmanagement/Screens/enroute_diesel.dart';
import 'package:truckmanagement/Screens/fines.dart';
import 'package:truckmanagement/Screens/other_charges.dart';
import 'package:truckmanagement/Screens/repairs.dart';
import 'package:truckmanagement/Screens/tolls.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/constant/stringfile.dart';

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
        title: Text(
          MyString.selectExpensesType.tr(),
          style: const TextStyle(
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
                    leading: Text(
                      MyString.enrouteDiesel.tr(),
                      style: const TextStyle(
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
                    leading: Text(
                      MyString.repairs.tr(),
                      style: const TextStyle(
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
                    leading: Text(
                      MyString.tolls.tr(),
                      style: const TextStyle(
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
                    leading: Text(
                      MyString.roadAccidents.tr(),
                      style: const TextStyle(
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
                              builder: (context) => FinesScreen(
                                  tripId: widget.tripId,
                                  truckId: widget.truckId)));
                    },
                    leading: Text(
                      MyString.fines.tr(),
                      style: const TextStyle(
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
                              builder: (context) => OtherCharges(
                                  tripId: widget.tripId,
                                  truckId: widget.truckId)));
                    },
                    leading: Text(
                      MyString.otherCharges.tr(),
                      style: const TextStyle(
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
