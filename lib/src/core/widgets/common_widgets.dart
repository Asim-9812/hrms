



import 'package:flutter/material.dart';
import 'package:hrm/src/core/resources/color_manager.dart';

import '../resources/font_manager.dart';


Image DashboardLogo(){
  return Image.asset('assets/images/logopng.png',width: 100);
}

Image AppLogo(){
  return Image.asset('assets/images/logopng.png');
}


Image NoItems(){
  return Image.asset('assets/images/no_notifications.png');
}

AppBar CommonAppBar({required String name}){
  return AppBar(
    backgroundColor: MyColors.primary,
    automaticallyImplyLeading: true,
    iconTheme: IconThemeData(
      color: MyColors.white
    ),
    centerTitle: true,
    title: Text(name,style: wh2,),
  );
}



AppBar CommonNavBar({required String name}){
  return AppBar(
    iconTheme: IconThemeData(
        color: MyColors.white
    ),
    backgroundColor: MyColors.primary,
    elevation: 0,
    title: Text(name,style: wh2,),
    centerTitle: true,
  );
}

Text BulletinPoint({double? fs, Color? color}){
  return Text("\u2022 ",style: TextStyle(color: color ?? MyColors.secondary, fontSize: fs ?? 32),);
}