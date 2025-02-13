


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';



final attendanceListController = ChangeNotifierProvider((ref) => AttendanceListController());


class AttendanceListController extends ChangeNotifier{

  final formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  TextEditingController dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));

  void changeDate(DateTime date){
    selectedDate = date;
    dateController.text = DateFormat('yyyy-MM-dd').format(date);
    notifyListeners();
  }


}