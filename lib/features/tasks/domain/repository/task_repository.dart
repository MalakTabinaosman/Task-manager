/// task_repository.dart
///
/// Abstract repository defining the contract for task persistence.
import '../entities/task.dart';

abstract class TaskRepository {
  /// Returns all tasks currently stored.
  Future<List<Task>> getAllTasks();

  /// Persists a new task.
  Future<void> addTask(Task task);

  /// Updates an existing task by id with new values.
  Future<void> editTask(Task task);

  /// Deletes a task by id.
  Future<void> deleteTask(String id);
}

