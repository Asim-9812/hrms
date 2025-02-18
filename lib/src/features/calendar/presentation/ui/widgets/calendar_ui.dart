

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../application/providers/calendar_providers.dart';
import 'calendar_list.dart';
import 'event_calendar.dart';
import 'loading_calendar.dart';

class CalendarUi extends ConsumerWidget {
  const CalendarUi({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final calendarAsyncValue = ref.watch(calendarProviders);


    return calendarAsyncValue.when(
        data: (calendarData){
          return Column(
            children: [
              EventCalendar(calendarData: calendarData),
              h20,
              Divider(
                color: MyColors.grey,
                height: 0,
              ),
              CalendarList(calendarData: calendarData)
            ],
          );
        },
        error: (error,stack)=>Text('$error'),
        // error: (error,stack)=>NoEvents(),
        loading: ()=>LoadingCalendar()
    );
  }
}
