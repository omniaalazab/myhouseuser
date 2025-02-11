import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberState {}

class InitialRemember extends RememberState {
  final bool isRemember;
  final String email;
  final String password;
  InitialRemember(this.isRemember, this.email, this.password);
}

class ChangeRemmber extends RememberState {
  final bool isRemember;
  final String email;
  final String password;
  ChangeRemmber(this.isRemember, this.email, this.password);
}

class RememberCubit extends Cubit<RememberState> {
  RememberCubit() : super(InitialRemember(false, "", "")) {
    _init();
  }

  void _init() {
    Future.microtask(() => loadRememberMePreference());
  } Future<void> loadRememberMePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final isRemembered = prefs.getBool('remember_me') ?? false;
    final email = prefs.getString('email') ?? '';
    final password = prefs.getString('password') ?? '';
    emit(InitialRemember(isRemembered, email, password));
  }
   Future<void> changeRememberMe(
      bool value, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', value);
    if (value) {
      await prefs.setString('email', email);
      await prefs.setString('password', password);
    } else {
      await prefs.remove('email');
      await prefs.remove('password');
    }

    emit(ChangeRemmber(value, email, password));
  }
}
