



import 'package:hrm/src/features/attendance/data/repositories/attendance_repository.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_model.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_status_model.dart';

class GetMonthAttendances {
  final AttendanceRepository repository;

  GetMonthAttendances(this.repository);

  Future<List<AttendanceModel>> call({required int year,required int month}) {
    return repository.fetchMonthAttendance(year: year, month: month);
  }
}
