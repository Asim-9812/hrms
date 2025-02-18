


import 'package:flutter/material.dart';

import '../../../../core/widgets/common_widgets.dart';
import 'widgets/calendar_ui.dart';

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
