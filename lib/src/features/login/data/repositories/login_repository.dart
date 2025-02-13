



import '../../domain/model/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> login({required String code, required String username, required String password});
}
