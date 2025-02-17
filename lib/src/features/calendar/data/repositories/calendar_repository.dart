






import 'package:hrm/src/features/calendar/domain/model/calendar_model.dart';

abstract class CalendarRepository {
  Future<List<CalendarModel>> fetchAllEvents();
}
