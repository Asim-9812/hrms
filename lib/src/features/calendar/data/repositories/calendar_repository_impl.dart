



import 'package:dio/dio.dart';
import 'package:hrm/src/features/calendar/domain/model/calendar_model.dart';
import 'package:hrm/src/features/events/data/sample_events.dart';
import 'package:hrm/src/features/holidays/data/sample_holiday_list.dart';
import 'package:intl/intl.dart';
import '../../../../core/api/api.dart';
import 'calendar_repository.dart';


class CalendarRepositoryImpl implements CalendarRepository{
  final dio = Dio();

  @override
  Future<List<CalendarModel>> fetchAllEvents() async {
    try{
      final List<CalendarModel> calendarList = [];
      final holidayList = sampleHolidayList;
      final eventList = sampleEventList;

      for(int i = 0; i < holidayList.length; i++){

        final date = DateFormat('yyyy-MM-ddThh:mm:ss').parse(holidayList[i].startDate!);

        final calendarData = CalendarModel(
            title: holidayList[i].holidayTitle!,
            description: holidayList[i].description!,
            startDate: date,
            eventType: 1
        );

        calendarList.add(calendarData);
      }
      for(int i = 0; i < eventList.length; i++){

        final date = DateFormat('yyyy-MM-ddThh:mm:ss').parse(eventList[i].startDate!);

        final calendarData = CalendarModel(
            title: eventList[i].holidayTitle!,
            description: eventList[i].description!,
            startDate: date,
            eventType: 2
        );

        calendarList.add(calendarData);
      }

      calendarList.sort((a,b)=>a.startDate.compareTo(b.startDate));

      return calendarList;

    }on DioException catch(err){
      print(err);
      throw Exception('Failed to fetch data');
    }
  }
}
