import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../login/domain/model/user_model.dart';
import '../domain/model/biometric_model.dart';



final biometricProvider = StateProvider((ref) => BiometricCheck.checkBiometricEnabled());



class BiometricCheck extends StateNotifier{
  BiometricCheck(super.state);



  static bool checkBiometricEnabled() {

    final biometricBox = Hive.box<Biometrics>('biometrics');
    final isEnabled = biometricBox.containsKey('biometric');
    return isEnabled;
  }

}