






import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/presentation/ui/presentation.dart';
import 'application/login_notifier.dart';
import 'presentation/ui/login_page.dart';

class StatusPage extends ConsumerWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final authState = ref.watch(loginNotifierProvider);

    return authState.user == null ? LoginPage() : Dashboard();
  }
}
