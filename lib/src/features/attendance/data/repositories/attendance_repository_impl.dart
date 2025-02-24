


import 'package:dio/dio.dart';
import 'package:hrm/src/features/attendance/data/repositories/attendance_repository.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_model.dart';
import 'package:hrm/src/features/attendance/domain/model/attendance_status_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/api/api.dart';

class AttendanceRepositoryImpl extends AttendanceRepository{

  final dio = Dio();

  @override
  Future<List<AttendanceModel>> fetchMonthAttendance({required int year, required int month}) async {
    try{
      final response = await dio.get('${Api.getAttendance}?year=$year&month=$month');
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final dto = data.map((e)=>AttendanceModel.fromJson(e)).where(((e)=>e.idEnroll == 9)).toList();
        return dto;
      } else {
        throw Exception('Failed to fetch data');
      }
    }on DioException catch(err){
      print(err);
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Future<AttendanceStatusModel> fetchMonthAttendanceStatus({required int year, required int month}) async {
    try {
      final response = await dio.get('${Api.getAttendance}?year=$year&month=$month');
      if (response.statusCode == 200) {
        final DateTime focusedDate = DateTime(year, month);
        final String focusedMonth = DateFormat('MMM').format(focusedDate);
        final data = response.data as List<dynamic>;
        final dto = data.where(((e)=>e['IdEnroll'] == 9)).toList();

        // Calculate total working days (excluding Saturdays and Sundays)
        int totalDays = 0;
        DateTime now = DateTime.now();
        DateTime firstDay = DateTime(year, month, 1);
        DateTime lastDay = (now.year == year && now.month == month) ? now : DateTime(year, month + 1, 0);

        for (DateTime day = firstDay; day.isBefore(lastDay) || day.isAtSameMomentAs(lastDay); day = day.add(Duration(days: 1))) {
          if (day.weekday != DateTime.saturday && day.weekday != DateTime.sunday) {
            totalDays++;
          }
        }

        int attendedDays = dto.length;
        int leave = totalDays - attendedDays;

        AttendanceStatusModel status = AttendanceStatusModel(
          dateTime: focusedDate,
          year: year,
          month: focusedMonth,
          attendedDays: attendedDays,
          leave: leave,
          totalDays: totalDays,
        );

        return status;
      } else {
        throw Exception('Failed to fetch data');
      }
    } on DioException catch (err) {
      print(err);
      throw Exception('Failed to fetch data');
    }
  }




}