/// task_local_data_source.dart
///
/// Local data source using Hive for persistent storage of tasks.
import 'package:hive/hive.dart';
import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  /// Returns all stored task models.
  Future<List<TaskModel>> getAll();

  /// Inserts or updates a task model.
  Future<void> upsert(TaskModel model);

  /// Deletes a task by id.
  Future<void> delete(String id);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Box<TaskModel> box;
  TaskLocalDataSourceImpl(this.box);

  @override
  Future<List<TaskModel>> getAll() async {
    return box.values.toList(growable: false);
  }

  @override
  Future<void> upsert(TaskModel model) async {
    await box.put(model.id, model);
  }

  @override
  Future<void> delete(String id) async {
    await box.delete(id);
  }
}

