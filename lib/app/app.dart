import 'package:flutter/material.dart';
import 'package:matjar/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // Named Constructor
  MyApp._internal();

  // Singleton or Single Instance
  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
    );
  }
}