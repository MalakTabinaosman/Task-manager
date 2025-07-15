import 'package:task_management_app/features/tasks/data/data_source/task_local_data_source.dart';
import 'package:task_management_app/features/tasks/domain/entities/task.dart';
import 'package:task_management_app/features/tasks/domain/repository/task_repository.dart';
import '../models/task_model.dart';


class TaskRepositoryImplemention implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImplemention(this.localDataSource);

  Future<List<Task>> getTasks() async {
    final models = await localDataSource.getTasks();
    return models;
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final models = tasks.map((e) => TaskModel(
      id: e.id,
      title: e.title,
      description: e.description,
      isDone: e.isDone,
    )).toList();
    
    await localDataSource.saveTasks(models);
  }
  
  @override
  Future<void> addTask(Task task) {

    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteTask(String id) {
    
    throw UnimplementedError();
  }
  
  @override
  Future<void> editTask(Task task) {
    
    throw UnimplementedError();
  }
  
  @override
  Future<List<Task>> getAllTasks() {
    
    throw UnimplementedError();
  }
  
  @override
  Future<void> toggleTaskStatus(String id) {
    
    throw UnimplementedError();
  }
}
