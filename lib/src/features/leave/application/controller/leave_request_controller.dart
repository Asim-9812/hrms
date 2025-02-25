


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';


final leaveRequestController = ChangeNotifierProvider.autoDispose((ref) => LeaveRequestController());

class LeaveRequestController extends ChangeNotifier{

  final formKey = GlobalKey<FormState>();

  TextEditingController reasonController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  void changeFromDate(DateTime date){
    fromDate = date;
    notifyListeners();
  }

  void changeToDate(DateTime date){
    toDate = date;
    notifyListeners();
  }


  void updateTotalDays(){
    int value = toDate.difference(fromDate).inDays;
    totalController.text = '${value + 1}';
    notifyListeners();
  }

  void updateToDate(int value){
    toDate = fromDate.add(Duration(days: value));
    toController.text = DateFormat('yyyy-MM-dd').format(toDate);
    notifyListeners();
  }


}