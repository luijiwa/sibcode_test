import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sibcode_test/widgets/loader_widget/loading_widget_model.dart';
import 'package:sibcode_test/widgets/routing/app_router.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<LoadingWidgetModel>().ensureAuthentication());
    Timer(
        const Duration(
          seconds: 1,
        ), () {
      if (mounted) {
        Provider.of<LoadingWidgetModel>(context, listen: false).isAuth
            ? context.goNamed(AppRoutes.main.name)
            : context.goNamed(AppRoutes.auth.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 88,
              height: 74,
              child: Placeholder(),
            ),
            SizedBox(height: 23),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
