




import 'package:hrm/src/features/notice/domain/model/notice_model.dart';

import '../../../employees/domain/model/employee_model.dart';
import '../../domain/model/department_model.dart';

abstract class DepartmentRepository {
  Future<List<DepartmentModel>> fetchAllDepartments();
  Future<List<EmployeeModel>> fetchDepartmentEmployees({required int deptId});
  Future<List<NoticeModel>> fetchDepartmentNotices({required String deptName});
}
