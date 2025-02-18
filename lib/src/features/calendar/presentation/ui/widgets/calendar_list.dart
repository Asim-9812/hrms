


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/calendar/presentation/ui/widgets/focused_event.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../../core/widgets/common_widgets.dart';
import '../../../application/controller/calendar_controller.dart';
import '../../../domain/model/calendar_model.dart';

class CalendarList extends ConsumerWidget {
  final List<CalendarModel> calendarData;
  const CalendarList({required this.calendarData, super.key});

  @override
  Widget build(BuildContext context, ref) {

    final focusedDay = ref.watch(calendarController).selectedDate;
    final calendarList = calendarData.where((e)=> e.startDate.year == focusedDay.year && e.startDate.month == focusedDay.month).toList();



    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            FocusedEvent(calendarData: calendarData),
            Divider(
              color: MyColors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Events',style: bh1,),
                  h10,
                  ...List.generate(calendarList.length, (index){
                    final event = calendarList[index];
                    final date = event.startDate;
                    final day = DateFormat('EEEE').format(date);
                    final month_day = DateFormat('MMM dd').format(date);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Material(
                        child: ListTile(
                          tileColor: MyColors.lightGrey,
                          // contentPadding: EdgeInsets.zero,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          leading: BulletinPoint(color: event.eventType == 1 ? MyColors.red : MyColors.primary),
                          title: Text(event.title,style: bh2,maxLines: 1,),
                          subtitle: Text(event.description,style: br2,maxLines: 1,),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(month_day,style: bh2,maxLines: 1,),
                              Text(day,style: br3,maxLines: 1,),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
