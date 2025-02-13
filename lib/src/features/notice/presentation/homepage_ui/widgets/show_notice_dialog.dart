


import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hrm/src/core/utils/html_text.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../domain/model/notice_model.dart';

void noticeDialog(BuildContext context, NoticeModel noticeData) async {
  await showDialog(
      context: context,
      builder: (context){
        return Center(
          child: ZoomIn(
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.primaryLighter,
                  borderRadius: BorderRadius.circular(16)
              ),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(noticeData.notice, style: bh2,),
                  Text(noticeData.fromdatest, style: bh4,),
                  h20,
                  htmlToText(context, text: noticeData.noticedetails, style: br3),
                  h30,
                  Center(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: MyColors.primary,
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        onPressed: ()=> Navigator.pop(context),
                        child: Text('OK',style: wh3,)
                    ),
                  )
                ],
              ),
            ),
          ),
        ) ;
      }
  );
}