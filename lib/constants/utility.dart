import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';

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

  static Future<Locale?>? getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString('language');
    language ??= "en";
    String countryCode = "US";
    if (language == "en") {
      countryCode = "US";
    }
    // else if (language == "it") {
    //   countryCode = "IT";
    // } else if (language == 'de') {
    //   countryCode = "DE";
    // } else if (language == "fr") {
    //   countryCode = "FR";
    // } else {
    //   countryCode = "US";
    // }
    return Locale(language.toString(), countryCode);
  }

  static progressloadingDialog(BuildContext context, bool status) async {
    if (status) {
      showDialog(
          barrierColor: Colors.transparent,
          context: context,
          barrierDismissible: false,
          builder: (_) => PopScope(
              canPop: false,
              child: Center(
                  // child: CircularProgressIndicator(
                  //   color: MyColor.color_gradient3,
                  // ),
                  child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
                height: MediaQuery.of(context).size.height * 0.05,
                // child: Image.asset(
                //     // "assets/images/ig_hand_loading.gif",
                //     "assets/images/Ellipsis-1.5s-207px (1).gif"
                //     // "assets/images/gf_loadingdemo_icon.gif",
                // color: MyColor.blue,
                //     // height: MediaQuery.of(context).size.height * 0.30,
                //     ),
                child: LoadingAnimationWidget.waveDots(
                    color: MyColor.cardpendding, size: 75),
              ))));
    } else {
      Navigator.pop(context, false);
    }
  }

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

  Widget myRefreshIndicator(
      {required BuildContext context,
      required Widget body,
      required VoidCallback onRefresh}) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1), () {
          onRefresh();
        });
      },
      color: MyColor.cardpendding,
      backgroundColor: MyColor.white,
      child: body,
    );
  }
}
