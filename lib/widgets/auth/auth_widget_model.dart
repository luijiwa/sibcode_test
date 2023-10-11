import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sibcode_test/domain/services/auth_service.dart';

class AuthWidgetModel extends ChangeNotifier {
  String erorrMessage = '';

  bool isValidInput(String input) {
    if (input.isEmpty) {
      erorrMessage = 'Введите номер';
      return false;
    }
    if (input == '911') {
      erorrMessage = 'Ошибка';
      return false;
    }
    return true;
  }

  void validAndNavigation(String input, BuildContext context) {
    if (isValidInput(input)) {
      AuthService().saveAuthState(input);
      erorrMessage = '';
      context.goNamed('/');
    }
    notifyListeners();
  }
}
