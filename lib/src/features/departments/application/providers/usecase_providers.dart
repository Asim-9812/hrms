



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/departments/domain/usecases/get_department_employees.dart';
import 'package:hrm/src/features/departments/domain/usecases/get_department_notices.dart';
import '../../domain/usecases/get_departments.dart';
import 'department_repository_provider.dart';



final getDepartmentUseCaseProvider = Provider<GetDepartments>((ref) {
  final repository = ref.watch(departmentRepositoryProvider);
  return GetDepartments(repository);
});

final getEmployeeByDepartmentUseCaseProvider = Provider<GetDepartmentEmployees>((ref) {
  final repository = ref.watch(departmentRepositoryProvider);
  return GetDepartmentEmployees(repository);
});

final getDepartmentNoticesUseCaseProvider = Provider<GetDepartmentNotices>((ref) {
  final repository = ref.watch(departmentRepositoryProvider);
  return GetDepartmentNotices(repository);
});
