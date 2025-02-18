


import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../../core/utils/shimmers.dart';

class LoadingCalendar extends StatelessWidget {
  const LoadingCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final focusedDay = DateTime.now();
    final firstDay = DateTime(2025,1,1);
    final lastDay = DateTime(2025,12,31);
    final todayStyle = TextStyle(color: MyColors.white,fontWeight: FontWeight.w500,fontSize: 16);
    final weekStyle = TextStyle(color: MyColors.primary,fontWeight: FontWeight.w500,fontSize: 12);
    final weekendStyle = TextStyle(color: MyColors.red,fontWeight: FontWeight.w500,fontSize: 12);


    return Column(
      children: [
        TableCalendar(
          focusedDay: focusedDay,
          firstDay: firstDay,
          lastDay: lastDay,
          headerStyle: HeaderStyle(
              headerPadding: EdgeInsets.zero,
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
            weekendStyle: weekendStyle,
            weekdayStyle: weekStyle,
          ),
          rowHeight: 40,
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            defaultTextStyle: br1,
            weekendTextStyle: weekendStyle,
            isTodayHighlighted: true,
            todayDecoration: BoxDecoration(color: MyColors.primary),
            todayTextStyle: todayStyle,
            markersMaxCount: 3, // Ensures multiple markers are properly displayed
            markerDecoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            markersAlignment: Alignment.bottomCenter, // Adjust marker positioning
          ),
        ),
        h20,
        commonShimmer(
            radius: 8,
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 16)
        ),
        h10,
        commonShimmer(
            radius: 8,
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 16)
        ),
        h10,
        commonShimmer(
            radius: 8,
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 16)
        ),
      ],
    );
  }
}
