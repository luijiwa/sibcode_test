import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sibcode_test/domain/entity/news_answer.dart';
import 'package:sibcode_test/widgets/auth/auth_widget.dart';
import 'package:sibcode_test/widgets/auth/auth_widget_model.dart';
import 'package:sibcode_test/widgets/loader_widget/loading_widget.dart';
import 'package:sibcode_test/widgets/loader_widget/loading_widget_model.dart';
import 'package:sibcode_test/widgets/login/login_widget.dart';
import 'package:sibcode_test/widgets/login/login_widget_model.dart';
import 'package:sibcode_test/widgets/news_details/news_details.dart';
import 'package:sibcode_test/widgets/news_list/news_list_widget.dart';
import 'package:sibcode_test/widgets/news_list/news_list_widget_model.dart';

enum AppRoutes {
  loading(
    name: 'loading',
    path: '/loading',
  ),
  main(
    name: 'main',
    path: '/',
  ),
  login(
    name: 'login',
    path: 'login',
  ),
  details(
    name: 'details',
    path: 'details',
  ),
  auth(
    name: 'auth',
    path: 'auth',
  ),
  ;

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => name;
}

class AppRouter {
  late final router = GoRouter(
    initialLocation: AppRoutes.loading.path,
    routes: <GoRoute>[
      GoRoute(
        name: AppRoutes.main.name,
        path: AppRoutes.main.path,
        builder: (BuildContext context, GoRouterState state) =>
            ChangeNotifierProvider(
                create: (BuildContext context) => NewsListWidgetModel(),
                child: const NewsListWidget()),
        routes: <GoRoute>[
          GoRoute(
            name: AppRoutes.login.name,
            path: AppRoutes.login.path,
            builder: (context, state) => ChangeNotifierProvider(
              create: (BuildContext context) => LoginWidgetModel(),
              child: const LoginWidget(),
            ),
          ),
          GoRoute(
            name: AppRoutes.details.name,
            path: AppRoutes.details.path,
            builder: (BuildContext context, GoRouterState state) {
              final news = state.extra as News;
              return NewsDetailsWidget(
                news: news,
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.loading.name,
        path: AppRoutes.loading.path,
        builder: (context, state) => ChangeNotifierProvider(
            create: (BuildContext context) => LoadingWidgetModel(),
            child: const LoadingWidget()),
        routes: <GoRoute>[
          GoRoute(
            name: AppRoutes.auth.name,
            path: AppRoutes.auth.path,
            builder: (context, state) => ChangeNotifierProvider(
                create: (BuildContext context) => AuthWidgetModel(),
                child: const AuthWidget()),
          ),
        ],
      ),
    ],
  );
}
