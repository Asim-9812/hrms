


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/calendar/data/repositories/calendar_repository.dart';
import 'package:hrm/src/features/calendar/data/repositories/calendar_repository_impl.dart';




final calendarRepositoryProvider = Provider<CalendarRepository>((ref) {
  return CalendarRepositoryImpl();
});
