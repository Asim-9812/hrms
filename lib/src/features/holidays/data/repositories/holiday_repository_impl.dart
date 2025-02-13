

import 'package:dio/dio.dart';
import '../../../../core/api/api.dart';
import '../../domain/model/holiday_model.dart';
import 'holiday_repository.dart';


class HolidayRepositoryImpl implements HolidayRepository{
  final dio = Dio();

  @override
  Future<List<HolidayModel>> fetchHolidays() async {
    try{
      final response = await dio.get(Api.getAllHolidays);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final holidayList = data.map((e)=> HolidayModel.fromJson(e)).toList();
        return holidayList;
      } else {
        throw Exception('Failed to fetch data');
      }
    }on DioException catch(err){
      print(err);
      throw Exception('Failed to fetch data');
    }
  }
}
