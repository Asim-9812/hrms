


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/utils/html_text.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/notice/application/providers/notice_providers.dart';
import 'package:hrm/src/features/notice/data/sample_notices_list.dart';
import 'package:hrm/src/features/notice/presentation/ui/widgets/loading_list.dart';
import 'package:hrm/src/features/notice/presentation/ui/widgets/no_notifications.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';
import 'widgets/show_notice_dialog.dart';

class Notices extends ConsumerWidget {
  const Notices({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final noticeAsyncValue = ref.watch(noticeProviders);
    return Scaffold(
      appBar: CommonNavBar(name: 'Notifications'),
      body: noticeAsyncValue.when(
          data: (notices){
            if(notices.isEmpty){
              return NoNotifications();
            }
            else{
              return RefreshIndicator(
                onRefresh: (){
                  return Future.value(true);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    // Padding(
                    //   padding: const EdgeInsets.all(8),
                    //   child: SingleChildScrollView(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: tags.map((e){
                    //         return Container(
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(12),
                    //               color: e == 'All' ? MyColors.primary : MyColors.grey
                    //           ),
                    //           margin: EdgeInsets.only(right: 4),
                    //           padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    //           child: Center(child: Text(e,style:e == 'All' ? wr2: br2,)),
                    //         );
                    //       }).toList(),
                    //     ),
                    //   ),
                    // ),
                    h10,
                    Expanded(
                      child: ListView.separated(
                          itemCount: notices.length,
                          separatorBuilder: (context,index){
                            return Divider(
                              indent: 16,
                              endIndent: 16,
                              color: MyColors.grey,
                            );
                          },
                          itemBuilder: (context, index){
                            final notice = notices[index];
                            return ListTile(
                              onTap: ()=> noticeDialog(context, notice),
                              leading: AppLogo(),
                              title: Text(notice.notice,style: bh2,),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  htmlToText(context, text: notice.noticedetails, style: br2, maxLine: 2),
                                  h10,
                                  Text(notice.fromdatest,style: br3,),
                                ],
                              ),
                            );
                          }
                      ),
                    )
                  ],
                ),
              );
            }
          },
          error: (error, stack)=>NoNotifications(),
          loading: ()=> LoadingNoticeList()
      ),
    );

  }
}
