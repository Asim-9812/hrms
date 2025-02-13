

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../../core/utils/shimmers.dart';
import '../../../application/providers/department_providers.dart';

class EmployeesByDepartment extends ConsumerWidget {
  const EmployeesByDepartment({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final employeesByDeptAsyncValue = ref.watch(employeeByDepartmentProviders);
    return employeesByDeptAsyncValue.when(
        data: (employeesData){
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Employees',style: bh2,maxLines: 1,),
                  Text('View all',style: TextStyle(color: MyColors.primary,fontWeight: FontWeight.w500),)
                ],
              ),
              h10,
              if(employeesData.isEmpty)
                Text('No Employees.',style: br1,),
              if(employeesData.isNotEmpty)
                SizedBox(
                  height: employeesData.length > 3 ? 180 : employeesData.length * 60.0,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: employeesData.length > 3 ? 3 : employeesData.length,
                      itemBuilder: (context,index){
                      final employee = employeesData[index];
                        return ListTile(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          tileColor: MyColors.lightGrey,
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text('${employee.empFirstName} ${employee.empLastName ?? ''}',style: br1,maxLines: 1,),
                        );
                      },
                      separatorBuilder: (context,index){
                        return h10;
                      },

                  ),
                )
            ],
          );
        },
        error: (error,stack)=> SizedBox(),
        loading: (){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonShimmer(
                      height: 30,
                      width: 100,
                      radius: 12
                  ),
                  commonShimmer(
                      height: 20,
                      width: 70,
                      radius: 12
                  )
                ],
              ),
              h10,
              commonShimmer(
                  height: 50,
                  width: double.infinity,
                  radius: 12
              ),
              h10,
              commonShimmer(
                  height: 50,
                  width: double.infinity,
                  radius: 12
              ),
            ],
          );
        }
    );
  }
}
