

import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hrm/src/features/biometrics_auth/domain/model/biometric_model.dart';
import 'package:local_auth/local_auth.dart';



class Authentication{

  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> addBiometrics({required String username,required bool bio}) async {
    bool authenticated = false;
    try {
      if(!bio){
        authenticated = await auth.authenticate(
          localizedReason:
          'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
        if(authenticated){
          final authBox = Hive.box<Biometrics>('biometrics');
          await authBox.clear();

          final tempBox = Hive.box<Biometrics>('tempCred');
          

          Biometrics? biometrics = tempBox.get(username);
          if(biometrics != null){
            await authBox.put('biometric', biometrics);

            return true;
          }
          else{
            return false;
          }



        }
        else{
          return false;
        }
      }
      else{
        authenticated = await auth.authenticate(
          localizedReason:
          'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
        if(authenticated){
          final authBox = Hive.box<Biometrics>('biometrics');
          await authBox.clear();
          return false;

        }
        else{
          return true;
        }
      }

    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> authenticateWithBio() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason:
        'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if(authenticated){
        return true;
      }
      else{
        return false;
      }

    } on PlatformException {
      return false;
    }
  }


}
