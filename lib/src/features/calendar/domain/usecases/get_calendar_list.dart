

import 'package:hrm/src/features/calendar/data/repositories/calendar_repository.dart';
import 'package:hrm/src/features/calendar/domain/model/calendar_model.dart';


class GetCalendarList {
  final CalendarRepository repository;

  GetCalendarList(this.repository);

  Future<List<CalendarModel>> call() {
    return repository.fetchAllEvents();
  }
}
