


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/calendar/domain/model/calendar_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../application/controller/calendar_controller.dart';

class EventCalendar extends ConsumerWidget {
  final List<CalendarModel> calendarData;
  const EventCalendar({required this.calendarData,super.key});

  @override
  Widget build(BuildContext context, ref) {

    final now = DateTime.now();
    final focusedDay = ref.watch(calendarController).selectedDate;
    final firstDay = ref.watch(calendarController).firstDay;
    final lastDay = ref.watch(calendarController).lastDay;
    final todayStyle = TextStyle(color: MyColors.white,fontWeight: FontWeight.w500,fontSize: 16);
    final weekStyle = TextStyle(color: MyColors.primary,fontWeight: FontWeight.w500,fontSize: 12);
    final weekendStyle = TextStyle(color: MyColors.red,fontWeight: FontWeight.w500,fontSize: 12);

    //
    // final eventList = calendarData.where((e)=>e.eventType == 2).toList();
    // final holidayList = calendarData.where((e)=>e.eventType == 1).toList();
    // final isHoliday = holidayList.any((e)=> isSameDay(e.startDate, focusedDay));
    final isToday = isSameDay(now, focusedDay);
    return TableCalendar(

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
        selectedDecoration: isToday
            ? BoxDecoration(color: MyColors.primary)
            : BoxDecoration(
          border: Border.all(color: MyColors.primary),
        ),
        selectedTextStyle: isToday ? todayStyle : br1,
        todayDecoration: BoxDecoration(color: MyColors.primary),
        todayTextStyle: todayStyle,
        markersMaxCount: 3, // Ensures multiple markers are properly displayed
        markerDecoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        markersAlignment: Alignment.bottomCenter, // Adjust marker positioning
      ),
      eventLoader: (day) {
        return calendarData.where((event) => isSameDay(event.startDate, day)).toList();
      },
      onDaySelected:(selectedDay, focusedDay) {
        ref.read(calendarController.notifier).changeDate(selectedDay);
      },
      selectedDayPredicate: (day) => isSameDay(day, focusedDay),
      onPageChanged: (focusedDay) {
        if(now.month == focusedDay.month && now.year == focusedDay.year){
          ref.read(calendarController.notifier).changeDate(now);
        }
        else{
          ref.read(calendarController.notifier).changeDate(focusedDay);
        }

      },
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          if (events.isNotEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: events.map((eventData) {
                CalendarModel event = eventData as CalendarModel;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 1),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: event.eventType == 1 ? MyColors.red : MyColors.primary,
                    shape: BoxShape.rectangle,
                  ),
                );
              }).toList(),
            );
          }
          return SizedBox(); // No marker if no events
        },
      ),
    );
  }
}
