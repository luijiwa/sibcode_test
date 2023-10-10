import 'package:flutter/material.dart';
import 'package:sibcode_test/widgets/auth_widget/auth_widget.dart';

import '../loading_widget/loading_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthWidget(),
    );
  }
}
