/// tasks_page.dart
///
/// Example presentation page to demonstrate feature wiring and Cubit usage.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/task.dart';
import '../cubit/tasks_cubit.dart';
import '../../../../utils/constants/strings.dart';
import '../widgets/week_calendar.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<TasksCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(title: const Text(AppStrings.tasksTitle)),
        body: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            final tasksForDay = context.read<TasksCubit>().tasksForDate(state.selectedDate);
            return Column(
              children: [
                const WeekCalendar(),
                const Divider(height: 1),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: tasksForDay.isEmpty
                        ? const Center(key: ValueKey('empty'), child: Text(AppStrings.noTasks))
                        : ListView.separated(
                            key: const ValueKey('list'),
                            itemCount: tasksForDay.length,
                            separatorBuilder: (_, __) => const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final task = tasksForDay[index];
                              return ListTile(
                                title: Text(
                                  task.title,
                                  style: TextStyle(
                                    decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                                  ),
                                ),
                                trailing: Checkbox(
                                  value: task.isCompleted,
                                  onChanged: (_) => context.read<TasksCubit>().toggle(task.id),
                                ),
                                onTap: () async {
                                  final edited = await _showAddEditDialog(context, initial: task);
                                  if (edited != null) context.read<TasksCubit>().edit(edited);
                                },
                                onLongPress: () => context.read<TasksCubit>().remove(task.id),
                              );
                            },
                          ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showAddEditDialog(context).then((value) {
              if (value != null) context.read<TasksCubit>().add(value);
            });
          },
          label: const Text(AppStrings.addTask),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}

/// Shows a dialog to add or edit a task, returning the resulting Task.
Future<Task?> _showAddEditDialog(BuildContext context, {Task? initial}) async {
  final controller = TextEditingController(text: initial?.title ?? '');
  DateTime? reminderAt = initial?.reminderAt;
  RepeatInterval repeat = initial?.repeat ?? RepeatInterval.none;
  IconData? icon = (initial?.iconCodePoint != null)
      ? IconData(initial!.iconCodePoint!, fontFamily: initial.iconFontFamily, fontPackage: initial.iconFontPackage)
      : null;

  return showDialog<Task>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(initial == null ? AppStrings.addTask : AppStrings.editTask),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: AppStrings.taskTitleHint),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text(AppStrings.icon),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: Icon(icon ?? Icons.flag_outlined),
                    onPressed: () async {
                      // Simple icon picker: toggle between two for demo purposes.
                      icon = icon == null ? Icons.flag : null;
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(AppStrings.reminder),
                  const SizedBox(width: 12),
                  TextButton(
                    onPressed: () async {
                      final now = DateTime.now();
                      reminderAt = DateTime(now.year, now.month, now.day, now.hour, (now.minute + 5) % 60);
                      (context as Element).markNeedsBuild();
                    },
                    child: Text(reminderAt?.toLocal().toString() ?? '-'),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(AppStrings.repeat),
                  const SizedBox(width: 12),
                  DropdownButton<RepeatInterval>(
                    value: repeat,
                    items: RepeatInterval.values
                        .map((r) => DropdownMenuItem(value: r, child: Text(r.name)))
                        .toList(),
                    onChanged: (v) {
                      if (v != null) {
                        repeat = v;
                        (context as Element).markNeedsBuild();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              final title = controller.text.trim();
              if (title.isEmpty) {
                Navigator.of(context).pop(null);
                return;
              }
              final id = initial?.id ?? DateTime.now().millisecondsSinceEpoch.toString();
              final task = Task(
                id: id,
                title: title,
                isCompleted: initial?.isCompleted ?? false,
                reminderAt: reminderAt,
                repeat: repeat,
                iconCodePoint: icon?.codePoint,
                iconFontFamily: icon?.fontFamily,
                iconFontPackage: icon?.fontPackage,
              );
              Navigator.of(context).pop(task);
            },
            child: const Text(AppStrings.save),
          ),
        ],
      );
    },
  );
}

