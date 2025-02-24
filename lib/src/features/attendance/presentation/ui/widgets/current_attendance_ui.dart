



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/utils/shimmers.dart';
import 'package:hrm/src/features/attendance/application/provider/attendance_provider.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/utils/router.dart';
import '../../../../../core/widgets/common_widgets.dart';
import '../../../application/controller/attendance_controller.dart';
import '../attendance_search.dart';

class CurrentAttendanceUi extends ConsumerWidget {
  final DateTime dateTime;
  const CurrentAttendanceUi({required this.dateTime,super.key});

  @override
  Widget build(BuildContext context, ref) {
    final monthlyStatusAsyncValue = ref.watch(attendanceStatusProvider(dateTime));

    return monthlyStatusAsyncValue.when(
        data: (status){
          final aggregate = (status.attendedDays/status.totalDays) * 100;
          return Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  ref.read(attendanceController.notifier).changeYear(dateTime.year);
                  ref.read(attendanceController.notifier).changeMonth(dateTime.month);
                  routeTo(context, AttendanceSearch());
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total Days', style: br2,maxLines: 1,),
                          Text('${status.totalDays}', style: bh2,),
                        ],
                      ),
                      VertDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Attended', style: br2,maxLines: 1,),
                          Text('${status.attendedDays}', style: bh2,),
                        ],
                      ),
                      VertDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Leave', style: br2,maxLines: 1,),
                          Text('${status.leave}', style: bh2,),
                        ],
                      ),
                      VertDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total %', style: br2,maxLines: 1,),
                          Text('$aggregate%', style: bh2,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        error: (error,stack){
          return Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()=>routeTo(context, AttendanceSearch()),
                child: SizedBox(
                  width: double.infinity,
                  child: Text('Failed to fetch data.'),
                ),
              ),
            ),
          );
        },
        loading: ()=>Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: commonShimmer(
            width: double.infinity,
            radius: 8,
            height: 50,
          ),
        )
    );
  }
}
