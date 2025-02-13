



import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/api/api.dart';
import '../../../biometrics_auth/domain/model/biometric_model.dart';
import '../../domain/model/user_model.dart';
import 'login_repository.dart';



class LoginRepositoryImpl implements LoginRepository{
  final dio = Dio();

  @override
  Future<UserModel> login({required String code, required String username, required String password}) async {
    try{
      final response = await dio.post(Api.login,
        data: {
          "code": code,
          "user": username,
          "password": password,
          "id": 0,
          "flag": 1,
          "intRoleId": 2
        }
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        final user = UserModel.fromJson(data);

        final credBox = await Hive.box<Biometrics>('tempCred');

        Map<String, dynamic> tempCred = {
          'code' : code,
          'username' : username,
          'password' : password
        };

        final biometricCred = Biometrics.fromJson(tempCred);

        await credBox.put(username, biometricCred);

        // Save the user in Hive for persistence
        final box = await Hive.box<UserModel>('users');
        await box.put('user', user);

        return user;


      }
      else {
        throw Exception('Failed to fetch data');
      }
    }on DioException catch(err){
      throw Exception('Failed to fetch data');
    }
  }


  Future<UserModel?> getSavedUser() async {
    final box = await Hive.box<UserModel>('users');
    return box.get('user');
  }

  Future<void> logout() async {
    final credBox = await Hive.box<Biometrics>('tempCred');
    final box = await Hive.box<UserModel>('users');
    await credBox.clear();
    await box.delete('user');
  }

}
