

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/departments/application/controller/all_department_controller.dart';
import 'package:hrm/src/features/departments/presentation/ui/widgets/loading_list_widget.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';
import '../../../../core/utils/shimmers.dart';
import '../../application/providers/department_providers.dart';
import 'widgets/department_list.dart';
import 'widgets/no_departments.dart';


class AllDepartments extends ConsumerWidget {
  const AllDepartments({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final deptAsyncValue = ref.watch(departmentProviders);


    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonNavBar(name: 'Departments'),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: deptAsyncValue.when(
              data: (departmentData){

                return DepartmentList(departmentList: departmentData);
              },
              error: (error, stack)=> NoDepartments(error: '$error',),
              loading: ()=>LoadingListWidget()
          ),
        ),
      ),
    );
  }
}
