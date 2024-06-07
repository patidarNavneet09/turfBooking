import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';

class TableCalender extends StatefulWidget {
  const TableCalender({super.key});

  @override
  State<TableCalender> createState() => _TableCalenderState();
}

class _TableCalenderState extends State<TableCalender> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [];

  @override
  Widget build(BuildContext context) {
    final config = CalendarDatePicker2Config(
        calendarType: CalendarDatePicker2Type.multi,
        selectedDayHighlightColor: Colors.green,
        dayBuilder: ({
          required date,
          textStyle,
          decoration,
          isSelected,
          isDisabled,
          isToday,
        }) {
          Widget? dayWidget;
          if (_multiDatePickerValueWithDefaultValue.contains(date)) {
            dayWidget = Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Text(
                        MaterialLocalizations.of(context)
                            .formatDecimal(date.day),
                        style: textStyle,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 27.5),
                      //   child: Container(
                      //     height: 4,
                      //     width: 10,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(5),
                      //       color: isSelected == true
                      //           ? Colors.white
                      //           : Colors.grey[500],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          } else if (DateTime.now().day == date.day) {
            dayWidget = InkWell(
              onTap: () {},
              highlightColor: Colors.amber,
              focusColor: Colors.amber,
              hoverColor: Colors.amber,
              splashColor: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: MyColor.bluebarry,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Text(
                          MaterialLocalizations.of(context)
                              .formatDecimal(date.day),
                          style: const TextStyle(color: Colors.white),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 27.5),
                        //   child: Container(
                        //     height: 4,
                        //     width: 10,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: isSelected == true
                        //           ? Colors.white
                        //           : Colors.grey[500],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return dayWidget;
        },
        disableModePicker: false,
        calendarViewMode: DatePickerMode.day,
        centerAlignModePicker: true,
        customModePickerIcon: Container(),
        lastMonthIcon: const Card(
          surfaceTintColor: Colors.white,
          shadowColor: MyColor.cardshadow,
          elevation: 1,
          child: SizedBox(
              height: 35,
              width: 35,
              child: Padding(
                padding: EdgeInsets.only(left: 08),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 22,
                ),
              )),
        ),
        nextMonthIcon: const Card(
          surfaceTintColor: Colors.white,
          shadowColor: MyColor.cardshadow,
          elevation: 1,
          child: SizedBox(
              height: 35,
              width: 35,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 22,
              )),
        ));
    var screen = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            // TableCalendar(
            //   firstDay: DateTime(2000),
            //   lastDay: DateTime(2050),
            //   calendarStyle: const CalendarStyle(
            //       disabledDecoration: BoxDecoration(
            //           shape: BoxShape.rectangle,
            //           color: MyColor.transparent,
            //           borderRadius: BorderRadius.all(Radius.circular(5))),
            //       defaultDecoration: BoxDecoration(
            //           shape: BoxShape.rectangle,
            //           color: MyColor.transparent,
            //           borderRadius: BorderRadius.all(Radius.circular(5))),
            //       selectedDecoration: BoxDecoration(
            //           color: MyColor.green,
            //           shape: BoxShape.rectangle,
            //           borderRadius: BorderRadius.all(Radius.circular(5))),
            //       todayDecoration: BoxDecoration(
            //           color: MyColor.bluebarry,
            //           shape: BoxShape.rectangle,
            //           borderRadius: BorderRadius.all(Radius.circular(5)))),
            //   headerStyle: const HeaderStyle(
            //       formatButtonVisible: false,
            //       titleCentered: true,
            //       leftChevronIcon: Card(
            //         surfaceTintColor: Colors.white,
            //         shadowColor: MyColor.cardshadow,
            //         elevation: 1,
            //         child: SizedBox(
            //             height: 35,
            //             width: 35,
            //             child: Padding(
            //               padding: EdgeInsets.only(left: 08),
            //               child: Icon(
            //                 Icons.arrow_back_ios,
            //                 size: 22,
            //               ),
            //             )),
            //       ),
            //       rightChevronIcon: Card(
            //         surfaceTintColor: Colors.white,
            //         shadowColor: MyColor.cardshadow,
            //         elevation: 1,
            //         child: SizedBox(
            //             height: 35,
            //             width: 35,
            //             child: Icon(
            //               Icons.arrow_forward_ios,
            //               size: 22,
            //             )),
            //       )),
            //   focusedDay: _focusedDay,
            //   calendarFormat: _calendarFormat,
            //   selectedDayPredicate: (day) {
            //     // Use `selectedDayPredicate` to determine which day is currently selected.
            //     // If this returns true, then `day` will be marked as selected.

            //     // Using `isSameDay` is recommended to disregard
            //     // the time-part of compared DateTime objects.
            //     return isSameDay(_selectedDay, day);
            //   },
            //   onDaySelected: (selectedDay, focusedDay) {
            //     if (!isSameDay(_selectedDay, selectedDay)) {
            //       // Call `setState()` when updating the selected day
            //       setState(() {
            //         _selectedDay = selectedDay;
            //         _focusedDay = focusedDay;
            //       });
            //     }
            //   },
            //   onFormatChanged: (format) {
            //     if (_calendarFormat != format) {
            //       // Call `setState()` when updating calendar format
            //       setState(() {
            //         _calendarFormat = format;
            //       });
            //     }
            //   },
            //   onPageChanged: (focusedDay) {
            //     // No need to call `setState()` here
            //     _focusedDay = focusedDay;
            //   },
            // ),
            Theme(
              data: ThemeData(
                materialTapTargetSize: MaterialTapTargetSize
                    .shrinkWrap, // This will remove the tap target size effect
                buttonTheme: const ButtonThemeData(
                  highlightColor: Colors
                      .white, // Set the highlight elevation to 0 to remove tap action effect
                  hoverColor: Colors.white,
                ),
              ),
              child: CalendarDatePicker2(
                onDisplayedMonthChanged: (value) {},
                displayedMonthDate: DateTime.now(),
                config: config,
                value: _multiDatePickerValueWithDefaultValue,
                onValueChanged: (dates) => setState(
                    () => _multiDatePickerValueWithDefaultValue = dates),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  MyString.bookings.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: MyColor.black,
                    fontFamily: ColorFamily.fontsPopinsDisplay,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            ListView.builder(
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
                                              width: 4, color: MyColor.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
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
                                      const Text(
                                        "John Doe",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: MyColor.black,
                                          fontFamily:
                                              ColorFamily.fontsPopinsDisplay,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Wednesday 22 April 2023',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: MyColor.black,
                                                fontFamily: ColorFamily
                                                    .fontsPopinsDisplay,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            // Image.asset(
                                            //   "assets/images/call_icon.png",
                                            //   width: 20,
                                            // )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '1 Slot 11:00 am - 12:00 pm',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: MyColor.black,
                                                fontFamily: ColorFamily
                                                    .fontsPopinsDisplay,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            // Image.asset(
                                            //   "assets/images/call_icon.png",
                                            //   width: 20,
                                            // )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Rs 1200',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: MyColor.green,
                                            fontFamily:
                                                ColorFamily.fontsPopinsDisplay,
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
