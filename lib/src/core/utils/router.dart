



import 'package:flutter/material.dart';

void routeTo(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}