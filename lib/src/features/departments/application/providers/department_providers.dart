


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/departments/domain/model/department_model.dart';
import 'usecase_providers.dart';



final departmentProviders = FutureProvider<List<DepartmentModel>>((ref) async {
  final getDepartmentUseCase = ref.watch(getDepartmentUseCaseProvider);
  return getDepartmentUseCase();
});
