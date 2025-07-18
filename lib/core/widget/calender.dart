import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: _selectedDate,
      onDateChange: (selectedDate) {
        setState(() {
          _selectedDate = selectedDate;
        });
      },
      headerProps: const EasyHeaderProps(
        showHeader: false, // 👈 Hide the "July 2025" header
      ),
      dayProps: EasyDayProps(
        height: 80,
        width: 60,
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          dayStrStyle: TextStyle(color: Colors.blue, fontSize: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          dayNumStyle: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        inactiveDayStyle: DayStyle(
          dayStrStyle: TextStyle(color: Colors.white),
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20)),
          dayNumStyle: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
