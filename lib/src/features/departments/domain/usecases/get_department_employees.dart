



import '../../../employees/domain/model/employee_model.dart';
import '../../data/repositories/department_repository.dart';

class GetDepartmentEmployees {
  final DepartmentRepository repository;

  GetDepartmentEmployees(this.repository);

  Future<List<EmployeeModel>> call({required int deptId}) {
    return repository.fetchDepartmentEmployees(deptId: deptId);
  }
}
