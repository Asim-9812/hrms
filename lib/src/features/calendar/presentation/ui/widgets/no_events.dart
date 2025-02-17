
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';

class NoEvents extends StatelessWidget {
  const NoEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final focusedDay = DateTime.now();
    final firstDay = DateTime(2025,1,1);
    final lastDay = DateTime(2025,12,31);


    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: firstDay,
      lastDay: lastDay,
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: bh2,
          leftChevronIcon: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(Icons.chevron_left_rounded,color: MyColors.white,),
          ),
          rightChevronIcon: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(Icons.chevron_right_rounded,color: MyColors.white,),
          )
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: wh3,
          weekdayStyle: wh3,
          decoration: BoxDecoration(
              color: MyColors.primary
          )
      ),
      daysOfWeekHeight: 50,
      calendarStyle: CalendarStyle(
          defaultTextStyle: br1,
          weekendTextStyle: TextStyle(color: MyColors.red,fontWeight: FontWeight.w500,fontSize: 16),
          holidayTextStyle: TextStyle(color: MyColors.red,fontWeight: FontWeight.w500,fontSize: 16),
          holidayDecoration: BoxDecoration(),
          markerDecoration: BoxDecoration(
              color: MyColors.primary,
              shape: BoxShape.circle
          ),
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
              color: MyColors.yellow
          ),
          todayDecoration: BoxDecoration(
              color: MyColors.primary
          ),
          todayTextStyle: TextStyle(color: MyColors.white,fontWeight: FontWeight.w500,fontSize: 16)
      ),
    );
  }
}
