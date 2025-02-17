


import 'package:flutter/material.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/utils/shimmers.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/calendar/presentation/ui/widgets/calendar_ui.dart';
import 'package:hrm/src/features/events/data/sample_events.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';

class HrCalendar extends StatelessWidget {
  const HrCalendar({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CommonNavBar(name: 'Calendar'),
      body: CalendarUi(),
    );
  }
}
