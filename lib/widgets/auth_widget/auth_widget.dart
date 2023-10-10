import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Авторизоваться'),
          const SizedBox(height: 20),
          const Text('Номер телефона'),
          const SizedBox(height: 10),
          const TextField(),
          const SizedBox(height: 43),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Вход'),
          ),
        ],
      ),
    );
  }
}
