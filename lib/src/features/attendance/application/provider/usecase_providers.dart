



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/attendance/application/provider/attendance_repository_provider.dart';
import 'package:hrm/src/features/attendance/domain/usecases/get_month_attendances.dart';
import 'package:hrm/src/features/attendance/domain/usecases/get_month_attendances_status.dart';

final getAttendanceStatusUseCaseProvider = Provider<GetMonthAttendancesStatus>((ref) {
  final repository = ref.watch(attendanceRepositoryProvider);
  return GetMonthAttendancesStatus(repository);
});


final getAttendanceUseCaseProvider = Provider<GetMonthAttendances>((ref) {
  final repository = ref.watch(attendanceRepositoryProvider);
  return GetMonthAttendances(repository);
});

