



import '../../domain/model/holiday_model.dart';

abstract class HolidayRepository {
  Future<List<HolidayModel>> fetchHolidays();
}
