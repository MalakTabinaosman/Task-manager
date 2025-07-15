import 'package:task_management_app/features/tasks/domain/repository/task_repository.dart';


class ToggleTaskStatus {
  final TaskRepository repository;

  ToggleTaskStatus(this.repository);

  Future<void> call(String id) {
    return repository.toggleTaskStatus(id);
  }
}
