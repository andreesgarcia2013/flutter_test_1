import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_test_1/models/task_model.dart';
import 'package:flutter_test_1/shared_preferences/preferences.dart';

class TaskProvider extends ChangeNotifier{
  String _baseUrl='csdevapi.nextline.mx/vdev/tasks-challenge/tasks';
  String _apiKey='e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd';
  String _userToken=Preferences.token;

  List<TaskModel> myTasks=[];

  TaskProvider(){
    print('trigger de provider');
    this.getMyTasks();
  }

  Future<String> _getJsonData(String endpoint) async{
     var url = Uri.https(
      'ecsdevapi.nextline.mx',
      '/vdev/tasks-challenge/tasks$endpoint',
      {'token': _userToken},
    );

      var headers = {
        'Authorization': 'Bearer $_apiKey',
      };
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url, headers: headers);
    return response.body;
  }

  getMyTasks() async {
    final jsonData = await _getJsonData('');
    var response = jsonDecode(jsonData) as List;
    myTasks=response.map((task) => TaskModel.fromJson(task)).toList();
    notifyListeners();
  }
}