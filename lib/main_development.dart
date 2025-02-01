import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app/core/dependencies.dart';

import 'main.dart';

void main() {
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const MainApp(),
    ),
  );
}
