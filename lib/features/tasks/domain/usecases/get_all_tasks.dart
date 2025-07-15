import 'package:task_management_app/features/tasks/domain/repository/task_repository.dart';

import '../entities/task.dart';

class GetAllTasks {
  final TaskRepository repository;

  GetAllTasks(this.repository);

  Future<List<Task>> call() {
    return repository.getAllTasks();
  }
}
