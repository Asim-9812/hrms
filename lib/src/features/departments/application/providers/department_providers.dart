


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/departments/application/controller/all_department_controller.dart';
import 'package:hrm/src/features/departments/domain/model/department_model.dart';
import 'package:hrm/src/features/employees/domain/model/employee_model.dart';
import 'package:hrm/src/features/notice/domain/model/notice_model.dart';
import 'usecase_providers.dart';



final departmentProviders = FutureProvider<List<DepartmentModel>>((ref) async {
  final getDepartmentUseCase = ref.watch(getDepartmentUseCaseProvider);
  return getDepartmentUseCase();
});

final employeeByDepartmentProviders = FutureProvider.autoDispose<List<EmployeeModel>>((ref) async {
  final departmentId = ref.read(allDepartmentController).selectedDepartmentId;
  final getEmployeeByDepartmentUseCase = ref.watch(getEmployeeByDepartmentUseCaseProvider);
  return getEmployeeByDepartmentUseCase(deptId: departmentId);
});

final departmentNoticeProviders = FutureProvider.autoDispose<List<NoticeModel>>((ref) async {
  final deptName = ref.read(allDepartmentController).selectedDepartmentName;
  final getDepartmentNoticesUseCase = ref.watch(getDepartmentNoticesUseCaseProvider);
  return getDepartmentNoticesUseCase(deptName: deptName);
});
