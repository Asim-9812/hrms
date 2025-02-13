

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../domain/model/biometric_model.dart';

final biometricInfoProvider = StateProvider((ref) => BiometricInfoProvider.getCurrentUserInfo());


class BiometricInfoProvider extends StateNotifier{
  BiometricInfoProvider(super.state);



  static Biometrics getCurrentUserInfo() {

    final box = Hive.box<Biometrics>('biometrics');
    final biometrics = box.get('biometric');
    if (biometrics != null) {
      return biometrics;
    }
    else {
      throw Exception('No Biometrics');
    }
  }

}