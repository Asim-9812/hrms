



import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_departments.dart';
import 'department_repository_provider.dart';



final getDepartmentUseCaseProvider = Provider<GetDepartments>((ref) {
  final repository = ref.watch(departmentRepositoryProvider);
  return GetDepartments(repository);
});
