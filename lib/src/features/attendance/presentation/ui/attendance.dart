




import 'package:flutter/material.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/utils/router.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/attendance/data/sample_data/monthly_data.dart';
import 'package:hrm/src/features/attendance/presentation/ui/attendance_search.dart';
import 'package:intl/intl.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonNavBar(name: 'Attendance'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()=>routeTo(context, AttendanceSearch()),
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
                              Text('14', style: bh2,),
                            ],
                          ),
                          VertDivider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Attended', style: br2,maxLines: 1,),
                              Text('14', style: bh2,),
                            ],
                          ),
                          VertDivider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Leave', style: br2,maxLines: 1,),
                              Text('0', style: bh2,),
                            ],
                          ),
                          VertDivider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Total %', style: br2,maxLines: 1,),
                              Text('100%', style: bh2,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              h10,
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Total Leave', style: br2,maxLines: 1,),
                            Text('20', style: bh2,),
                          ],
                        ),
                        VertDivider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Taken', style: br2,maxLines: 1,),
                            Text('12', style: bh2,),
                          ],
                        ),
                        VertDivider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Remaining', style: br2,maxLines: 1,),
                            Text('8', style: bh2,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              h20,
              ...List.generate(sampleAttendanceList.length, (index){
                final attendanceData = sampleAttendanceList[index];
                final date = DateFormat('yyyy-MM-dd').parse(attendanceData['startDate']);
                final month = DateFormat('MMM').format(date);
                final year = DateFormat('yyyy').format(date);
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
                      onTap: ()=>routeTo(context, AttendanceSearch()),
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(month,style: bh2),
                          Text(year,style: br2,)
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
                              Text('${attendanceData['totalDays']}', style: bh2,),
                            ],
                          ),
                          VertDivider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Attended', style: br2,maxLines: 1,),
                              Text('${attendanceData['attendedDays']}', style: bh2,),
                            ],
                          ),
                          VertDivider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Leave', style: br2,maxLines: 1,),
                              Text('${attendanceData['leave']}', style: bh2,),
                            ],
                          ),
                          Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
