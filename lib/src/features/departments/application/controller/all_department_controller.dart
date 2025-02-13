

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/department_model.dart';

final allDepartmentController = ChangeNotifierProvider((ref) => AllDepartmentController());


class AllDepartmentController extends ChangeNotifier{

  TextEditingController searchController = TextEditingController();

  List<DepartmentModel> filteredList = [];

  void filterList(String query,List<DepartmentModel> allList){
    filteredList = allList.where((e)=>e.name.toLowerCase() == query.toLowerCase()).toList();
    notifyListeners();
  }

}