



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/attendance/application/controller/attendance_controller.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_model.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_status_model.dart';
import 'package:hrm/src/features/departments/application/controller/all_department_controller.dart';
import 'package:hrm/src/features/departments/domain/model/department_model.dart';
import 'package:hrm/src/features/employees/domain/model/employee_model.dart';
import 'package:hrm/src/features/leave/domain/model/leave_model.dart';
import 'package:hrm/src/features/notice/domain/model/notice_model.dart';
import 'usecase_providers.dart';




final leaveProvider = FutureProvider<List<LeaveModel>>((ref) async {
  final getLeaveUseCase = ref.watch(getLeaveUseCaseProvider);
  return getLeaveUseCase();
});