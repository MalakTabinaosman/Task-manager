/// get_all_tasks.dart
///
/// Use case to fetch all tasks.
import '../entities/task.dart';
import '../repository/task_repository.dart';

class GetAllTasks {
  final TaskRepository repository;
  const GetAllTasks(this.repository);

  /// Returns all tasks from persistence.
  Future<List<Task>> call() => repository.getAllTasks();
}

