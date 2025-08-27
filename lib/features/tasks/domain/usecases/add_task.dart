/// add_task.dart
///
/// Use case to add a new task.
import '../entities/task.dart';
import '../repository/task_repository.dart';

class AddTask {
  final TaskRepository repository;
  const AddTask(this.repository);

  /// Adds the provided [task] to persistence.
  Future<void> call(Task task) => repository.addTask(task);
}

