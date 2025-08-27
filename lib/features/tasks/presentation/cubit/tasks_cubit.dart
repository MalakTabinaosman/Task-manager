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
  final DateTime weekStart; // Monday of current week view
  final DateTime selectedDate; // Selected day within week

  const TasksState({
    this.tasks = const [],
    this.isLoading = false,
    DateTime? weekStart,
    DateTime? selectedDate,
  })  : weekStart = weekStart ?? _mondayOf(DateTime.now()),
        selectedDate = selectedDate ?? DateTime.now();

  static DateTime _mondayOf(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    final int weekday = d.weekday; // 1 (Mon) .. 7 (Sun)
    return d.subtract(Duration(days: weekday - 1));
  }

  TasksState copyWith({
    List<Task>? tasks,
    bool? isLoading,
    DateTime? weekStart,
    DateTime? selectedDate,
  }) => TasksState(
        tasks: tasks ?? this.tasks,
        isLoading: isLoading ?? this.isLoading,
        weekStart: weekStart ?? this.weekStart,
        selectedDate: selectedDate ?? this.selectedDate,
      );
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

  /// Sets the currently selected date within the visible week.
  void setSelectedDate(DateTime date) {
    emit(state.copyWith(selectedDate: DateTime(date.year, date.month, date.day)));
  }

  /// Moves the visible week by [deltaWeeks] (negative for previous, positive for next).
  void shiftWeek(int deltaWeeks) {
    final newStart = state.weekStart.add(Duration(days: 7 * deltaWeeks));
    emit(state.copyWith(weekStart: newStart, selectedDate: newStart));
  }

  /// Returns tasks scheduled for [date] (by reminderAt date). Tasks without reminder are excluded.
  List<Task> tasksForDate(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    return state.tasks.where((t) {
      if (t.reminderAt == null) return false;
      final r = t.reminderAt!;
      return r.year == d.year && r.month == d.month && r.day == d.day;
    }).toList(growable: false);
  }
}

