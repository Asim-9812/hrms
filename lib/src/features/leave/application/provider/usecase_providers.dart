




import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/get_leaves.dart';
import 'leave_repository_provider.dart';

final getLeaveUseCaseProvider = Provider<GetLeaveList>((ref) {
  final repository = ref.watch(leaveRepositoryProvider);
  return GetLeaveList(repository);
});

