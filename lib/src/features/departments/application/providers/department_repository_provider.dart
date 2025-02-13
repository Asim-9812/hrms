


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/department_repository.dart';
import '../../data/repositories/department_repository_impl.dart';




final departmentRepositoryProvider = Provider<DepartmentRepository>((ref) {
  return DepartmentRepositoryImpl();
});
