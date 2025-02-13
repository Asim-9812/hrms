


import '../../data/repositories/department_repository.dart';
import '../model/department_model.dart';

class GetDepartments {
  final DepartmentRepository repository;

  GetDepartments(this.repository);

  Future<List<DepartmentModel>> call() {
    return repository.fetchAllDepartments();
  }
}
