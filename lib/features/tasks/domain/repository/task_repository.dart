import '../entities/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<void> deleteTask(String id);
  Future<void> toggleTaskStatus(String id);
  Future<List<Task>> getAllTasks();
  Future<void> editTask(Task task);
}
