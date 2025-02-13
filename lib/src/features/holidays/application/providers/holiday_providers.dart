


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/holiday_model.dart';
import 'usecase_providers.dart';



final holidayProviders = FutureProvider<List<HolidayModel>>((ref) async {
  final getHolidayUseCase = ref.watch(getHolidaysUseCaseProvider);
  return getHolidayUseCase();
});
