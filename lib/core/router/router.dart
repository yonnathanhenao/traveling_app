import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:traveling_app/modules/app/ui/ui.dart';
import 'package:traveling_app/modules/auth/ui/ui.dart';

abstract class IRouter {
  RouterConfig<Object> get config;
  void go(String location);
  void push(String location);
  void pop();
}

class GoRouterImplementation implements IRouter {
  GoRouterImplementation._();
  static final instance = GoRouterImplementation._();

  final _router = GoRouter(
    initialLocation: AuthRouter.login,
    routes: [
      ...authRoutes,
      ...appRoutes,
    ],
  );

  @override
  RouterConfig<Object> get config => _router;

  @override
  void go(String location) => _router.go(location);

  @override
  void push(String location) => _router.push(location);

  @override
  void pop() => _router.pop();
}

final authRoutes = [
  GoRoute(
    path: AuthRouter.login,
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: AuthRouter.signUp,
    builder: (context, state) => const SignUpView(),
  ),
];

final appRoutes = [
  GoRoute(
    path: AppRouter.home,
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: AppRouter.profile,
    builder: (context, state) => const ProfileView(),
  ),
];
