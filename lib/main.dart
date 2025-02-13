import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hrm/src/features/biometrics_auth/domain/model/biometric_model.dart';
import 'package:hrm/src/features/login/domain/model/user_model.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'src/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


  Hive.registerAdapter(UserModelAdapter()); //typeid 0
  Hive.registerAdapter(BiometricsAdapter()); //typeid 1

  await Hive.initFlutter();
  final userBox = await Hive.openBox<UserModel>('users');
  await Hive.openBox<Biometrics>('biometrics');
  await Hive.openBox<Biometrics>('tempCred');


  runApp(
      DevicePreview(
        enabled: true,
        builder: (context) {
          return ProviderScope(
            child: const MyApp()
            );
        }
      ));
}
