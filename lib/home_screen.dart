import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:turfbooking/login.dart';
import 'package:turfbooking/mybooking.dart';
import 'package:turfbooking/profile.dart';
import 'package:turfbooking/turf_detials_screen.dart';
import 'package:turfbooking/utils/mybuttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController();

  late PageController _pageController = PageController();
  int _currentItemIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentItemIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> items = [
    "assets/images/img_sliderfoodbal.png",
    "assets/images/img_sliderfoodbal.png",
    "assets/images/img_sliderfoodbal.png",
  ];
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    return MediaQuery(
      data: screen,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        key: scaffoldKey,
        // appBar: AppBar(
        //   actions: <Widget>[Container()],
        //   toolbarHeight: screen.size.height * 0.13,
        //   backgroundColor: Colors.white,
        //   automaticallyImplyLeading: false,
        //   surfaceTintColor: Colors.white,
        //   leadingWidth: screen.size.width,
        //   leading: SizedBox(
        //     height: screen.size.height * 0.13,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         SizedBox(
        //           width: screen.size.width * 0.09,
        //         ),
        //         Container(
        //           margin: const EdgeInsets.all(2),
        //           height: 62,
        //           width: 62,
        //           decoration: BoxDecoration(
        //             border: Border.all(width: 4, color: MyColor.green),
        //             shape: BoxShape.circle,
        //           ),
        //           child: Padding(
        //             padding: const EdgeInsets.all(0.0),
        //             child: ClipOval(
        //               child: Image.asset("assets/images/Ellipse 1.png"),
        //               // child: CachedNetworkImage(
        //               //   imageUrl: "",
        //               //   progressIndicatorBuilder:
        //               //       (context, url, downloadProgress) => Padding(
        //               //     padding: const EdgeInsets.all(20.0),
        //               //     child: SizedBox(
        //               //       width: screen.size.width * 0.08,
        //               //       child: CircularProgressIndicator(
        //               //           color: MyColor.button,
        //               //           value: downloadProgress.progress),
        //               //     ),
        //               //   ),
        //               //   errorWidget: (context, url, error) =>
        //               //       const Icon(Icons.error),
        //               //   fit: BoxFit.cover,
        //               // ),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 10,
        //         ),
        //         Expanded(
        //           flex: 5,
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Text(
        //                 'Hi User',
        //                 style: TextStyle(
        //                   fontSize: 19,
        //                   color: MyColor.black,
        //                   fontFamily: ColorFamily.fontsPopinsDisplay,
        //                   overflow: TextOverflow.ellipsis,
        //                   fontWeight: FontWeight.w400,
        //                 ),
        //                 maxLines: 2,
        //               ),
        //               const Row(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Icon(
        //                     Icons.location_on_outlined,
        //                     size: 15,
        //                   ),
        //                   Expanded(
        //                     child: Text(
        //                       'Mumbai , Maharashtra',
        //                       style: TextStyle(
        //                         fontSize: 12,
        //                         color: MyColor.black,
        //                         fontFamily: ColorFamily.fontsPopinsDisplay,
        //                         overflow: TextOverflow.ellipsis,
        //                         fontWeight: FontWeight.w600,
        //                       ),
        //                       maxLines: 2,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               InkWell(
        //                 radius: 20,
        //                 onTap: () {
        //                   debugPrint("navneet");
        //                 },
        //                 child: const SizedBox(
        //                   width: 110,
        //                   height: 12,
        //                   child: Center(
        //                     child: Text(
        //                       'Change location',
        //                       style: TextStyle(
        //                         fontSize: 10,
        //                         color: MyColor.green,
        //                         fontFamily: ColorFamily.fontsPopinsDisplay,
        //                         fontWeight: FontWeight.w300,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         InkWell(
        //           onTap: () => scaffoldKey.currentState!.openEndDrawer(),
        //           child: Container(
        //             alignment: Alignment.centerRight,
        //             width: screen.size.width * 0.25,
        //             height: screen.size.height * 0.13,
        //             // color: Colors.amber,
        //             child: Image.asset(
        //               "assets/images/greenicons.png",
        //               fit: BoxFit.contain,
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        endDrawer: MediaQuery(
          data: screen,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 900),
            // transform: Matrix4.translationValues(_isOpen ? 0 : -MediaQuery.of(context).size.width * 0.6, 0, 0),
            child: Drawer(
                width: screen.size.width,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screen.size.width * 0.086,
                    ),
                    InkWell(
                      onTap: () => scaffoldKey.currentState!.closeEndDrawer(),
                      child: SizedBox(
                        width: screen.size.width * 0.30,
                        // color: Colors.amber,
                        // height: screen.size.height,
                        child: Column(
                          children: [
                            SizedBox(
                              height: screen.size.height * 0.02,
                            ),
                            // SizedBox(
                            //   width: screen.size.width * 0.05,
                            // ),
                            Container(
                              alignment: Alignment.centerRight,
                              width: screen.size.width * 0.3,
                              height: screen.size.height * 0.15,
                              // color: Colors.amber,
                              child: Image.asset(
                                "assets/images/greenicons.png",
                                fit: BoxFit.contain,
                                // width: screen.size.width * 0.28,
                                // height: screen.size.height * 0.20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screen.size.width * 0.61,
                      // rgba(0, 153, 57, 1)
                      color: const Color(0xff009939),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Column(
                          children: [
                            Container(
                              // color: Colors.amber,
                              height: 165,
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Profile()));
                              },
                              tileColor: Colors.amber,
                              leading: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child:
                                      Image.asset("assets/images/person.png")),
                              title: Text(
                                MyString.profile.tr(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: MyColor.white,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // trailing: Icon(Icons.done),
                              // subtitle: Text('This is subtitle'),
                              selected: true,
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyBooking()));
                              },
                              tileColor: Colors.amber,
                              leading: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: Image.asset(
                                      "assets/images/booking-calender.png")),
                              title: Text(
                                MyString.myBookings.tr(),
                                // textScaleFactor: 1.5,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: MyColor.white,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // trailing: Icon(Icons.done),
                              // subtitle: Text('This is subtitle'),
                              selected: true,
                            ),
                            ListTile(
                              tileColor: Colors.amber,
                              leading: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child:
                                      Image.asset("assets/images/wallate.png")),
                              title: Text(
                                MyString.myWallet.tr(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: MyColor.white,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // trailing: Icon(Icons.done),
                              // subtitle: Text('This is subtitle'),
                              selected: true,
                            ),
                            ListTile(
                              tileColor: Colors.amber,
                              leading: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child:
                                      Image.asset("assets/images/event.png")),
                              title: Text(
                                MyString.events.tr(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: MyColor.white,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // trailing: Icon(Icons.done),
                              // subtitle: Text('This is subtitle'),
                              selected: true,
                            ),
                            ListTile(
                              tileColor: Colors.amber,
                              leading: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: Image.asset(
                                      "assets/images/reffer_Earn.png")),
                              title: Text(
                                MyString.referAndEarn.tr(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: MyColor.white,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // trailing: Icon(Icons.done),
                              // subtitle: Text('This is subtitle'),
                              selected: true,
                            ),
                            ListTile(
                              tileColor: Colors.amber,
                              leading: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: Image.asset(
                                      "assets/images/term_condition.png")),
                              title: Text(
                                MyString.termsAndConditions.tr(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: MyColor.white,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // trailing: Icon(Icons.done),
                              // subtitle: Text('This is subtitle'),
                              selected: true,
                            ),
                            ListTile(
                              tileColor: Colors.amber,
                              leading: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child:
                                      Image.asset("assets/images/privacy.png")),
                              title: Text(
                                MyString.privacy.tr(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: MyColor.white,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // trailing: Icon(Icons.done),
                              // subtitle: Text('This is subtitle'),
                              selected: true,
                            ),
                            ListTile(
                              onTap: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    // insetPadding: EdgeInsets.zero,
                                    // iconPadding: EdgeInsets.zero,
                                    titlePadding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 20,
                                        bottom: 20),
                                    buttonPadding: EdgeInsets.zero,
                                    actionsPadding: EdgeInsets.zero,
                                    contentPadding: EdgeInsets.zero,
                                    title: Center(
                                      child: Text(
                                        MyString.areyousureyouwanttologout.tr(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: MyColor.black,
                                          // overflow: TextOverflow.ellipsis,
                                          fontFamily:
                                              ColorFamily.fontsPopinsDisplay,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                bottom: 15,
                                                top: 5),
                                            child: AppButton(
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
                                                fontFamily: ColorFamily
                                                    .fontsPopinsDisplay,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              btnHeight: 30,
                                              btnWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              boder1: BorderRadius.circular(10),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Login()),
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              },
                                              name: MyString.yes.tr(),
                                            ),
                                          ),
                                          // Container(
                                          //   height: MediaQuery.of(context)
                                          //           .size
                                          //           .height *
                                          //       0.06,
                                          //   width: 1.5,
                                          //   color: Colors.blueGrey,
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                bottom: 15,
                                                top: 5),
                                            child: AppButton(
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
                                                fontFamily: ColorFamily
                                                    .fontsPopinsDisplay,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              btnHeight: 30,
                                              btnWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              boder1: BorderRadius.circular(10),
                                              name: MyString.no.tr(),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              tileColor: Colors.amber,
                              leading: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child:
                                      Image.asset("assets/images/logout.png")),
                              title: Text(
                                MyString.logout.tr(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: MyColor.white,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // trailing: Icon(Icons.done),
                              // subtitle: Text('This is subtitle'),
                              selected: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ) // Populate the Drawer in the next step.
                ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: screen.size.height * 0.02,
            ),
            SizedBox(
              width: screen.size.width,
              height: screen.size.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screen.size.width * 0.09,
                  ),
                  Container(
                    margin: const EdgeInsets.all(2),
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: MyColor.green),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ClipOval(
                        child: Image.asset("assets/images/Ellipse 1.png"),
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                            ),
                            Expanded(
                              child: Text(
                                'Mumbai , Maharashtra',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          radius: 20,
                          onTap: () {
                            debugPrint("navneet");
                          },
                          child: SizedBox(
                            width: 110,
                            height: 12,
                            child: Center(
                              child: Text(
                                MyString.changelocation.tr(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: MyColor.green,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => scaffoldKey.currentState!.openEndDrawer(),
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: screen.size.width * 0.30,
                      height: screen.size.height * 0.14,
                      // color: Colors.amber,
                      child: Image.asset(
                        "assets/images/greenicons.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CarouselSlider.builder(
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          height: 138.0,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentItemIndex = index;
                              _pageController =
                                  PageController(initialPage: index);
                            });
                          },
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            width: screen.size.width * 0.90,
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                items[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      SmoothPageIndicator(
                          controller: _pageController,
                          count: items.length,
                          effect: const ExpandingDotsEffect(
                              dotWidth: 17,
                              dotHeight: 15,
                              dotColor: Colors.grey,
                              activeDotColor: Colors.green)),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyString.venuearoundyou.tr(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: MyColor.black,
                              fontFamily: ColorFamily.fontsPopinsDisplay,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: MyColor.greensoft,
                              ),
                              color: MyColor.greensoft,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.filter_alt_outlined,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    MyString.filter.tr(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: MyColor.green,
                                      fontFamily:
                                          ColorFamily.fontsPopinsDisplay,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 0, right: 0, top: 25),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 6.0,
                          mainAxisSpacing: 6.0,
                          shrinkWrap: true,
                          children: List.generate(
                            5,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TurfDetialsScr()));
                                },
                                child: Card(
                                  elevation: 2,
                                  color: Colors.white,
                                  surfaceTintColor: Colors.white,
                                  shadowColor:
                                      const Color.fromARGB(255, 125, 159, 187),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: screen.size.height * 0.12,
                                          width: screen.size.width * 0.30,
                                          child: Image.asset(
                                              "assets/images/Ellipse 5.png")),
                                      const Text(
                                        "Synthetic Turf Council ",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: MyColor.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily:
                                              ColorFamily.fontsPopinsDisplay,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                      ),
                                      const Text(
                                        "St. Francis Xavier ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: MyColor.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily:
                                              ColorFamily.fontsPopinsDisplay,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: screen.size.height * 0.025,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 20,
                                                ),
                                                Text(
                                                  "5.0",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: MyColor.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily: ColorFamily
                                                        .fontsPopinsDisplay,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              // width: 70,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: MyColor.green,
                                                ),
                                                color: MyColor.green,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      "From \$700",
                                                      style: TextStyle(
                                                        fontSize: 9,
                                                        color: MyColor.white,
                                                        fontFamily: ColorFamily
                                                            .fontsPopinsDisplay,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
}
