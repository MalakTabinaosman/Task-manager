import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'task_local_data_source.dart'; 
import '../models/task_model.dart';

class TaskLocalDataSourceImplemention implements TaskLocalDataSource {
  final SharedPreferences prefs;

  TaskLocalDataSourceImplemention(this.prefs); 

  static const String taskKey = 'TASKS'; 

  @override
  Future<List<TaskModel>> getTasks() async {
    final jsonString = prefs.getString(taskKey);

    if (jsonString != null) {
      final List decoded = json.decode(jsonString);
      return decoded.map((e) => TaskModel.fromJson(e)).toList();
    }

    return []; 
  }

  @override
  Future<void> saveTasks(List<TaskModel> tasks) async {
    final List<Map<String, dynamic>> taskList =
        tasks.map((e) => e.toJson()).toList(); 
    await prefs.setString(taskKey, json.encode(taskList)); 
  }
}
