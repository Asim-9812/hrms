


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final attendanceController = ChangeNotifierProvider((ref)=>AttendanceController());


class AttendanceController extends ChangeNotifier{


  int year = DateTime.now().year;
  int month = DateTime.now().month;

  DateTime currentDate = DateTime.now();


  void changeYear(int val){
    year = val;
    notifyListeners();
  }
  void changeMonth(int val){
    month = val;
    notifyListeners();
  }

}