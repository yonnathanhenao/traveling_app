import 'package:flutter/material.dart';
import 'package:traveling_app/core/router/router.dart';

import 'core/theme/theme.dart';
import 'main_development.dart' as development;

void main() {
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouterImplementation.instance.config,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      // home: const LoginView(),
    );
  }
}
