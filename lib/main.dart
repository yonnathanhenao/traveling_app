import 'package:flutter/material.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.teal[800],
          onPrimary: Colors.black,
          seedColor: Colors.grey[900]!,
        ),
      ),
      home: const LoginView(),
    );
  }
}
