

import 'package:flutter/material.dart';
import 'package:hrm/src/core/utils/html_text.dart';
import 'package:hrm/src/features/notice/domain/model/notice_model.dart';
import 'package:hrm/src/features/notice/presentation/homepage_ui/widgets/show_notice_dialog.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';

class NoticeContainer extends StatelessWidget {

  final NoticeModel noticeData;

  const NoticeContainer({required this.noticeData,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
              color: MyColors.primaryLighter,
              borderRadius: BorderRadius.circular(16)
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColors.primaryLight.withValues(alpha: 80),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(100),
                          bottomLeft: Radius.circular(100)
                      )
                  ),
                  height: 35,
                  width: 70,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColors.primaryLight.withValues(alpha: 80),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100)
                      )
                  ),
                  height: 70,
                  width: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(noticeData.notice,style: bh2,maxLines: 1,),
                        Text(noticeData.fromdatest,style: br3,maxLines: 1,),
                        h10,
                        htmlToText(context, text: noticeData.noticedetails, style: br3, maxLine: 2),
                        h10,
                        InkWell(
                            onTap: ()=> noticeDialog(context, noticeData),
                            child: Text('See more',style: br3,))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
