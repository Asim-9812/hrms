


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/holiday_repository.dart';
import '../../data/repositories/holiday_repository_impl.dart';




final holidayRepositoryProvider = Provider<HolidayRepository>((ref) {
  return HolidayRepositoryImpl();
});
