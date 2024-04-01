import 'package:flutter/material.dart';
import 'package:flutter_test_1/screens/screens.dart';
import 'package:flutter_test_1/themes/theme_app.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: UserFormScreen()
    );
  }
}
