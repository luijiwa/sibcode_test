import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sibcode_test/widgets/login/login_widget_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<LoginWidgetModel>().readTelNumber(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginWidgetModel>(context);
    final tel = context.read<LoginWidgetModel>().tel;
    const TextStyle textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
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
            const Text(
              'Номер телефона',
              style: textStyle,
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                tel,
                style: textStyle,
              ),
            ),
            // Color.fromRGBO(241, 241, 241, 1)
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () => authProvider.resetAuth(context),
                style: const ButtonStyle(),
                child: const Text('Выход')),
          ],
        ),
      ),
    );
  }
}
