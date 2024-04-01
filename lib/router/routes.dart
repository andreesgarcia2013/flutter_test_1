import 'package:flutter/material.dart';
import 'package:flutter_test_1/screens/screens.dart';

Map<String, WidgetBuilder> getAplicationRoutes(){
  return <String, WidgetBuilder>{
  '/username':(BuildContext context) => const UserFormScreen(),
};
}