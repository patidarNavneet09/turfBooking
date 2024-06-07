import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({super.key});

  @override
  State<HomeScr> createState() => _HomeScrState();
}

// list bool
bool listempty = false;

class _HomeScrState extends State<HomeScr> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screen.size.width,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screen.size.width * 0.04,
            ),
            Container(
              margin: const EdgeInsets.all(2),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: MyColor.white),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ClipOval(
                  child: Image.asset("assets/images/Demopic.png"),
                  // child: CachedNetworkImage(
                  //   imageUrl: "",
                  //   progressIndicatorBuilder:
                  //       (context, url, downloadProgress) => Padding(
                  //     padding: const EdgeInsets.all(20.0),
                  //     child: SizedBox(
                  //       width: screen.size.width * 0.08,
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
            SizedBox(
              width: screen.size.width * 0.02,
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hi User',
                    style: TextStyle(
                      fontSize: 19,
                      color: MyColor.black,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Icon(
                      //   Icons.location_on_outlined,
                      //   size: 15,
                      // ),
                      Expanded(
                        child: Text(
                          MyString.welcome.tr(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: MyColor.black,
                            fontFamily: ColorFamily.fontsPopinsDisplay,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  // InkWell(
                  //   radius: 20,
                  //   onTap: () {
                  //     debugPrint("navneet");
                  //   },
                  //   child: SizedBox(
                  //     width: 110,
                  //     height: 12,
                  //     child: Center(
                  //       child: Text(
                  //         MyString.changelocation.tr(),
                  //         style: const TextStyle(
                  //           fontSize: 10,
                  //           color: MyColor.green,
                  //           fontFamily: ColorFamily.fontsPopinsDisplay,
                  //           fontWeight: FontWeight.w300,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            // InkWell(
            //   // onTap: () => scaffoldKey.currentState!.openEndDrawer(),
            //   child: Container(
            //     alignment: Alignment.centerRight,
            //     width: screen.size.width * 0.30,
            //     height: screen.size.height * 0.14,
            //     // color: Colors.amber,
            //     child: Image.asset(
            //       "assets/images/greenicons.png",
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              MyString.todaysBookings.tr(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: ColorFamily.fontsPopinsDisplay,
                fontWeight: FontWeight.w600,
              ),
            ),
            listempty == true
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/no_booking_icon.png",
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          MyString.nobookingsfortoday.tr(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: MyColor.garyblue,
                            fontFamily: ColorFamily.fontsPopinsDisplay,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Card(
                          elevation: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: screen.size.width * 0.90,
                            // height: 190,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyColor.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: screen.size.width * 0.92,
                                  // height: 90,
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 8, bottom: 8),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Wednesday 20 April 2023",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: MyColor.white,
                                            fontFamily:
                                                ColorFamily.fontsPopinsDisplay,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "1 Slot 11:00 am - 12:00 pm",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: MyColor.white,
                                            fontFamily:
                                                ColorFamily.fontsPopinsDisplay,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "1 Slot 11:00 am - 12:00 pm",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: MyColor.white,
                                            fontFamily:
                                                ColorFamily.fontsPopinsDisplay,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
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
                                            height: 62,
                                            width: 62,
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
                                                    "assets/images/Ellipse 1.png"),
                                                // child: CachedNetworkImage(
                                                //   imageUrl: "",
                                                //   progressIndicatorBuilder:
                                                //       (context, url, downloadProgress) => Padding(
                                                //     padding: const EdgeInsets.all(20.0),
                                                //     child: SizedBox(
                                                //       width: screen.size.width * 0.08,
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
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'John Doe',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: MyColor.black,
                                                    fontFamily: ColorFamily
                                                        .fontsPopinsDisplay,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Image.asset(
                                                  "assets/images/call_icon.png",
                                                  width: 20,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Paid 1200',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: MyColor.green,
                                                fontFamily: ColorFamily
                                                    .fontsPopinsDisplay,
                                                // overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
          ],
        ),
      ),
    );
  }
}
