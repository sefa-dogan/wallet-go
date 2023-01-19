import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class Calendar extends StatefulWidget {
  Calendar({super.key});
  // final CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    const radiusValue = AppIntValues.TEN;

    return TableCalendar(
      dayHitTestBehavior: HitTestBehavior.translucent,
      focusedDay: widget._focusedDay,
      firstDay: DateTime(2020, 01, 01),
      lastDay: DateTime(2030),
      currentDay: today,
      headerStyle: const HeaderStyle(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radiusValue),
                  topRight: Radius.circular(radiusValue))),
          titleCentered: true,
          formatButtonVisible: false),
      daysOfWeekVisible: true,
      daysOfWeekStyle: const DaysOfWeekStyle(
          weekendStyle: TextStyle(color: AppColor.appBlue),
          weekdayStyle: TextStyle(color: AppColor.appBlue)),
      selectedDayPredicate: (day) => isSameDay(day, today),
      onDaySelected: (selectedDay, focusedDay) {
          widget._focusedDay = selectedDay;
        setState(() {
        });
      },
      // onFormatChanged: (format) {
      //   if (widget._calendarFormat != format) {
      //     // Call `setState()` when updating calendar format
      //     setState(() {
      //       widget._calendarFormat = format;
      //     });
      //   }
      // },
      // onPageChanged: (focusedDay) {
      //   // No need to call `setState()` here
      //   widget._focusedDay = focusedDay;
      // },
      /*
                      */
    );
  }
}
