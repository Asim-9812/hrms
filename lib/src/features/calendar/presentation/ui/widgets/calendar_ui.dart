

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/calendar/application/controller/calendar_controller.dart';
import 'package:hrm/src/features/calendar/application/providers/calendar_providers.dart';
import 'package:hrm/src/features/calendar/presentation/ui/widgets/calendar_list.dart';
import 'package:hrm/src/features/calendar/presentation/ui/widgets/event_calendar.dart';
import 'package:hrm/src/features/calendar/presentation/ui/widgets/loading_calendar.dart';
import 'package:hrm/src/features/calendar/presentation/ui/widgets/no_events.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../events/data/sample_events.dart';

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
        error: (error,stack)=>NoEvents(),
        loading: ()=>LoadingCalendar()
    );
  }
}
