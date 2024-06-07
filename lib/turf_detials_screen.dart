import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:turfbooking/schdule_booking.dart';
import 'package:turfbooking/utils/mybuttons.dart';

class TurfDetialsScr extends StatefulWidget {
  const TurfDetialsScr({super.key});

  @override
  State<TurfDetialsScr> createState() => _TurfDetialsScrState();
}

class _TurfDetialsScrState extends State<TurfDetialsScr> {
  int indexrow = 0;
  final CarouselController _carouselController = CarouselController();

  late PageController _pageController;

  int _currentItemIndex = 0;

  List<String> items = [
    "assets/images/img_sliderfoodbal.png",
    "assets/images/img_sliderfoodbal.png",
    "assets/images/img_sliderfoodbal.png",
  ];

  @override
  void initState() {
    indexrow = 1;
    super.initState();
    _pageController =
        PageController(initialPage: _currentItemIndex, viewportFraction: 0.5);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: MediaQuery.of(context).size.height * 0.30,
                    viewportFraction: 1.1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentItemIndex = index;
                        // Update the page controller to reflect the current page
                        _pageController = PageController(initialPage: index);
                      });
                    },
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          items[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(31, 231, 225, 225),
                              foregroundColor:
                                  Color.fromARGB(31, 231, 225, 225),
                              radius: 15,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 8,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: MyColor.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 82,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(31, 231, 225, 225),
                              ),
                              color: const Color.fromARGB(31, 231, 225, 225),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "5.0",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: MyColor.white,
                                      fontFamily:
                                          ColorFamily.fontsPopinsDisplay,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.18,
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: items.length,
                        // Set the count to half the number of items to show only 5 dots
                        effect: const WormEffect(
                            dotWidth: 8,
                            dotHeight: 8,
                            dotColor: MyColor.whitesoft,
                            activeDotColor: MyColor.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                ClipOval(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 115,
                      width: 115,
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
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sports Astro Turf',
                        style: TextStyle(
                          fontSize: 15,
                          color: MyColor.black,
                          fontFamily: ColorFamily.fontsPopinsDisplay,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                          height: 43,
                          width: 80,
                          child: Image.asset(
                              "assets/images/img_FootbalCirct.png")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppButton(
                              // isLoading: isLoading,
                              // color: MyColor.transparent,

                              padding: EdgeInsets.zero,
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
                                fontSize: 12,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                fontWeight: FontWeight.w500,
                              ),
                              btnHeight: 30,
                              btnWidth:
                                  MediaQuery.of(context).size.width * 0.30,
                              boder1: BorderRadius.circular(10),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Schdulebooking()));
                              },
                              name: MyString.bookNow.tr()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return const Color.fromARGB(255, 230, 222, 222);
                        }
                        return Colors.transparent;
                      }),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Colors.transparent;
                      }),
                    ),
                    onPressed: () {
                      setState(() {
                        indexrow = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IntrinsicWidth(
                        child: Column(
                          children: [
                            Text(
                              MyString.about.tr(),
                              style: TextStyle(
                                fontSize: 15,
                                color: indexrow == 1
                                    ? MyColor.green
                                    : MyColor.black,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            indexrow == 1
                                ? dividerUi()
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 18,
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return const Color.fromARGB(255, 230, 222, 222);
                        }
                        return Colors.transparent;
                      }),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Colors.transparent;
                      }),
                    ),
                    onPressed: () {
                      setState(() {
                        indexrow = 2;
                      });
                    },
                    child: IntrinsicWidth(
                      child: Column(
                        children: [
                          Text(
                            MyString.pricing.tr(),
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  indexrow == 2 ? MyColor.green : MyColor.black,
                              fontFamily: ColorFamily.fontsPopinsDisplay,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          indexrow == 2
                              ? dividerUi()
                              : Container(
                                  height: 18,
                                )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return const Color.fromARGB(255, 230, 222, 222);
                        }
                        return Colors.transparent;
                      }),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Colors.transparent;
                      }),
                    ),
                    onPressed: () {
                      setState(() {
                        indexrow = 3;
                      });
                    },
                    child: IntrinsicWidth(
                      child: Column(
                        children: [
                          Text(
                            MyString.location.tr(),
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  indexrow == 3 ? MyColor.green : MyColor.black,
                              fontFamily: ColorFamily.fontsPopinsDisplay,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          indexrow == 3
                              ? dividerUi()
                              : Container(
                                  height: 18,
                                )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return const Color.fromARGB(255, 230, 222, 222);
                        }
                        return Colors.transparent;
                      }),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Colors.transparent;
                      }),
                    ),
                    onPressed: () {
                      setState(() {
                        indexrow = 4;
                      });
                    },
                    child: IntrinsicWidth(
                      child: Column(
                        children: [
                          Text(
                            MyString.reviews.tr(),
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  indexrow == 4 ? MyColor.green : MyColor.black,
                              fontFamily: ColorFamily.fontsPopinsDisplay,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          indexrow == 4
                              ? dividerUi()
                              : Container(
                                  height: 18,
                                )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            indexrow == 1
                ? Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
                      ),
                      Container(
                          color: MyColor.green,
                          height: 25,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left: 10),
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            MyString.amenities.tr(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: MyColor.white,
                              fontFamily: ColorFamily.fontsPopinsDisplay,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                            "assets/images/Fast_kit.png"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      MyString.firstAidKit.tr(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: MyColor.black,
                                        fontFamily:
                                            ColorFamily.fontsPopinsDisplay,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                            "assets/images/Fast_kit.png"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      MyString.parking.tr(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: MyColor.black,
                                        fontFamily:
                                            ColorFamily.fontsPopinsDisplay,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : indexrow == 2
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Container(
                                color: MyColor.green,
                                height: 25,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  MyString.weekdays.tr(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: MyColor.white,
                                    fontFamily: ColorFamily.fontsPopinsDisplay,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                            Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: 4,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("04:00 - 06:00"),
                                          Card(
                                            // elevation: 1,
                                            shadowColor: const Color.fromARGB(
                                                255, 122, 158, 185),
                                            child: Container(
                                              // width: 70,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: MyColor.white,
                                                ),
                                                color: MyColor.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Text(
                                                        "Rs600/Hour",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: MyColor.green,
                                                          fontFamily: ColorFamily
                                                              .fontsPopinsDisplay,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                              ],
                            ),
                            Container(
                                color: MyColor.green,
                                height: 25,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  MyString.weekend.tr(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: MyColor.white,
                                    fontFamily: ColorFamily.fontsPopinsDisplay,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                            Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: 4,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("04:00 - 06:00"),
                                          Card(
                                            // elevation: 1,
                                            shadowColor: const Color.fromARGB(
                                                255, 78, 121, 155),
                                            child: Container(
                                              // width: 70,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: MyColor.white,
                                                ),
                                                color: MyColor.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Text(
                                                        "Rs600/Hour",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: MyColor.green,
                                                          fontFamily: ColorFamily
                                                              .fontsPopinsDisplay,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    : indexrow == 3
                        ? const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                Center(
                                    child: Text(
                                        "St. Francis Xavier High School Ground, Dias And Pereira Nagar, Naigaon West, Mumbai, Maharashtra"))
                              ],
                            ),
                          )
                        : indexrow == 4
                            ? const Column(
                                children: [Center(child: Text(""))],
                              )
                            : const Column(
                                children: [],
                              )
          ],
        ),
      ),
    );
  }

  dividerUi() {
    return const Column(
      children: [
        SizedBox(
          height: 05,
        ),
        Divider(
          height: 5,
          color: MyColor.green,
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
