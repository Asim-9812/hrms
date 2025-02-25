


import 'package:dio/dio.dart';
import 'package:hrm/src/features/leave/data/repositories/leave_repository.dart';
import 'package:hrm/src/features/leave/domain/model/leave_model.dart';

import '../../../../core/api/api.dart';

class LeaveRepositoryImpl extends LeaveRepository{

  final dio = Dio();

  @override
  Future<List<LeaveModel>> fetchLeaveList() async {
    try{
      final response = await dio.get('${Api.getLeaveByEmployeeId}?EmployeeId=109');
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final dto = data.map((e)=>LeaveModel.fromJson(e)).toList();
        return dto;
      } else {
        throw Exception('Failed to fetch data');
      }
    }on DioException catch(err){
      print(err);
      throw Exception('Failed to fetch data');
    }
  }
}