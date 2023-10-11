import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sibcode_test/widgets/auth/auth_widget_model.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthWidgetModel>(context);
    final TextEditingController _telController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          //   icon: const Icon(Icons.arrow_back_ios),
          ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Авторизоваться'),
            const SizedBox(height: 20),
            const Text('Номер телефона'),
            const SizedBox(height: 10),
            if (authProvider.erorrMessage.isNotEmpty)
              Text(
                authProvider.erorrMessage,
                style: const TextStyle(color: Colors.red),
              ),
            TextField(
              controller: _telController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(241, 241, 241, 1),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () => authProvider.validAndNavigation(
                    _telController.text, context),
                style: const ButtonStyle(),
                child: const Text('Вход')),
          ],
        ),
      ),
    );
  }
}
