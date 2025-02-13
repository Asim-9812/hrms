


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/utils/shimmers.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/departments/application/providers/department_providers.dart';
import 'package:hrm/src/features/departments/data/list_of_days.dart';
import 'package:hrm/src/features/departments/domain/model/department_model.dart';
import 'package:hrm/src/features/departments/presentation/ui/widgets/department_notice_list.dart';
import 'package:hrm/src/features/departments/presentation/ui/widgets/employees_by_department_list.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';

class DepartmentDetails extends ConsumerWidget {
  final DepartmentModel department;
  const DepartmentDetails({required this.department ,super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<int> workingDaysIndexes = department.workingDays.split(',').map((e) => int.parse(e)).toList();

    // Map indexes to weekList names
    List<String> workingDaysNames = workingDaysIndexes.map((index) => weekList[index]).toList();



    return Scaffold(
      appBar: CommonNavBar(name: department.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${department.name} department',style: bh2,maxLines: 2,),
              h10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.schedule,color: MyColors.primary,),
                  w10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Working hours (${department.workingHour} hrs)',style: bh3,maxLines: 1,),
                        Text('${department.startTime} to ${department.endTime}',style: bh2,maxLines: 2,),
                      ],
                    ),
                  ),
                ],
              ),
              h10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.event,color: MyColors.primary,),
                  w10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Working days',style: bh3,maxLines: 1,),
                        h06,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: workingDaysNames.map((e)=>Container(
                              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                              margin: EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                color: MyColors.lightGrey,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: Text(e,style: br1,),
                            )).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 30,
              ),
              EmployeesByDepartment(),
              h20,
              DepartmentNotices(),
              h100,
              h100,
              h100,
            ],
          ),
        ),
      ),
    );
  }
}
