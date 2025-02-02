import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'main_development.dart' as development;
import 'modules/auth/ui/ui.dart';

void main() {
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const LoginView(),
    );
  }
}
