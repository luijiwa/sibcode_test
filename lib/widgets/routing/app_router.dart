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

class AppRouter {
  late final router = GoRouter(
    initialLocation: '/loading',
    routes: <GoRoute>[
      GoRoute(
        name: '/',
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            ChangeNotifierProvider(
                create: (BuildContext context) => NewsListWidgetModel(),
                child: const NewsListWidget()),
        routes: <GoRoute>[
          GoRoute(
            name: 'login',
            path: 'login',
            builder: (context, state) => ChangeNotifierProvider(
              create: (BuildContext context) => LoginWidgetModel(),
              child: const LoginWidget(),
            ),
          ),
          GoRoute(
            name: 'details',
            path: 'details',
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
        path: '/loading',
        name: 'loading',
        builder: (context, state) => ChangeNotifierProvider(
            create: (BuildContext context) => LoadingWidgetModel(),
            child: const LoadingWidget()),
        routes: <GoRoute>[
          GoRoute(
            name: 'auth',
            path: 'auth',
            builder: (context, state) => ChangeNotifierProvider(
                create: (BuildContext context) => AuthWidgetModel(),
                child: const AuthWidget()),
          ),
        ],
      ),
    ],
  );
}
