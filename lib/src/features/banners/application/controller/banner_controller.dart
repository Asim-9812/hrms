


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final bannerController = ChangeNotifierProvider((ref)=>BannerController());



class BannerController extends ChangeNotifier{

  int index = 0;


  void changeIndex(int value){

    index = value;
    notifyListeners();

  }

}