import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sibcode_test/domain/services/auth_service.dart';

class LoginWidgetModel extends ChangeNotifier {
  LoginWidgetModel() {
    readTelNumber();
  }

  AuthService authService = AuthService();
  String tel = '';
  Future<void> readTelNumber() async {
    await authService.readAuthState();
    tel = authService.tel;
    notifyListeners();
  }

  void resetAuth(BuildContext context) {
    authService.deleteAuthState();
    context.goNamed('loading');
    notifyListeners();
  }
}
