import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/notificationmodel.dart';
import 'package:truckmanagement/constant/apiconstant.dart';
import '../constant/AppColor/app_colors.dart';
import '../constant/app_fontfamily.dart';
import 'dart:convert' as convert;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int page = 1;
  Notificationmodel notificationRes = Notificationmodel();
  ScrollController scrollcontroller = ScrollController();
  List<Items> notificationList = [];

  bool load = false;
  bool pageload = false;
  int totalpage = 1;

  @override
  void initState() {
    super.initState();
    getnotification();
    pagination(context);
  }

  getnotification() {
    notificationList.clear();
    setState(() {});
    WidgetsBinding.instance
        .addPostFrameCallback((_) => getNotificationApi(context, true));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1.0),
      child: load
          ? SizedBox(
              height: data.size.height,
              child: Center(
                  child: Image.asset(
                "assets/images/gif_loader.gif",
              )),
            )
          : Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "Notifications",
                  style: TextStyle(
                    color: MyColor.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: ColorFamily.fontsSFProDisplay,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                controller: scrollcontroller,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 0,
                    ),

                    /// Notification List........

                    notificationList.isNotEmpty
                        ? ListView.builder(
                            itemCount: notificationList.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, int index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child:
                                    notificatuincard(notificationList[index]),
                              );
                            })
                        : SizedBox(
                            height: data.size.height * 0.75,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: Text("No notification")),
                              ],
                            ),
                          ),

                    const SizedBox(
                      height: 10,
                    ),
                    pageload
                        ? SizedBox(
                            width: data.size.width,
                            child: Center(
                                child: Image.asset(
                              "assets/images/gif_loader.gif",
                              height: 80,
                              width: 100,
                            )),
                          )
                        : const SizedBox.shrink(),

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  notificatuincard(Items model) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          color: MyColor.white,
          boxShadow: const [
            BoxShadow(color: MyColor.greyText, spreadRadius: 0.1)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [MyColor.button, MyColor.button1]),
                shape: BoxShape.circle),
            //backgroundColor: MyColor.button,
            child: Center(
              child: Image.asset(
                "assets/images/notification.png",
                color: MyColor.white,
                height: 20,
                width: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 0,
              ),
              Text(
                "${model.title}",
                style: const TextStyle(
                  color: MyColor.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${model.description}",
                style: const TextStyle(
                  color: MyColor.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Future<Notificationmodel> getNotificationApi(
      BuildContext context, bool loader) async {
    SharedPreferences p = await SharedPreferences.getInstance();
    String tripId = p.getString("trip_id").toString();
    debugPrint(tripId);
    var request = {};
    request['page'] = page;

    if (loader) {
      load = true;
    } else {
      pageload = true;
    }
    setState(() {});

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(
        logLevel: LogLevel.BODY,
      ),
    ]);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(ApiServer.getnotification),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization":
              "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
        });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    if (loader) {
      load = false;
    } else {
      pageload = false;
    }
    setState(() {});
    if (jsonResponse['status'] == true) {
      debugPrint("response.body>>>>>>>>>>$jsonResponse");
      notificationRes = Notificationmodel.fromJson(jsonResponse);

      totalpage = int.parse(notificationRes.data!.total.toString());
      for (int i = 0; i < notificationRes.data!.items!.length; i++) {
        notificationList.add(notificationRes.data!.items![i]);
        setState(() {});
      }
      setState(() {});
      debugPrint("totalpage..........$totalpage");
      debugPrint("notificationList..........${notificationList.length}");
    }
    return Notificationmodel.fromJson(jsonDecode(response.body));
  }

  /////////////////////////////////////////////////////// Add Pagination...............
  pagination(BuildContext context) async {
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.maxScrollExtent ==
          scrollcontroller.position.pixels) {
        if (totalpage >= page) {
          if (!pageload) {
            page = page + 1;
            pageload = !pageload;
            debugPrint("page>>>>>>>><<<<<<<$page");
            debugPrint("isLoading>>>>>>>><<<<<<<$pageload");

            WidgetsBinding.instance.addPostFrameCallback(
                (_) => getNotificationApi(context, false));
            setState(() {});
          }
        }
      }
    });
  }
}
