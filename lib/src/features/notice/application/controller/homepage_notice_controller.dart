



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final homepageNoticeController = ChangeNotifierProvider((ref)=>HomepageNoticeController());



class HomepageNoticeController extends ChangeNotifier{

  int index = 0;



  void changeIndex(int value){

    index = value;
    notifyListeners();

  }



}