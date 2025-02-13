



import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final holidayController = ChangeNotifierProvider.autoDispose((ref)=> HolidayController());


class HolidayController extends ChangeNotifier{

  DateTime selectedDate = DateTime.now();
  CarouselSliderController controller = CarouselSliderController();

  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];



  void changeDate(DateTime newDate){
    selectedDate = newDate;
    notifyListeners();
  }

  void updateController(int index){
    controller.animateToPage(index);
    notifyListeners();
  }



}