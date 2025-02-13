import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/toaster.dart';
import '../data/repositories/login_repository.dart';
import '../data/repositories/login_repository_impl.dart';
import '../domain/auth_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepositoryImpl loginRepository;

  LoginNotifier(this.loginRepository) : super(LoginState()) {
    _loadSavedUser();
  }

  Future<void> _loadSavedUser() async {
    try {
      final user = await loginRepository.getSavedUser();
      if (user != null) {
        state = state.copyWith(user: user);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> login({required String code,required String username,required String password}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await loginRepository.login(code: code,username: username, password: password);
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      Toaster.error(e.toString());
    }
  }

  Future<void> logout() async {

    await loginRepository.logout();
    state = state.copyWith(user: null);
  }
}

final loginNotifierProvider =
StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final repository = LoginRepositoryImpl();
  return LoginNotifier(repository);
});