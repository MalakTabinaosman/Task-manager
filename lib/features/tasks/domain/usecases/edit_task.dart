/// edit_task.dart
///
/// Use case to edit an existing task.
import '../entities/task.dart';
import '../repository/task_repository.dart';

class EditTask {
  final TaskRepository repository;
  const EditTask(this.repository);

  /// Persists updated [task] values.
  Future<void> call(Task task) => repository.editTask(task);
}

