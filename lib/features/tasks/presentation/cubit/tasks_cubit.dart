/// tasks_cubit.dart
///
/// Presentation Cubit orchestrating task CRUD via domain use cases.
import 'package:bloc/bloc.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/edit_task.dart';
import '../../domain/usecases/get_all_tasks.dart';

class TasksState {
  final List<Task> tasks;
  final bool isLoading;
  const TasksState({this.tasks = const [], this.isLoading = false});

  TasksState copyWith({List<Task>? tasks, bool? isLoading}) =>
      TasksState(tasks: tasks ?? this.tasks, isLoading: isLoading ?? this.isLoading);
}

class TasksCubit extends Cubit<TasksState> {
  final GetAllTasks getAllTasks;
  final AddTask addTaskUseCase;
  final EditTask editTaskUseCase;
  final DeleteTask deleteTaskUseCase;

  TasksCubit({
    required this.getAllTasks,
    required this.addTaskUseCase,
    required this.editTaskUseCase,
    required this.deleteTaskUseCase,
  }) : super(const TasksState());

  /// Loads all tasks from persistence.
  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final all = await getAllTasks();
    emit(TasksState(tasks: all));
  }

  /// Adds a new [task] and refreshes the list.
  Future<void> add(Task task) async {
    await addTaskUseCase(task);
    await load();
  }

  /// Toggles completion for the task with [id].
  Future<void> toggle(String id) async {
    final current = state.tasks.firstWhere((t) => t.id == id);
    await editTaskUseCase(current.copyWith(isCompleted: !current.isCompleted));
    await load();
  }

  /// Edits an existing task.
  Future<void> edit(Task task) async {
    await editTaskUseCase(task);
    await load();
  }

  /// Removes a task by [id].
  Future<void> remove(String id) async {
    await deleteTaskUseCase(id);
    await load();
  }
}

