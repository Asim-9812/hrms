




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/utils/router.dart';
import 'package:hrm/src/core/utils/shimmers.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/attendance/application/controller/attendance_controller.dart';
import 'package:hrm/src/features/attendance/data/sample_data/monthly_data.dart';
import 'package:hrm/src/features/attendance/presentation/ui/attendance_search.dart';
import 'package:hrm/src/features/attendance/presentation/ui/widgets/current_attendance_ui.dart';
import 'package:hrm/src/features/attendance/presentation/ui/widgets/monthly_attendance_ui.dart';
import 'package:intl/intl.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';

class Attendance extends ConsumerWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final currentDate = ref.read(attendanceController).currentDate;

    return Scaffold(
      appBar: CommonNavBar(name: 'Attendance'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurrentAttendanceUi(dateTime: currentDate),
              // h10,
              // Card(
              //   margin: EdgeInsets.zero,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: SizedBox(
              //       width: double.infinity,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text('Total Leave', style: br2,maxLines: 1,),
              //               Text('20', style: bh2,),
              //             ],
              //           ),
              //           VertDivider(),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text('Taken', style: br2,maxLines: 1,),
              //               Text('12', style: bh2,),
              //             ],
              //           ),
              //           VertDivider(),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text('Remaining', style: br2,maxLines: 1,),
              //               Text('8', style: bh2,),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              h20,
              ...List.generate(11, (index) {
                final now = DateTime.now();
                final adjustedDate = DateTime(now.year, now.month - (index + 1), now.day);
                return MonthlyAttendanceUi(dateTime: adjustedDate);
              }),

            ],
          ),
        ),
      ),
    );
  }
}
