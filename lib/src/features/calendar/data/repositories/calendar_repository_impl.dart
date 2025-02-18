



import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../../../../core/api/api.dart';
import '../../domain/model/calendar_model.dart';
import '../../domain/model/holiday_model.dart';
import 'calendar_repository.dart';


class CalendarRepositoryImpl implements CalendarRepository{
  final dio = Dio();

  @override
  Future<List<CalendarModel>> fetchAllEvents() async {
    try{
      List<CalendarModel> calendarList = [];
      List<HolidayModel> holidayList = [];
      List<HolidayModel> eventList = [];

      final holidayData = await dio.get(Api.getAllHolidays);

      if(holidayData.statusCode == 200){

        final data = holidayData.data as List<dynamic>;

        holidayList = data.map((e)=>HolidayModel.fromJson(e)).toList();

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
      }

      if(eventList.isNotEmpty){
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
      }

      calendarList.sort((a,b)=>a.startDate.compareTo(b.startDate));

      return calendarList;

    }on DioException catch(err){
      print(err);
      throw Exception('Failed to fetch data');
    }
  }
}
