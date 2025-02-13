//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//
//
// final dashboardController = ChangeNotifierProvider((ref)=>DashboardController());
//
//
// class DashboardController extends ChangeNotifier{
//
//   int dashboardIndex = 0;
//   String activeIndexPage = 'Dashboard';
//   PageController pageController = PageController(initialPage: 0);
//
//   void changeIndex(int value, String name){
//
//     dashboardIndex = value;
//     activeIndexPage = name;
//     pageController.jumpToPage(value);
//     notifyListeners();
//
//   }
//
// }