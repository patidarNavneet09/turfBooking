import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:turfbooking/booking_summary.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:turfbooking/utils/mybuttons.dart';

class Schdulebooking extends StatefulWidget {
  const Schdulebooking({super.key});

  @override
  State<Schdulebooking> createState() => _SchdulebookingState();
}

class _SchdulebookingState extends State<Schdulebooking> {
  List formattedMonth = [];
  List formattedDate = [];
  List formattedweek = [];
  @override
  void initState() {
    ground.add(0);
    formattedMonth.clear();
    formattedDate.clear();
    formattedweek.clear();
    super.initState();
    DateTime currentDate = DateTime.now();

    // Create a list to store the dates
    List<DateTime> nextFiveDays = [];

    // Iterate to get the next five days
    for (int i = 0; i < 5; i++) {
      DateTime nextDate = currentDate.add(Duration(days: i));
      nextFiveDays.add(nextDate);
    }

    // Format and print the dates
    for (DateTime date in nextFiveDays) {
      formattedMonth.add(DateFormat('MMM ').format(date));
    }
    for (DateTime date in nextFiveDays) {
      formattedDate.add(DateFormat(' dd').format(date));
    }
    for (DateTime date in nextFiveDays) {
      formattedweek.add(DateFormat(' EEE').format(date));
    }
  }

  List ground = [];
  List timerdata = [];
  List timerdataBooked = [7, 14];
  int dateIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: buildMyNavBar(context),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0, // remove appbar shadow
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
          padding: const EdgeInsets.only(left: 15),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              backgroundColor: MyColor.pinklite,
              foregroundColor: MyColor.pinklite,
              radius: 08,
              child: Padding(
                padding: EdgeInsets.only(left: 8),
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
              SizedBox(
                width: screen.size.width * 0.90,
                height: 50,
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (timerdataBooked.contains(index)) {
                          } else if (ground.contains(index)) {
                            ground.remove(index);
                          } else {
                            ground.add(index);
                          }
                        });
                        // print(DateTime.now().toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          width: screen.size.width * 0.40,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: ground.contains(index)
                                ? Colors.green
                                : Colors.white,
                            border: Border.all(width: 1, color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "${MyString.ground.tr()} ${index + 1}",
                              style: TextStyle(
                                fontSize: 18,
                                color: ground.contains(index)
                                    ? Colors.white
                                    : MyColor.green,
                                fontFamily: ColorFamily.fontsPopinsDisplay,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dateIndex = 1;
                      });
                    },
                    child: Card(
                      elevation: 1,
                      color: Colors.white,
                      child: Container(
                        height: 60,
                        width: 48,
                        decoration: BoxDecoration(
                          color: dateIndex == 1 ? Colors.green : Colors.white,
                          border: Border.all(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                formattedMonth[0].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 1
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedDate[0].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 1
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedweek[0].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 1
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dateIndex = 2;
                      });
                    },
                    child: Card(
                      elevation: 1,
                      color: Colors.white,
                      child: Container(
                        height: 60,
                        width: 48,
                        decoration: BoxDecoration(
                          color: dateIndex == 2 ? Colors.green : Colors.white,
                          border: Border.all(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                formattedMonth[0].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 2
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedDate[1].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 2
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedweek[1].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 2
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dateIndex = 3;
                      });
                    },
                    child: Card(
                      elevation: 1,
                      color: Colors.white,
                      child: Container(
                        height: 60,
                        width: 48,
                        decoration: BoxDecoration(
                          color: dateIndex == 3 ? Colors.green : Colors.white,
                          border: Border.all(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                formattedMonth[2].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 3
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedDate[2].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 3
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedweek[2].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 3
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dateIndex = 4;
                      });
                    },
                    child: Card(
                      elevation: 1,
                      color: Colors.white,
                      child: Container(
                        height: 60,
                        width: 48,
                        decoration: BoxDecoration(
                          color: dateIndex == 4 ? Colors.green : Colors.white,
                          border: Border.all(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                formattedMonth[3].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 4
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedDate[3].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 4
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedweek[3].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 4
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dateIndex = 5;
                      });
                    },
                    child: Card(
                      elevation: 1,
                      color: Colors.white,
                      child: Container(
                        height: 60,
                        width: 48,
                        decoration: BoxDecoration(
                          color: dateIndex == 5 ? Colors.green : Colors.white,
                          border: Border.all(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                formattedMonth[4].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 5
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedDate[4].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 5
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedweek[4].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: dateIndex == 5
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate;
                      pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        //pickedDate output format => 2021-03-10 00:00:00.000
                        // var startDate =
                        //     DateFormat('dd/MM/yyyy').format(pickedDate);
                        setState(() {});
                        //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement
                      } else {}
                    },
                    child: SizedBox(
                        // color: Colors.amber,
                        height: 30,
                        width: 45,
                        child: Image.asset(
                          "assets/images/event.png",
                          color: Colors.green,
                          height: 40,
                          width: 40,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                  shrinkWrap: true,
                  children: List.generate(18, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (timerdata.contains(index)) {
                            timerdata.remove(index);
                          } else {
                            timerdata.add(index);
                          }
                        });
                      },
                      child: Card(
                        elevation: 1,
                        child: Container(
                          height: 60,
                          // width: 110,
                          decoration: BoxDecoration(
                            color: timerdataBooked.contains(index)
                                ? Colors.red
                                : timerdata.contains(index)
                                    ? Colors.green
                                    : const Color(0xffF1F1F1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "06:00 AM - 07:00 AM",
                                style: TextStyle(
                                  fontSize: 8,
                                  color: timerdata.contains(index) ||
                                          timerdataBooked.contains(index)
                                      ? Colors.white
                                      : MyColor.black,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "₹ 600",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: timerdata.contains(index) ||
                                          timerdataBooked.contains(index)
                                      ? Colors.white
                                      : MyColor.green,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "2 ${MyString.slots.tr()} - ₹ 1400",
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
                      fontSize: 16,
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
                      btnWidth: MediaQuery.of(context).size.width * 0.35,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BokkingSummary()));
                      },
                      name: MyString.continuee.tr()),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
