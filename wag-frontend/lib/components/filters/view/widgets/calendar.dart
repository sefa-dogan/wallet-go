import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/filters/viewmodel/filters_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final viewmodel = locator<FiltersViewModel>();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      rangeSelectionMode: RangeSelectionMode.enforced,
      rangeStartDay: viewmodel.fromDate,
      rangeEndDay: viewmodel.toDate,
      onRangeSelected: (start, end, focusedDay) {
        viewmodel.fromDate = start;
        viewmodel.toDate = end;
        setState(() {});
      },
      focusedDay: DateTime.now(),
      firstDay: DateTime(2020),
      lastDay: DateTime(2030),
      headerStyle: const HeaderStyle(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          titleCentered: true,
          formatButtonVisible: false),
      daysOfWeekVisible: true,
      daysOfWeekStyle: const DaysOfWeekStyle(
          weekendStyle: TextStyle(color: AppColor.appBlue),
          weekdayStyle: TextStyle(color: AppColor.appBlue)),
    );
  }
}
