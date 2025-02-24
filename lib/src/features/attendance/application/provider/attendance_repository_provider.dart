


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/attendance/data/repositories/attendance_repository.dart';
import 'package:hrm/src/features/attendance/data/repositories/attendance_repository_impl.dart';



final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  return AttendanceRepositoryImpl();
});
