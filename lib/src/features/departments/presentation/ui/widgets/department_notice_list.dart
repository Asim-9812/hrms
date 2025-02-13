

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../../core/utils/html_text.dart';
import '../../../../../core/utils/shimmers.dart';
import '../../../../notice/presentation/homepage_ui/widgets/show_notice_dialog.dart';
import '../../../application/providers/department_providers.dart';

class DepartmentNotices extends ConsumerWidget {
  const DepartmentNotices({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final deptNoticesAsyncValue = ref.watch(departmentNoticeProviders);
    return deptNoticesAsyncValue.when(
        data: (noticeData){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notices',style: bh2,maxLines: 1,),
                  Text('View all',style: TextStyle(color: MyColors.primary,fontWeight: FontWeight.w500),)
                ],
              ),
              h10,
              if(noticeData.isEmpty)
                Text('No Notices.',style: br1,),
              if(noticeData.isNotEmpty)
                SizedBox(
                  height: noticeData.length > 3 ? 300: noticeData.length * 100.0,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: noticeData.length > 5 ? 5 : noticeData.length,
                      itemBuilder: (context,index){
                      final notice = noticeData[index];
                        return ListTile(
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          tileColor: MyColors.lightGrey,
                          onTap: ()=> noticeDialog(context, notice),
                          // leading: Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: AppLogo(),
                          // ),

                          title: Text(notice.notice,style: bh3,),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              htmlToText(context, text: notice.noticedetails, style: br3, maxLine: 2),
                              // h10,
                              // Text(notice.fromdatest,style: br4,),
                            ],
                          ),
                          trailing: Text(notice.fromdatest,style: br4,),
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
