



import 'package:dio/dio.dart';
import 'package:hrm/src/features/departments/data/repositories/department_repository.dart';
import 'package:hrm/src/features/departments/domain/model/department_model.dart';
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
}
