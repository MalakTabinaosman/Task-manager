import 'package:task_management_app/features/tasks/data/models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> getTasks(); 
  Future<void> saveTasks(List<TaskModel> tasks); 
}
