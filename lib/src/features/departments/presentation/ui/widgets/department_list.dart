

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/utils/router.dart';
import 'package:hrm/src/features/departments/domain/model/department_model.dart';
import 'package:hrm/src/features/departments/presentation/ui/department_details.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../../core/widgets/common_widgets.dart';
import '../../../application/controller/all_department_controller.dart';
import '../../../application/providers/department_providers.dart';

class DepartmentList extends ConsumerWidget {
  final List<DepartmentModel> departmentList;
  const DepartmentList({required this.departmentList,super.key});

  @override
  Widget build(BuildContext context,ref) {

    final controller = ref.watch(allDepartmentController).searchController;
    final filteredList = ref.watch(allDepartmentController).filteredList;
    return Column(
      children: [
        TextFormField(
          controller: controller,
          style: br2,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: MyColors.primary
                  )
              ),
              enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: MyColors.primary
                  )
              ),
              labelText: 'Search',
              hintText: 'Search for departments...',
              labelStyle: br3,
              hintStyle: br4,
              prefixIcon: Icon(Icons.search,color: MyColors.primary,)
          ),
          onChanged: (val){
            ref.read(allDepartmentController.notifier).filterList(val, departmentList);
          },
        ),
        h10,
        if(controller.text.trim().isNotEmpty && filteredList.isEmpty)
          Text('No Department Found.',style: bh2),

        Expanded(
          child: Material(
            color: MyColors.white,
            child: ListView.separated(
              itemCount: filteredList.isNotEmpty ? filteredList.length :departmentList.length,
              itemBuilder: (context, index){
                final department = filteredList.isNotEmpty ? filteredList[index] :departmentList[index];
                return ListTile(
                  onTap: (){
                    ref.read(allDepartmentController.notifier).selectedDepartment(department.id,department.name);
                    routeTo(context, DepartmentDetails(department: department));
                  },
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  tileColor: MyColors.lightGrey,
                  leading: BulletinPoint(),
                  title: Text(department.name,style: bh2,),
                );
              },
              separatorBuilder: (context,index){
                return h10;
              },

            ),
          ),
        ),


      ],
    );
  }
}
