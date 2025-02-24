



import 'package:hrm/src/features/attendance/data/repositories/attendance_repository.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_status_model.dart';

class GetMonthAttendancesStatus {
  final AttendanceRepository repository;

  GetMonthAttendancesStatus(this.repository);

  Future<AttendanceStatusModel> call({required int year,required int month}) {
    return repository.fetchMonthAttendanceStatus(year: year, month: month);
  }
}
