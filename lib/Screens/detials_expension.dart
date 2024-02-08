// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:pretty_http_logger/pretty_http_logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:truckmanagement/Model/tripdetailsmodel.dart';
// import 'package:truckmanagement/Screens/large_images.dart';
// import 'package:truckmanagement/constant/AppColor/app_colors.dart';
// import 'package:truckmanagement/constant/apiconstant.dart';
// import 'package:truckmanagement/constant/app_fontfamily.dart';
// import 'dart:convert' as convert;

// class DetialsExpenstion extends StatefulWidget {
//   final String? tripId;
//   final String? driverId;
//   final String? nameProperty;
//   const DetialsExpenstion(
//       {super.key, this.tripId, this.driverId, this.nameProperty});

//   @override
//   State<DetialsExpenstion> createState() => _DetialsExpenstionState();
// }

// class _DetialsExpenstionState extends State<DetialsExpenstion> {
//   Tripdetails tripdetails = Tripdetails();
//   bool loading1 = true;
//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance
//         .addPostFrameCallback((_) => tripdetialsGet(context, "1", "1"));
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screens = MediaQuery.of(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
//         title: Text(
//           widget.nameProperty.toString(),
//           style: TextStyle(
//             fontSize: 16,
//             color: MyColor.appbartext,
//             // overflow: TextOverflow.ellipsis,
//             fontFamily: ColorFamily.fontsSFProDisplay,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         centerTitle: true,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(Icons.arrow_back)),
//       ),
//       body: ListView.builder(
//           scrollDirection: Axis.vertical,
//           physics: const AlwaysScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: 15,
//           itemBuilder: (BuildContext context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: MyColor.greyText),
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: Column(
//                     children: [
//                       // const Padding(
//                       //   padding:
//                       //       EdgeInsets.only(top: 8, left: 8, right: 10),
//                       //   child: Row(
//                       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //     children: [
//                       //       Text(
//                       //         "Add On Diesel",
//                       //         style: TextStyle(
//                       //           fontSize: 14,
//                       //           color: MyColor.black,
//                       //           // overflow: TextOverflow.ellipsis,
//                       //           fontFamily: ColorFamily.fontsSFProDisplay,
//                       //           fontWeight: FontWeight.w400,
//                       //         ),
//                       //       ),
//                       //       Icon(Icons.keyboard_arrow_down)
//                       //     ],
//                       //   ),
//                       // ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 8, right: 8, bottom: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                 border:
//                                     Border.all(width: 1, color: MyColor.button),
//                                 borderRadius:
//                                     const BorderRadius.all(Radius.circular(10)),
//                               ),
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => LargeImages(
//                                                 imagesUrl: tripdetails
//                                                     .data!
//                                                     .addOnDiesel!
//                                                     .petrolStationImage
//                                                     .toString(),
//                                                 nameProperty: "Add On Diesel",
//                                               )));
//                                 },
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(09)),
//                                   child: CachedNetworkImage(
//                                     imageUrl: tripdetails
//                                         .data!.addOnDiesel!.petrolStationImage
//                                         .toString(),
//                                     progressIndicatorBuilder:
//                                         (context, url, downloadProgress) =>
//                                             Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: CircularProgressIndicator(
//                                         color: MyColor.button,
//                                         value: downloadProgress.progress,
//                                       ),
//                                     ),
//                                     errorWidget: (context, url, error) =>
//                                         const Icon(Icons.error),
//                                     fit: BoxFit.fill,
//                                     height: screens.size.height * 0.08,
//                                     width: screens.size.width * 0.08,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 const Text(
//                                   "Quantity",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: MyColor.greyText,
//                                     // overflow: TextOverflow.ellipsis,
//                                     fontFamily: ColorFamily.fontsSFProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   tripdetails
//                                       .data!.addOnDiesel!.quantityInLitres
//                                       .toString(),
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: MyColor.black,
//                                     // overflow: TextOverflow.ellipsis,
//                                     fontFamily: ColorFamily.fontsSFProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 const Text(
//                                   "Unit Price",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: MyColor.greyText,
//                                     // overflow: TextOverflow.ellipsis,
//                                     fontFamily: ColorFamily.fontsSFProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   "\$${tripdetails.data!.addOnDiesel!.unitPrice.toString()}",
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: MyColor.black,
//                                     // overflow: TextOverflow.ellipsis,
//                                     fontFamily: ColorFamily.fontsSFProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 const Text(
//                                   "Fuel Station",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: MyColor.greyText,
//                                     // overflow: TextOverflow.ellipsis,
//                                     fontFamily: ColorFamily.fontsSFProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   tripdetails.data!.addOnDiesel!.petrolStation
//                                       .toString(),
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: MyColor.black,
//                                     // overflow: TextOverflow.ellipsis,
//                                     fontFamily: ColorFamily.fontsSFProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }

//   Future<Tripdetails> tripdetialsGet(
//       BuildContext context, String truckId, String tripId) async {
//     // Utility.progressloadingDialog(context, true);
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
//       HttpLogger(logLevel: LogLevel.BODY),
//     ]);

//     var response = await http.get(
//         Uri.parse(
//             "${ApiServer.tripdetailsapi}truck_id=$truckId&trip_id=$tripId"),
//         headers: {
//           "content-type": "application/json",
//           "accept": "application/json",
//           "Authorization":
//               "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
//         });

//     Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

//     loading1 = true;
//     if (jsonResponse['status'] == true) {
//       tripdetails = Tripdetails.fromJson(jsonResponse);

//       if (tripdetails.data!.status.toString() == "Accepted") {
//         // indexbutton = 1;

//         setState(() {});
//       }
//       setState(() {
//         loading1 = false;
//       });
//     } else {
//       tripdetails = Tripdetails.fromJson(jsonResponse);
//       setState(() {
//         loading1 = false;
//       });
//     }

//     return Tripdetails.fromJson(jsonDecode(response.body));
//   }
// }
