

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/departments/application/controller/all_department_controller.dart';
import 'package:hrm/src/features/departments/application/providers/department_providers.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';
import '../../../../core/utils/shimmers.dart';


// another new origin

class AllDepartments extends ConsumerWidget {
  const AllDepartments({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final deptAsyncValue = ref.watch(departmentProviders);

    final controller = ref.watch(allDepartmentController).searchController;
    final filteredList = ref.watch(allDepartmentController).filteredList;


    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: deptAsyncValue.when(
              data: (departmentData){
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
                        print(val);
                        ref.read(allDepartmentController.notifier).filterList(val, departmentData);
                      },
                    ),
                    h10,
                    if(controller.text.trim().isNotEmpty && filteredList.isEmpty)
                      Text('No Department Found.',style: bh2),

                    if(controller.text.isEmpty && filteredList.isEmpty)
                      Expanded(
                        child: ListView.separated(
                            itemCount: departmentData.length,
                            itemBuilder: (context, index){
                              final department = departmentData[index];
                              return Material(
                                color: MyColors.lightGrey,
                                child: ListTile(
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  tileColor: MyColors.lightGrey,
                                  leading: BulletinPoint(),
                                  title: Text(department.name,style: bh2,),
                                ),
                              );
                            },
                            separatorBuilder: (context,index){
                              return h10;
                            },

                        ),
                      ),

                    if(controller.text.trim().isNotEmpty && filteredList.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                          itemCount: filteredList.length,
                          itemBuilder: (context, index){
                            final department = filteredList[index];
                            return Material(
                              color: MyColors.lightGrey,
                              child: ListTile(
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                tileColor: MyColors.lightGrey,
                                leading: BulletinPoint(),
                                title: Text(department.name,style: bh2,),
                              ),
                            );
                          },
                          separatorBuilder: (context,index){
                            return h10;
                          },

                        ),
                      ),

                  ],
                );
              },
              error: (error, stack)=> RefreshIndicator(
                onRefresh: ()=>Future.value(true),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NoItems(),
                      h10,
                      Text('No Departments',style: bh2,),
                      h10,
                      Text('Something went wrong.',style: br3,)
                    ],
                  ),
                ),
              ),
              loading: ()=>ListView.builder(
                itemCount: 4,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 8,mainAxisSpacing: 8,childAspectRatio: 1),
                itemBuilder: (context,index){
                  return commonShimmer(
                      radius: 12,
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 8)
                  );
                },
              )
          ),
        ),
      ),
    );
  }
}
