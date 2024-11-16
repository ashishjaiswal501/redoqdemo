import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterProvider {
  static final GoRouter routerProvider = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        name: "login",
        path: '/',
        builder: (BuildContext context, GoRouterState state) => Center(),
        routes: const <GoRoute>[],
      ),
      GoRoute(
        name: "home",
        path: '/home',
        builder: (BuildContext context, GoRouterState state) => const Center(),
        routes: const <GoRoute>[],
      ),
    ],
  );
}
