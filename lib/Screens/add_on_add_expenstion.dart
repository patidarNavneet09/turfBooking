// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:truckmanagement/Screens/addexpenstion.dart';
// import 'package:truckmanagement/Screens/addondiesel.dart';
// import 'package:truckmanagement/constant/AppColor/app_colors.dart';
// import 'package:truckmanagement/constant/app_fontfamily.dart';
// import 'package:truckmanagement/utils/mybuttons.dart';

// class AddonAddExpenstion extends StatefulWidget {
//   const AddonAddExpenstion({super.key});

//   @override
//   State<AddonAddExpenstion> createState() => _AddonAddExpenstionState();
// }

// class _AddonAddExpenstionState extends State<AddonAddExpenstion> {
//   String startDate = '';
//   String endDate = '';
//   int indexbutton = 0;
//   @override
//   Widget build(BuildContext context) {
//     var screens = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: Colors.white,
//         title: const Text(
//           "Trip Details",
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
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10, top: 09, right: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Trip Name",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.greyText,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 04,
//               ),
//               const Text(
//                 "Indore to Bhopal",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.black,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: screens.width * 0.03,
//                       ),
//                       InkWell(
//                         onTap: () async {
//                           DateTime? pickedDate;
//                           pickedDate = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(
//                                   2000), //DateTime.now() - not to allow to choose before today.
//                               lastDate: DateTime(2101));

//                           if (pickedDate != null) {
//                             //pickedDate output format => 2021-03-10 00:00:00.000
//                             startDate =
//                                 DateFormat('dd/MM/yyyy').format(pickedDate);
//                             setState(() {});
//                             //formatted date output using intl package =>  2021-03-16
//                             //you can implement different kind of Date Format here according to your requirement
//                           } else {}
//                         },
//                         child: SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: Image.asset("assets/images/calender.png")),
//                       ),
//                       SizedBox(
//                         width: screens.width * 0.05,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Start Date",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: MyColor.greyText,
//                               // overflow: TextOverflow.ellipsis,
//                               fontFamily: ColorFamily.fontsSFProDisplay,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 04,
//                           ),
//                           Text(
//                             startDate == "" ? "25/01/2024" : startDate,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: MyColor.black,
//                               // overflow: TextOverflow.ellipsis,
//                               fontFamily: ColorFamily.fontsSFProDisplay,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: screens.width * 0.03,
//                       ),
//                       InkWell(
//                         onTap: () async {
//                           DateTime? pickedDate;
//                           pickedDate = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(
//                                   2000), //DateTime.now() - not to allow to choose before today.
//                               lastDate: DateTime(2101));

//                           if (pickedDate != null) {
//                             //pickedDate output format => 2021-03-10 00:00:00.000
//                             endDate =
//                                 DateFormat('dd/MM/yyyy').format(pickedDate);
//                             setState(() {});
//                             //formatted date output using intl package =>  2021-03-16
//                             //you can implement different kind of Date Format here according to your requirement
//                           } else {}
//                           setState(() {});
//                         },
//                         child: SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: Image.asset("assets/images/calender.png")),
//                       ),
//                       SizedBox(
//                         width: screens.width * 0.05,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "End Date",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: MyColor.greyText,
//                               // overflow: TextOverflow.ellipsis,
//                               fontFamily: ColorFamily.fontsSFProDisplay,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 04,
//                           ),
//                           Text(
//                             endDate == "" ? "30/01/2024" : endDate,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: MyColor.black,
//                               // overflow: TextOverflow.ellipsis,
//                               fontFamily: ColorFamily.fontsSFProDisplay,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         width: screens.width * 0.12,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: screens.width * 0.03,
//                       ),
//                       SizedBox(
//                           height: 20,
//                           width: 20,
//                           child: Image.asset("assets/images/calender.png")),
//                       SizedBox(
//                         width: screens.width * 0.05,
//                       ),
//                       const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Loading Location",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: MyColor.greyText,
//                               // overflow: TextOverflow.ellipsis,
//                               fontFamily: ColorFamily.fontsSFProDisplay,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 04,
//                           ),
//                           Text(
//                             "Indore",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: MyColor.black,
//                               // overflow: TextOverflow.ellipsis,
//                               fontFamily: ColorFamily.fontsSFProDisplay,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: screens.width * 0.05,
//                       ),
//                       SizedBox(
//                           height: 20,
//                           width: 20,
//                           child: Image.asset("assets/images/calender.png")),
//                       SizedBox(
//                         width: screens.width * 0.05,
//                       ),
//                       const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Offloading Location",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: MyColor.greyText,
//                               // overflow: TextOverflow.ellipsis,
//                               fontFamily: ColorFamily.fontsSFProDisplay,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 04,
//                           ),
//                           Text(
//                             "Bhopal",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: MyColor.black,
//                               // overflow: TextOverflow.ellipsis,
//                               fontFamily: ColorFamily.fontsSFProDisplay,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         width: screens.width * 0.04,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 "Cargo Type",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.greyText,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 04,
//               ),
//               const Text(
//                 "General Cargo",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.black,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 "Select Truck",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.greyText,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 04,
//               ),
//               const Text(
//                 "Box Truck",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.black,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 "Weight Of Cargo",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.greyText,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 04,
//               ),
//               const Text(
//                 "125 KG",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.black,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 "Initial Diesel",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.greyText,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 04,
//               ),
//               const Text(
//                 "120 Liters",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.black,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 "Mileage Allowances",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.greyText,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 04,
//               ),
//               const Text(
//                 "\$${44}",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.black,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 "Movement Sheet ",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.greyText,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 04,
//               ),
//               const Text(
//                 "\$${50}",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.black,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 "Road Toll",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.greyText,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(
//                 height: 04,
//               ),
//               const Text(
//                 "\$${250}",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColor.black,
//                   // overflow: TextOverflow.ellipsis,
//                   fontFamily: ColorFamily.fontsSFProDisplay,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 30, bottom: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AppButton(
//                         textStyle: const TextStyle(
//                           color: MyColor.white,
//                           fontSize: 16,
//                           fontFamily: ColorFamily.fontsSFProDisplay,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         btnWidth: MediaQuery.of(context).size.width * 0.90,
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const AddOnDieselscreen()));
//                         },
//                         name: "Add On Diesel"),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10, bottom: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AppButton(
//                         textStyle: const TextStyle(
//                           color: MyColor.white,
//                           fontSize: 16,
//                           fontFamily: ColorFamily.fontsSFProDisplay,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         btnWidth: MediaQuery.of(context).size.width * 0.90,
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const AddExpension()));

//                           setState(() {});
//                         },
//                         name: "Add Expenses"),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
