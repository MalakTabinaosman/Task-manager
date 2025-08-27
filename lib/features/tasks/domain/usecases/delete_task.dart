/// delete_task.dart
///
/// Use case to delete a task by id.
import '../repository/task_repository.dart';

class DeleteTask {
  final TaskRepository repository;
  const DeleteTask(this.repository);

  /// Deletes the task identified by [id].
  Future<void> call(String id) => repository.deleteTask(id);
}

