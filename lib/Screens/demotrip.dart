// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:pretty_http_logger/pretty_http_logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:truckmanagement/Model/tripdetailsmodel.dart';
// import 'package:truckmanagement/Screens/large_images.dart';
// import 'package:truckmanagement/constant/AppColor/app_colors.dart';
// import 'package:truckmanagement/constant/app_fontfamily.dart';
// import 'dart:convert' as convert;
// import '../constant/apiconstant.dart';

// class DemoTripDetials extends StatefulWidget {
//   final String? tripId;
//   final String? truckId;
//   const DemoTripDetials({super.key, this.tripId, this.truckId});

//   @override
//   State<DemoTripDetials> createState() => _DemoTripDetialsState();
// }

// class _DemoTripDetialsState extends State<DemoTripDetials> {
//   Tripdetails tripdetails = Tripdetails();
//   bool loading1 = true;
//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) => tripdetialsGet(
//         context, widget.truckId.toString(), widget.tripId.toString()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screens = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: MyColor.greyText),
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Repairs",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: MyColor.black,
//                               fontFamily: ColorFamily.fontsSFProDisplay,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             // color: Colors.amber,
//                             // height: screens.height * 0.08,
//                             width: screens.width * 0.20,
//                             child: const Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Photos",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: MyColor.greyText,
//                                     fontFamily: ColorFamily.fontsSFProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             // color: Colors.amber,
//                             // height: screens.height * 0.08,
//                             width: screens.width * 0.20,
//                             child: const Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Shop Name",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: MyColor.greyText,
//                                     fontFamily: ColorFamily.fontsSFProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Repair Name",
//                                 style: TextStyle(
//                                   // fontSize: 14,
//                                   color: MyColor.greyText,
//                                   fontFamily: ColorFamily.fontsSFProDisplay,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             // color: Colors.amber,
//                             // height: screens.height * 0.08,
//                             width: screens.width * 0.20,
//                             child: const Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Repair Cost",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: MyColor.greyText,
//                                     fontFamily: ColorFamily.fontsSFProDisplay,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Divider(
//                         color: MyColor.greyText,
//                         thickness: 1,
//                         indent: 2,
//                         endIndent: 2,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       ListView.builder(
//                         physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: tripdetails.data!.repairs!.length,
//                         itemBuilder: (BuildContext context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(2.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     SizedBox(
//                                       // color: Colors.amber,
//                                       width: screens.width * 0.20,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Container(
//                                             height: 40,
//                                             width: 40,
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                   width: 1,
//                                                   color: MyColor.button),
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(10)),
//                                             ),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         LargeImages(
//                                                       imagesUrl: tripdetails
//                                                           .data!
//                                                           .repairs![index]
//                                                           .uploadBill
//                                                           .toString(),
//                                                       nameProperty:
//                                                           "Add On Diesel",
//                                                     ),
//                                                   ),
//                                                 );
//                                               },
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     const BorderRadius.all(
//                                                         Radius.circular(09)),
//                                                 child: CachedNetworkImage(
//                                                   imageUrl: tripdetails
//                                                       .data!
//                                                       .repairs![index]
//                                                       .uploadBill
//                                                       .toString(),
//                                                   progressIndicatorBuilder:
//                                                       (context, url,
//                                                               downloadProgress) =>
//                                                           Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             8.0),
//                                                     child:
//                                                         CircularProgressIndicator(
//                                                       color: MyColor.button,
//                                                       value: downloadProgress
//                                                           .progress,
//                                                     ),
//                                                   ),
//                                                   errorWidget: (context, url,
//                                                           error) =>
//                                                       const Icon(Icons.error),
//                                                   fit: BoxFit.fill,
//                                                   height: screens.height * 0.08,
//                                                   width: screens.width * 0.08,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       // color: Colors.amber,
//                                       // height: screens.height * 0.08,
//                                       width: screens.width * 0.20,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               tripdetails.data!.repairs![index]
//                                                   .shopName
//                                                   .toString(),
//                                               style: const TextStyle(
//                                                 fontSize: 14,
//                                                 color: MyColor.black,

//                                                 // overflow: TextOverflow.ellipsis,
//                                                 fontFamily: ColorFamily
//                                                     .fontsSFProDisplay,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       // color: Colors.amber,
//                                       // height: screens.height * 0.08,
//                                       width: screens.width * 0.20,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               tripdetails.data!.repairs![index]
//                                                   .repairName
//                                                   .toString(),
//                                               style: const TextStyle(
//                                                 fontSize: 14,
//                                                 color: MyColor.black,

//                                                 // overflow: TextOverflow.ellipsis,
//                                                 fontFamily: ColorFamily
//                                                     .fontsSFProDisplay,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),

//                                     SizedBox(
//                                       // color: Colors.amber,
//                                       // height: screens.height * 0.08,
//                                       width: screens.width * 0.17,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               tripdetails.data!.repairs![index]
//                                                   .repairCost
//                                                   .toString(),
//                                               style: const TextStyle(
//                                                 fontSize: 14,
//                                                 color: MyColor.black,

//                                                 // overflow: TextOverflow.ellipsis,
//                                                 fontFamily: ColorFamily
//                                                     .fontsSFProDisplay,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     // Content below the Divider
//                                   ],
//                                 ),
//                                 const Divider(
//                                   color: MyColor.greyText,
//                                   thickness: 1,
//                                   indent: 2,
//                                   endIndent: 2,
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 // color: Colors.amber,
//                                 // height: screens.height * 0.08,
//                                 width: screens.width * 0.20,
//                                 child: const Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Photos",
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: MyColor.greyText,
//                                         fontFamily:
//                                             ColorFamily.fontsSFProDisplay,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Spare Name",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: MyColor.greyText,
//                                       fontFamily: ColorFamily.fontsSFProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Spare Cost",
//                                     style: TextStyle(
//                                       // fontSize: 14,
//                                       color: MyColor.greyText,
//                                       fontFamily: ColorFamily.fontsSFProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Total Amount",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: MyColor.greyText,
//                                       fontFamily: ColorFamily.fontsSFProDisplay,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const Divider(
//                             color: MyColor.greyText,
//                             thickness: 1,
//                             indent: 2,
//                             endIndent: 2,
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           ListView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: tripdetails.data!.repairs!.length,
//                             itemBuilder: (BuildContext context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(2.0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         SizedBox(
//                                           // color: Colors.amber,
//                                           width: screens.width * 0.20,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Container(
//                                                 height: 40,
//                                                 width: 40,
//                                                 decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                       width: 1,
//                                                       color: MyColor.button),
//                                                   borderRadius:
//                                                       const BorderRadius.all(
//                                                           Radius.circular(10)),
//                                                 ),
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             LargeImages(
//                                                           imagesUrl: tripdetails
//                                                               .data!
//                                                               .repairs![index]
//                                                               .uploadBill
//                                                               .toString(),
//                                                           nameProperty:
//                                                               "Repairs",
//                                                         ),
//                                                       ),
//                                                     );
//                                                   },
//                                                   child: ClipRRect(
//                                                     borderRadius:
//                                                         const BorderRadius.all(
//                                                             Radius.circular(
//                                                                 09)),
//                                                     child: CachedNetworkImage(
//                                                       imageUrl: tripdetails
//                                                           .data!
//                                                           .repairs![index]
//                                                           .uploadBill
//                                                           .toString(),
//                                                       progressIndicatorBuilder:
//                                                           (context, url,
//                                                                   downloadProgress) =>
//                                                               Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(8.0),
//                                                         child:
//                                                             CircularProgressIndicator(
//                                                           color: MyColor.button,
//                                                           value:
//                                                               downloadProgress
//                                                                   .progress,
//                                                         ),
//                                                       ),
//                                                       errorWidget: (context,
//                                                               url, error) =>
//                                                           const Icon(
//                                                               Icons.error),
//                                                       fit: BoxFit.fill,
//                                                       height:
//                                                           screens.height * 0.08,
//                                                       width:
//                                                           screens.width * 0.08,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           // color: Colors.amber,
//                                           // height: screens.height * 0.08,
//                                           width: screens.width * 0.20,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Expanded(
//                                                 child: Text(
//                                                   tripdetails.data!
//                                                       .repairs![index].spareName
//                                                       .toString(),
//                                                   style: const TextStyle(
//                                                     fontSize: 14,
//                                                     color: MyColor.black,

//                                                     // overflow: TextOverflow.ellipsis,
//                                                     fontFamily: ColorFamily
//                                                         .fontsSFProDisplay,
//                                                     fontWeight: FontWeight.w400,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           // color: Colors.amber,
//                                           // height: screens.height * 0.08,
//                                           width: screens.width * 0.20,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Expanded(
//                                                 child: Text(
//                                                   tripdetails.data!
//                                                       .repairs![index].spareCost
//                                                       .toString(),
//                                                   style: const TextStyle(
//                                                     fontSize: 14,
//                                                     color: MyColor.black,

//                                                     // overflow: TextOverflow.ellipsis,
//                                                     fontFamily: ColorFamily
//                                                         .fontsSFProDisplay,
//                                                     fontWeight: FontWeight.w400,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),

//                                         SizedBox(
//                                           // color: Colors.amber,
//                                           // height: screens.height * 0.08,
//                                           width: screens.width * 0.17,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Expanded(
//                                                 child: Text(
//                                                   tripdetails
//                                                       .data!
//                                                       .repairs![index]
//                                                       .totalAmount
//                                                       .toString(),
//                                                   style: const TextStyle(
//                                                     fontSize: 14,
//                                                     color: MyColor.black,

//                                                     // overflow: TextOverflow.ellipsis,
//                                                     fontFamily: ColorFamily
//                                                         .fontsSFProDisplay,
//                                                     fontWeight: FontWeight.w400,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         // Content below the Divider
//                                       ],
//                                     ),
//                                     tripdetails.data!.repairs!.length ==
//                                             index + 1
//                                         ? Container()
//                                         : const Divider(
//                                             color: MyColor.greyText,
//                                             thickness: 1,
//                                             indent: 2,
//                                             endIndent: 2,
//                                           ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<Tripdetails> tripdetialsGet(
//       BuildContext context, String truckId, String tripId) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
//       HttpLogger(logLevel: LogLevel.BODY),
//     ]);

//     var response = await http.get(
//       Uri.parse(
//         "${ApiServer.tripdetailsapi}truck_id=$truckId&trip_id=$tripId",
//       ),
//       headers: {
//         "content-type": "application/json",
//         "accept": "application/json",
//         "Authorization":
//             "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
//       },
//     );

//     Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

//     loading1 = true;
//     if (jsonResponse['status'] == true) {
//       tripdetails = Tripdetails.fromJson(jsonResponse);

//       if (tripdetails.data!.status.toString() == "Accepted") {
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
