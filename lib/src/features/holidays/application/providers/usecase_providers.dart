


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_holidays.dart';
import 'holiday_repository_provider.dart';



final getHolidaysUseCaseProvider = Provider<GetHolidays>((ref) {
  final repository = ref.watch(holidayRepositoryProvider);
  return GetHolidays(repository);
});
