import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:turfbooking/mybooking.dart';
import 'package:turfbooking/utils/mybuttons.dart';

class BokkingSummary extends StatefulWidget {
  const BokkingSummary({super.key});

  @override
  State<BokkingSummary> createState() => _BokkingSummaryState();
}

class _BokkingSummaryState extends State<BokkingSummary> {
  int payIndex = 0;
  @override
  void initState() {
    super.initState();
    payIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: buildMyNavBar(context),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          MyString.bookingSummary.tr(),
          style: const TextStyle(
            fontSize: 18,
            color: MyColor.black,
            fontFamily: ColorFamily.fontsPopinsDisplay,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              backgroundColor: MyColor.pinklite,
              foregroundColor: MyColor.pinklite,
              radius: 08,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 8,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: MyColor.green,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        leadingWidth: 50,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            DottedBorder(
                color: MyColor.black,
                strokeWidth: 2,
                borderType: BorderType.Rect,
                dashPattern: const [5, 10],
                child: Container(
                    margin: const EdgeInsets.all(2),
                    // height:screen.size.height,
                    width: screen.size.width * 0.90,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              MyString.venue.tr(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: MyColor.black,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    height: 115,
                                    width: 115,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4, color: MyColor.white),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: ClipOval(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          child: Container(
                                            margin: const EdgeInsets.all(2),
                                            height: 115,
                                            width: 115,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 4,
                                                  color: MyColor.white),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: ClipOval(
                                                child: Image.asset(
                                                    "assets/images/Demopic.png"),
                                                // child: CachedNetworkImage(
                                                //   imageUrl: "",
                                                //   progressIndicatorBuilder:
                                                //       (context, url, downloadProgress) => Padding(
                                                //     padding: const EdgeInsets.all(20.0),
                                                //     child: SizedBox(
                                                //       width: MediaQuery.of(context).size.width * 0.08,
                                                //       child: CircularProgressIndicator(
                                                //           color: MyColor.button,
                                                //           value: downloadProgress.progress),
                                                //     ),
                                                //   ),
                                                //   errorWidget: (context, url, error) =>
                                                //       const Icon(Icons.error),
                                                //   fit: BoxFit.cover,
                                                // ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Sports Astro Turf',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: MyColor.black,
                                        fontFamily:
                                            ColorFamily.fontsPopinsDisplay,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'St. Francis Xavier High School Ground, Dias And Pereira Nagar, Naigaon West, Mumbai, Maharashtra',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: MyColor.black,
                                        fontFamily:
                                            ColorFamily.fontsPopinsDisplay,
                                        // overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Booking date and time",
                              style: TextStyle(
                                fontSize: 15,
                                color: MyColor.black,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: MyColor.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: screen.size.width * 0.80,
                          // height: 90,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            child: Column(
                              children: [
                                Text(
                                  "Wednesday 20 April 2023",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: MyColor.white,
                                    fontFamily: ColorFamily.fontsPopinsDisplay,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "2 Slots   07:00 PM - 09:00 PM",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: MyColor.white,
                                    fontFamily: ColorFamily.fontsPopinsDisplay,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              MyString.bookingamount.tr(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: MyColor.black,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: MyColor.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: screen.size.width * 0.80,
                          // height: 90,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 17, bottom: 17),
                            child: Column(
                              children: [
                                Text(
                                  "₹ 1400",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: MyColor.white,
                                    fontFamily: ColorFamily.fontsPopinsDisplay,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ))),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  MyString.paythough.tr(),
                  style: const TextStyle(
                    fontSize: 15,
                    color: MyColor.black,
                    fontFamily: ColorFamily.fontsPopinsDisplay,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (payIndex == 0) {
                          setState(() {
                            payIndex = 1;
                          });
                        }
                      },
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          payIndex == 1
                              ? "assets/images/wallte_active.png"
                              : "assets/images/wallate_inactive.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      MyString.wallet.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: MyColor.green,
                        fontFamily: ColorFamily.fontsPopinsDisplay,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      payIndex == 1
                          ? "${MyString.availableamount.tr()} ₹ 1400 "
                          : "",
                      style: const TextStyle(
                        fontSize: 14,
                        color: MyColor.black,
                        fontFamily: ColorFamily.fontsPopinsDisplay,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (payIndex == 1) {
                          setState(() {
                            payIndex = 0;
                          });
                        }
                      },
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          payIndex == 0
                              ? "assets/images/wallte_active.png"
                              : "assets/images/wallate_inactive.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      MyString.uPI.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: MyColor.green,
                        fontFamily: ColorFamily.fontsPopinsDisplay,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      payIndex == 0
                          ? "${MyString.availableamount.tr()} ₹ 1400 "
                          : "",
                      style: const TextStyle(
                        fontSize: 14,
                        color: MyColor.black,
                        fontFamily: ColorFamily.fontsPopinsDisplay,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      )),
    );
  }

  buildMyNavBar(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 65,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 3.0),
              BoxShadow(
                  color: Color.fromARGB(255, 228, 223, 223),
                  offset: Offset(0, -2)),
              BoxShadow(
                  color: Color.fromARGB(255, 228, 223, 223),
                  offset: Offset(0, 2)),
              BoxShadow(
                  color: Color.fromARGB(255, 228, 223, 223),
                  offset: Offset(-1, 0)),
              BoxShadow(
                  color: Color.fromARGB(255, 228, 223, 223),
                  offset: Offset(-1, 0)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "2 ${MyString.slots.tr()}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "06:00 AM - 08:00 AM",
                    style: TextStyle(
                      fontSize: 8,
                      color: MyColor.black,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                      btnWidth: MediaQuery.of(context).size.width * 0.40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyBooking()));
                      },
                      name: "${MyString.paysignR} 1400"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
