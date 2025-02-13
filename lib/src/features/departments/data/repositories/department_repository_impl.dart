



import 'package:dio/dio.dart';
import 'package:hrm/src/features/departments/data/repositories/department_repository.dart';
import 'package:hrm/src/features/departments/domain/model/department_model.dart';
import 'package:hrm/src/features/employees/domain/model/employee_model.dart';
import 'package:hrm/src/features/notice/domain/model/notice_model.dart';
import '../../../../core/api/api.dart';



class DepartmentRepositoryImpl implements DepartmentRepository{
  final dio = Dio();

  @override
  Future<List<DepartmentModel>> fetchAllDepartments() async {
    try{
      final response = await dio.get(Api.getAllDepartments);
      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        final dto = data.map((e)=>DepartmentModel.fromJson(e)).toList();
        return dto;
      } else {
        throw Exception('Failed to fetch data');
      }
    }on DioException catch(err){
      print(err);
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Future<List<EmployeeModel>> fetchDepartmentEmployees({required int deptId}) async {
    try{
      final response = await dio.get('${Api.getEmployeesByDepartment}?deptId=$deptId');
      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        final dto = data.map((e)=>EmployeeModel.fromJson(e)).toList();
        return dto;
      } else {
        throw Exception('Failed to fetch data');
      }
    }on DioException catch(err){
      print(err);
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Future<List<NoticeModel>> fetchDepartmentNotices({required String deptName}) async {
    try{
      List<NoticeModel> filteredNoticeList = [];
      final response = await dio.get(Api.getAllNotices);
      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        final dto = data.map((e)=>NoticeModel.fromJson(e)).toList();
        for(int i = 0; i < dto.length; i++){
          List<String> departments = dto[i].department.split(',').map((e)=>e.trim()).toList();
          if(departments.any((e)=>e.toLowerCase() == deptName.trim().toLowerCase())){
            filteredNoticeList.add(dto[i]);
          }
        }
        return filteredNoticeList;
      } else {
        throw Exception('Failed to fetch data');
      }
    }on DioException catch(err){
      print(err);
      throw Exception('Failed to fetch data');
    }
  }


}
