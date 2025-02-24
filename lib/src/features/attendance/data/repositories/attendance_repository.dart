





import 'package:hrm/src/features/attendance/domain/model/attendance_model.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_status_model.dart';

abstract class AttendanceRepository {
  Future<List<AttendanceModel>> fetchMonthAttendance({required int year,required int month});
  Future<AttendanceStatusModel> fetchMonthAttendanceStatus({required int year,required int month});
}
