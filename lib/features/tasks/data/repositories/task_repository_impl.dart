/// task_repository_impl.dart
///
/// Repository implementation backed by Hive local data source.
import '../../domain/entities/task.dart';
import '../../domain/repository/task_repository.dart';
import '../data_source/task_local_data_source.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource local;
  TaskRepositoryImpl(this.local);

  @override
  Future<void> addTask(Task task) async {
    await local.upsert(TaskModel.fromEntity(task));
  }

  @override
  Future<void> deleteTask(String id) async {
    await local.delete(id);
  }

  @override
  Future<void> editTask(Task task) async {
    await local.upsert(TaskModel.fromEntity(task));
  }

  @override
  Future<List<Task>> getAllTasks() async {
    final models = await local.getAll();
    return models.map((m) => m.toEntity()).toList(growable: false);
  }
}

