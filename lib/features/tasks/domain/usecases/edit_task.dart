import 'package:task_management_app/features/tasks/domain/repository/task_repository.dart';

import '../entities/task.dart';

class EditTask {
  final TaskRepository repository;

  EditTask(this.repository);

  Future<void> call(Task task) {
    return repository.editTask(task);
  }
}
