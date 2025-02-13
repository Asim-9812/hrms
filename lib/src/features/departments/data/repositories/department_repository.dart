



import '../../domain/model/department_model.dart';

abstract class DepartmentRepository {
  Future<List<DepartmentModel>> fetchAllDepartments();
}
