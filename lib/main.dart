import 'package:flutter/material.dart';
import 'package:flutter_test_1/shared_preferences/preferences.dart';
import 'package:flutter_test_1/task_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskApp();
  }
}