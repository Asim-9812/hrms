



import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_notices.dart';
import 'notice_repository_provider.dart';



final getNoticesUseCaseProvider = Provider<GetNotices>((ref) {
  final repository = ref.watch(noticeRepositoryProvider);
  return GetNotices(repository);
});
