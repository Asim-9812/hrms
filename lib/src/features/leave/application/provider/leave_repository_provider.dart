


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/attendance/data/repositories/attendance_repository.dart';
import 'package:hrm/src/features/attendance/data/repositories/attendance_repository_impl.dart';
import 'package:hrm/src/features/leave/data/repositories/leave_repository_impl.dart';

import '../../data/repositories/leave_repository.dart';



final leaveRepositoryProvider = Provider<LeaveRepository>((ref) {
  return LeaveRepositoryImpl();
});
