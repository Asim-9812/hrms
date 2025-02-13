

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/department_model.dart';

final allDepartmentController = ChangeNotifierProvider((ref) => AllDepartmentController());


class AllDepartmentController extends ChangeNotifier{

  TextEditingController searchController = TextEditingController();

  int selectedDepartmentId = 0;
  String selectedDepartmentName = '';

  List<DepartmentModel> filteredList = [];

  void filterList(String query,List<DepartmentModel> allList){

    if(query.trim().isEmpty){
      filteredList = allList;
    }
    filteredList = allList.where((e)=>e.name.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }

  void selectedDepartment(int id, String name){
    selectedDepartmentId = id;
    selectedDepartmentName = name;
    notifyListeners();
  }

}