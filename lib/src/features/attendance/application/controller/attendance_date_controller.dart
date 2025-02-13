



import 'package:flutter/material.dart';
import 'package:hrm/src/features/attendance/application/controller/attendance_list_controller.dart';

void dateDialog(context,ref) async {

  final currentDate = ref.watch(attendanceListController).selectedDate;

  final lastDate = DateTime.now();
  final firstDate = lastDate.subtract(Duration(days: 365));

  DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    initialDate: currentDate
  );

  if(selectedDate != null){

    ref.read(attendanceListController.notifier).changeDate(selectedDate);

  }

}