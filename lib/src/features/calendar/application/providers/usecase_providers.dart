


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/calendar/domain/usecases/get_calendar_list.dart';
import 'calendar_repository_provider.dart';



final getCalendarUseCaseProvider = Provider<GetCalendarList>((ref) {
  final repository = ref.watch(calendarRepositoryProvider);
  return GetCalendarList(repository);
});
