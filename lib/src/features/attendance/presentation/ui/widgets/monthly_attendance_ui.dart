



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/utils/shimmers.dart';
import 'package:hrm/src/features/attendance/application/controller/attendance_controller.dart';
import 'package:hrm/src/features/attendance/application/provider/attendance_provider.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/utils/router.dart';
import '../../../../../core/widgets/common_widgets.dart';
import '../attendance_search.dart';

class MonthlyAttendanceUi extends ConsumerWidget {
  final DateTime dateTime;
  const MonthlyAttendanceUi({required this.dateTime,super.key});

  @override
  Widget build(BuildContext context, ref) {

    final month = DateFormat('MMM').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);
    final monthlyStatusAsyncValue = ref.watch(attendanceStatusProvider(dateTime));

    return monthlyStatusAsyncValue.when(
        data: (status){
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Material(
              color: MyColors.white,
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 16),
                tileColor: MyColors.lightGrey,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                ),
                onTap: (){
                  ref.read(attendanceController.notifier).changeYear(dateTime.year);
                  ref.read(attendanceController.notifier).changeMonth(dateTime.month);
                  routeTo(context, AttendanceSearch());
                },
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(status.month,style: bh2),
                    Text(status.year.toString(),style: br2,)
                  ],
                ),

                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VertDivider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Total Days', style: br2,),
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
                    Icon(Icons.chevron_right_rounded),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error,stack){
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Material(
              color: MyColors.white,
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 16),
                tileColor: MyColors.lightGrey,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                ),
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(month,style: bh2),
                    Text(year.toString(),style: br2,)
                  ],
                ),
                titleAlignment: ListTileTitleAlignment.center,
                title: Text('$error'),
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
