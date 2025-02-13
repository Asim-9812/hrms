import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/providers/user_info_provider.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/features/biometrics_auth/data/authenticate_services.dart';

import '../../data/biometric_state.dart';

class BiometricTile extends ConsumerWidget {
  const BiometricTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBiometricEnabled = ref.watch(biometricProvider);
    final userInfo = ref.watch(userInfoProvider);
    return ListTile(
      leading: Icon(Icons.fingerprint,color: MyColors.primary,),
      title: Text('Enable Biometrics'),
      trailing: Switch(
        value: isBiometricEnabled,
        onChanged: (value) async {
          await Authentication().addBiometrics(username: userInfo.UserName.toLowerCase(), bio: !value).whenComplete((){
            ref.refresh(biometricProvider);
          });
        },
      ),
    );
  }
}