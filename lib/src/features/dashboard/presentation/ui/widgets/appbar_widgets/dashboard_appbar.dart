


import 'package:flutter/material.dart';
import 'package:hrm/src/features/notice/presentation/ui/notices.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/utils/router.dart';

AppBar DashboardAppbar(BuildContext context, String name){
  return AppBar(
    elevation: 0,
    backgroundColor: MyColors.primary,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Text(name,style: wh2,maxLines: 1,),
    leading: DrawerButton(
      color: MyColors.white,
    ),
    actions: [
      IconButton(
          onPressed: ()=>routeTo(context, Notices()),
          icon: Icon(Icons.notifications_rounded,color: MyColors.white,)
      ),
    ],
  );
}
