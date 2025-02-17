


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/calendar/domain/model/calendar_model.dart';
import 'usecase_providers.dart';



final calendarProviders = FutureProvider<List<CalendarModel>>((ref) async {
  final getCalendarUseCase = ref.watch(getCalendarUseCaseProvider);
  return getCalendarUseCase();
});
