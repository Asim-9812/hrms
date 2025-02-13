

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/model/holiday_model.dart';
import 'holidays_controller.dart';



final getHolidays = StateProvider.family.autoDispose((ref,List<HolidayModel> holidayList){

  final date = ref.watch(holidayController).selectedDate;
  return HolidayListController.dateFilter(holidayList: holidayList, date: date);

});



class HolidayListController{


  static List<HolidayModel> dateFilter({required List<HolidayModel> holidayList, required DateTime date}){

    final List<HolidayModel> newList = [];

    for(int i = 0; i < holidayList.length ; i++){
      DateTime holidayDate = DateFormat('yyyy-MM-ddThh:mm:ss').parse(holidayList[i].startDate!);

      // Needs to change the condition to (holidayDate.year == date.year && holidayDate.month == date.month)
      // Check if the month of the holiday matches the month of the input date
      if (holidayDate.month == date.month) {
        newList.add(holidayList[i]);
      }
    }
    return newList;
  }
}