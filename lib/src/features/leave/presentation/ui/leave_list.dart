


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/utils/router.dart';
import 'package:hrm/src/core/utils/shimmers.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';
import '../../application/provider/attendance_provider.dart';
import '../leave_request/presentation/ui/leave_request.dart';



class LeaveList extends ConsumerWidget {
  const LeaveList({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final leaveListAsyncValue = ref.watch(leaveProvider);

    return Scaffold(
      appBar: CommonNavBar(name: 'Leave'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: MyColors.primary,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      onPressed: ()=>routeTo(context, LeaveRequest()),
                      child: Text('Request a leave',style: wr1,)
                  ),
                ),
              ],
            ),
            h20,

            leaveListAsyncValue.when(
                data: (leaveListData){
                  return Expanded(
                    child: ListView.separated(
                        itemCount: leaveListData.length,
                        itemBuilder: (context, index){
                          final leave = leaveListData[index];
                          final status = leave.status.split(' ').first;
                          final statusColor = status.toLowerCase() == 'approved' ? MyColors.green : status.toLowerCase() == 'rejected' ? MyColors.red : MyColors.grey;
                          return Material(
                            child: ListTile(
                              leading: BulletinPoint(),
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(leave.reason,style: bh2,maxLines: 1,)),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: statusColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                                    child: Center(
                                      child: Text(status.trim().isEmpty? 'Pending' : status,style: br3,maxLines: 1,),
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Text(leave.leaveType,style: br2,),
                            ),
                          );
                        },
                      separatorBuilder: (context, index) => h10,
                    ),
                  );
                },
                error: (error, stack) => RefreshIndicator(
                  onRefresh: () {
                    ref.refresh(leaveProvider);
                    return Future.value(true);
                  },
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NoItems(),
                        Text('No Leave records',style: bh2,),
                      ],
                    ),
                  ),
                ),
                loading: ()=> Column(
                  children: [
                    ...List.generate(3, (index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  commonShimmer(
                                      width: 200,
                                      height: 20,
                                      radius: 12
                                  ),
                                  h10,
                                  commonShimmer(
                                      width: 100,
                                      height: 20,
                                      radius: 12
                                  ),
                                ],
                              ),
                              commonShimmer(
                                  width: 70,
                                  height: 20,
                                  radius: 12
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,
                            color: MyColors.grey,
                          ),
                        ],
                      );
                    }),
                  ],
                )
            ),




          ],
        ),
      ),
    );
  }
}
