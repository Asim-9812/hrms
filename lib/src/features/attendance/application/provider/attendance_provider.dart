



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/attendance/application/controller/attendance_controller.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_model.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_status_model.dart';
import 'package:hrm/src/features/departments/application/controller/all_department_controller.dart';
import 'package:hrm/src/features/departments/domain/model/department_model.dart';
import 'package:hrm/src/features/employees/domain/model/employee_model.dart';
import 'package:hrm/src/features/notice/domain/model/notice_model.dart';
import 'usecase_providers.dart';



final attendanceStatusProvider = FutureProvider.family<AttendanceStatusModel, DateTime>((ref, date) async {
  final getAttendanceStatusUseCase = ref.watch(getAttendanceStatusUseCaseProvider);
  return getAttendanceStatusUseCase(year: date.year, month: date.month);
});


final attendanceProvider = FutureProvider.family<List<AttendanceModel>, DateTime>((ref, date) async {
  final getAttendanceUseCase = ref.watch(getAttendanceUseCaseProvider);
  return getAttendanceUseCase(year: date.year, month: date.month);
});