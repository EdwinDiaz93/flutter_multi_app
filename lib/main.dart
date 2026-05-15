import 'package:flutter/material.dart';
import 'package:multi_app/config/main_router/router.dart';
import 'package:multi_app/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Multi App',
      theme: AppTheme().getTheme(),
    );
  }
}
