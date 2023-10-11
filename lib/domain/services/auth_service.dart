import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _storage = SharedPreferences.getInstance();

  String _tel = '';
  bool _loginState = false;

  bool get loginState => _loginState;
  String get tel => _tel;

  Future<void> readAuthState() async {
    final storage = await _storage;
    _loginState = storage.getBool('login_state') ?? false;
    _tel = storage.getString('tel') ?? '';
  }

  Future<void> saveAuthState(String number) async {
    final storage = await _storage;
    _loginState = true;
    await storage.setBool('login_state', _loginState);

    await storage.setString('tel', number);
  }

  Future<void> onAppStart() async {
    final storage = await _storage;
    _loginState = storage.getBool('login_state') ?? false;
  }

  Future<void> deleteAuthState() async {
    final storage = await _storage;
    await storage.remove('login_state');
    await storage.remove('tel');
  }
}
