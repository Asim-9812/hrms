

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarController = ChangeNotifierProvider.autoDispose((ref)=>CalendarController());


class CalendarController extends ChangeNotifier{

  DateTime selectedDate = DateTime.now();
  DateTime focusedMonth = DateTime.now();
  final firstDay = DateTime(DateTime.now().year,1,1);
  final lastDay = DateTime(DateTime.now().year,12,31);

  int carouselIndex = 0;

  void changeDate(DateTime date){
    selectedDate = date;
    notifyListeners();
  }

  void changeMonth(DateTime date){
    print(date);
    focusedMonth = date;
    notifyListeners();
  }

  void changeIndex(int value){

    carouselIndex = value;
    notifyListeners();

  }



}