/// tasks_cubit.dart
///
/// Presentation Cubit managing a simple list of tasks.
import 'package:bloc/bloc.dart';
import '../../domain/entities/task.dart';

class TasksState {
  final List<Task> tasks;
  const TasksState({this.tasks = const []});
}

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(const TasksState());

  void addTask(Task task) {
    final next = List<Task>.from(state.tasks)..add(task);
    emit(TasksState(tasks: next));
  }

  void toggle(String id) {
    final next = state.tasks
        .map((t) => t.id == id ? t.copyWith(isCompleted: !t.isCompleted) : t)
        .toList(growable: false);
    emit(TasksState(tasks: next));
  }

  void remove(String id) {
    final next = state.tasks.where((t) => t.id != id).toList(growable: false);
    emit(TasksState(tasks: next));
  }
}

