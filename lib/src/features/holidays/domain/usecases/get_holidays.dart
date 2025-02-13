

import '../../data/repositories/holiday_repository.dart';
import '../model/holiday_model.dart';

class GetHolidays {
  final HolidayRepository repository;

  GetHolidays(this.repository);

  Future<List<HolidayModel>> call() {
    return repository.fetchHolidays();
  }
}
