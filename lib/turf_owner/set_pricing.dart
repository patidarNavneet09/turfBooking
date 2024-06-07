import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:turfbooking/turf_owner/owner_dashboar_screen.dart';
import 'package:turfbooking/utils/mybuttons.dart';

class SetPricing extends StatefulWidget {
  const SetPricing({super.key});

  @override
  State<SetPricing> createState() => _SetPricingState();
}

class _SetPricingState extends State<SetPricing> {
  /// ListMonday this list work in monday section
  List<Map<String, dynamic>> listMonday = [
    {
      'hour': '06:00',
      'min': '12:00',
      'price': 1200,
    }
  ];

  // all text field controller to set value on textEditing
  TextEditingController hourController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool textfield = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Set Pricing",
          style: TextStyle(
            color: MyColor.black,
            fontSize: 15,
            fontFamily: ColorFamily.fontsPopinsDisplay,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: buildMyNavBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 2,
              shadowColor: const Color.fromARGB(255, 84, 129, 167),
              surfaceTintColor: Colors.transparent,
              color: Colors.grey,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    iconColor: Colors.green,

                    backgroundColor: Colors.transparent,
                    title: const Text('Monday'),
                    // subtitle: Text('Trailing expansion arrow icon'),
                    children: <Widget>[
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: listMonday.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 0, 10),
                                        child: Card(
                                          elevation: 2,
                                          shadowColor: Colors.grey,
                                          surfaceTintColor: Colors.grey,
                                          color: Colors.grey,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            // height: 57,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            height: 65,
                                            child: Center(
                                                child: Text(
                                              listMonday[index]['hour']
                                                  .toString(),
                                              style: TextStyle(
                                                color: MyColor.black,
                                                fontSize: 15,
                                                fontFamily: ColorFamily
                                                    .fontsPopinsDisplay,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )),
                                          ),
                                        )),
                                    const Text(
                                      "-",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 10, 10),
                                        child: Card(
                                          elevation: 2,
                                          shadowColor: Colors.grey,
                                          surfaceTintColor: Colors.grey,
                                          color: Colors.grey,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            // height: 57,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            height: 65,
                                            child: Center(
                                                child: Text(
                                              listMonday[index]['min']
                                                  .toString(),
                                              style: TextStyle(
                                                color: MyColor.black,
                                                fontSize: 15,
                                                fontFamily: ColorFamily
                                                    .fontsPopinsDisplay,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )),
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        child: Card(
                                          elevation: 2,
                                          shadowColor: Colors.grey,
                                          surfaceTintColor: Colors.grey,
                                          color: Colors.grey,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            // height: 57,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                            height: 65,
                                            child: Center(
                                                child: Text(
                                              "₹${listMonday[index]['price'].toString()}",
                                              style: TextStyle(
                                                color: MyColor.black,
                                                fontSize: 15,
                                                fontFamily: ColorFamily
                                                    .fontsPopinsDisplay,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )),
                                          ),
                                        )),
                                  ],
                                ),
                                textfield == true
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 0, 10),
                                              child: Card(
                                                elevation: 2,
                                                shadowColor: Colors.grey,
                                                surfaceTintColor: Colors.grey,
                                                color: Colors.grey,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  // height: 57,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.18,
                                                  height: 65,
                                                  child: Center(
                                                    child: TextFormField(
                                                      // readOnly: true,
                                                      textAlign:
                                                          TextAlign.start,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      controller:
                                                          hourController,

                                                      // controller: NameController
                                                      //   ..text =
                                                      //       snapshot.data!.data!.name.toString(),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        // focusColor: MyColor.Red_color,
                                                        // fillColor: MyColor.Red_color,
                                                        // prefixIcon: const Icon(Icons.email_outlined),
                                                        // prefixIconColor: MaterialStateColor.resolveWith(
                                                        //     (states) =>
                                                        //         states.contains(MaterialState.focused)
                                                        //             ? MyColor.black
                                                        //             : Colors.grey),
                                                        // hintText: MyString.typesomethingaboutyourturf.tr(),
                                                        hintStyle: const TextStyle(
                                                            color: Colors.grey,
                                                            fontFamily: ColorFamily
                                                                .fontsPopinsDisplay,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16),

                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        disabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          const Text(
                                            "-",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 10, 10, 10),
                                              child: Card(
                                                elevation: 2,
                                                shadowColor: Colors.grey,
                                                surfaceTintColor: Colors.grey,
                                                color: Colors.grey,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  // height: 57,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.18,
                                                  height: 65,
                                                  child: Center(
                                                    child: TextFormField(
                                                      // readOnly: true,
                                                      textAlign:
                                                          TextAlign.start,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      controller:
                                                          hourController,

                                                      // controller: NameController
                                                      //   ..text =
                                                      //       snapshot.data!.data!.name.toString(),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        // focusColor: MyColor.Red_color,
                                                        // fillColor: MyColor.Red_color,
                                                        // prefixIcon: const Icon(Icons.email_outlined),
                                                        // prefixIconColor: MaterialStateColor.resolveWith(
                                                        //     (states) =>
                                                        //         states.contains(MaterialState.focused)
                                                        //             ? MyColor.black
                                                        //             : Colors.grey),
                                                        // hintText: MyString.typesomethingaboutyourturf.tr(),
                                                        hintStyle: const TextStyle(
                                                            color: Colors.grey,
                                                            fontFamily: ColorFamily
                                                                .fontsPopinsDisplay,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16),

                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        disabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 10, 10),
                                              child: Card(
                                                elevation: 2,
                                                shadowColor: Colors.grey,
                                                surfaceTintColor: Colors.grey,
                                                color: Colors.grey,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  // height: 57,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.30,
                                                  height: 65,
                                                  child: Center(
                                                    child: TextFormField(
                                                      // readOnly: true,
                                                      textAlign:
                                                          TextAlign.start,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      controller:
                                                          hourController,

                                                      // controller: NameController
                                                      //   ..text =
                                                      //       snapshot.data!.data!.name.toString(),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        // focusColor: MyColor.Red_color,
                                                        // fillColor: MyColor.Red_color,
                                                        // prefixIcon: const Icon(Icons.email_outlined),
                                                        // prefixIconColor: MaterialStateColor.resolveWith(
                                                        //     (states) =>
                                                        //         states.contains(MaterialState.focused)
                                                        //             ? MyColor.black
                                                        //             : Colors.grey),
                                                        // hintText: MyString.typesomethingaboutyourturf.tr(),
                                                        hintStyle: const TextStyle(
                                                            color: Colors.grey,
                                                            fontFamily: ColorFamily
                                                                .fontsPopinsDisplay,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16),

                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        disabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: MyColor
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container()
                              ],
                            );
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (textfield == false) {
                                textfield = true;
                              } else {
                                textfield = false;
                              }

                              setState(() {});
                            },
                            child: SizedBox(
                              height: 15,
                              width: 100,
                              child: Text(
                                textfield == true
                                    ? "Remove custom price"
                                    : "Add custom price",
                                style: TextStyle(
                                  color: MyColor.green,
                                  fontSize: 10,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            AppButton(
                // isLoading: isLoading,
                // color: MyColor.transparent,
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.green,
                    Colors.green,
                  ],
                ),
                textStyle: const TextStyle(
                  color: MyColor.white,
                  fontSize: 16,
                  fontFamily: ColorFamily.fontsPopinsDisplay,
                  fontWeight: FontWeight.w600,
                ),
                btnWidth: MediaQuery.of(context).size.width * 0.65,
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeDashBoardOwnerScr()));
                },
                name: MyString.next.tr()),
          ],
        ));
  }
}
