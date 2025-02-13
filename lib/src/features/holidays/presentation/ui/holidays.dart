




import 'package:flutter/material.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/holidays/presentation/ui/widgets/holidays_list.dart';
import 'package:hrm/src/features/holidays/presentation/ui/widgets/month_picker.dart';

class Holidays extends StatelessWidget {
  const Holidays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonNavBar(name: 'Upcoming Holidays'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          MonthPicker(),
          HolidaysList()
        ],
      ),
    );
  }
}
