import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';

class Utility {
  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  static getToast({required msg, Color? toastColor, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      backgroundColor: toastColor ?? MyColor.black,
      msg: msg.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0
    );
  }

  static progressloadingDialog(BuildContext context, bool status) async {
    if (status) {
      showDialog(
          barrierColor: Colors.transparent,
          context: context,
          barrierDismissible: false,
          builder: (_) => WillPopScope(
              onWillPop: () async => false,
              child: Center(
                  // child: CircularProgressIndicator(
                  //   color: MyColor.color_gradient3,
                  // ),
                  child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.asset("assets/images/gif_loader.gif"),
                // child: Image.asset(
                //     // "assets/images/ig_hand_loading.gif",
                //     "assets/images/Ellipsis-1.5s-207px (1).gif"
                //     // "assets/images/gf_loadingdemo_icon.gif",
                // color: MyColor.blue,
                //     // height: MediaQuery.of(context).size.height * 0.30,
                //     ),
                // child: LoadingAnimationWidget.waveDots(
                //     color: MyColor.redcolor, size: 75),
              ))));
    } else {
      Navigator.pop(context, false);
    }
  }

  // static precentageloadingDialog(BuildContext context, bool status) async {
  //   if (status) {
  //     showDialog(
  //         barrierDismissible: true,
  //         context: context,
  //         builder: (_) => AlertDialog(
  //             shape: const RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10.0))),
  //             content: Builder(builder: (context) {
  //               // Get available height and width of the build area of this widget. Make a choice depending on the size.
  //               var height = MediaQuery.of(context);
  //               var width = MediaQuery.of(context);

  //               return SizedBox(
  //                   height: height.size.height * 0.26,
  //                   width: width.size.width * 0.10,
  //                   // child: Image.asset(
  //                   //     // "assets/images/ig_hand_loading.gif",
  //                   //     "assets/images/Ellipsis-1.5s-207px (1).gif"
  //                   //     // "assets/images/gf_loadingdemo_icon.gif",
  //                   // color: MyColor.blue,
  //                   //     // height: MediaQuery.of(context).size.height * 0.30,
  //                   //     ),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       SizedBox(
  //                         height: height.size.height * 0.10,
  //                         child: CircularPercentIndicator(
  //                           radius: 30.0,
  //                           lineWidth: 5.0,
  //                           percent: progress,
  //                           // center: progress.toStringAsFixed(2).split(".").last ==
  //                           //         "99"
  //                           //     ? Text("100")
  //                           //     : Text(progress.toStringAsFixed(2).split(".").last),
  //                           progressColor: MyColor.redcolor,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: height.size.height * 0.02,
  //                       ),
  //                       SizedBox(
  //                         height: height.size.height * 0.14,
  //                         child: const Text(
  //                           "Uploading Property Details. This process might take time depending on the size of your images and videos. ",
  //                           style: TextStyle(
  //                             fontSize: 15,
  //                             // overflow: TextOverflow.ellipsis,
  //                             color: MyColor.redcolor,
  //                             fontFamily: "Raleway",
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ));
  //             })));
  //   }
  // }

  static String datefomatToDateTime(String bigTime) {
    DateTime tempDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(bigTime);
    var dateFormat =
        DateFormat("dd-MM-yyyy hh:mm a"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));

    return createdDate;
  }

  static String datefomatToTime(String bigTime) {
    DateTime tempDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(bigTime);
    var dateFormat = DateFormat("hh:mm a"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));

    return createdDate;
  }

  static String datefomatToDate(String bigTime) {
    DateTime tempDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(bigTime);
    var dateFormat =
        DateFormat("dd MMM yyyy"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));

    return createdDate;
  }

  static String datefomatToDateddMMyyyy(String bigTime) {
    DateTime tempDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(bigTime);
    var dateFormat = DateFormat("dd/MM/yyyy"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));

    return createdDate;
  }

  static String datefomatToDate2ddMMyyyy(String bigTime) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(bigTime);
    var dateFormat = DateFormat("dd/MM/yyyy"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));

    return createdDate;
  }

  static String datefomatToDate3format(String bigTime) {
    DateTime tempDate = DateFormat("dd/MM/yyyy").parse(bigTime);
    var dateFormat = DateFormat("yyyy-MM-dd"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));

    return createdDate;
  }

  static String datefomatToDate3ddMMMyyyy(String bigTime) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(bigTime);
    var dateFormat =
        DateFormat("dd MMM yyyy"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));

    return createdDate;
  }

  // Widget myRefreshIndicator(
  //     {required BuildContext context,
  //     required Widget body,
  //     required VoidCallback onRefresh}) {
  //   return RefreshIndicator(
  //     onRefresh: () {
  //       return Future.delayed(const Duration(seconds: 1), () {
  //         onRefresh();
  //       });
  //     },
  //     color: MyColor.redcolor,
  //     backgroundColor: MyColor.white,
  //     child: body,
  //   );
  // }
}
