import 'package:flutter/material.dart';

import 'package:sibcode_test/domain/services/auth_service.dart';

class LoadingWidgetModel extends ChangeNotifier {
  LoadingWidgetModel() {
    ensureAuthentication();
  }

  AuthService authService = AuthService();
  bool isAuth = false;
  Future<void> ensureAuthentication() async {
    await authService.onAppStart();
    isAuth = authService.loginState;
    notifyListeners();
  }
}
