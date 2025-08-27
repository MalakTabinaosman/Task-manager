/// tasks_page.dart
///
/// Example presentation page to demonstrate feature wiring and Cubit usage.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/task.dart';
import '../cubit/tasks_cubit.dart';
import '../../../../constants/strings.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text(AppStrings.tasksTitle)),
        body: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            if (state.tasks.isEmpty) {
              return const Center(child: Text(AppStrings.noTasks));
            }
            return ListView.separated(
              itemCount: state.tasks.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) => context.read<TasksCubit>().toggle(task.id),
                  ),
                  onLongPress: () => context.read<TasksCubit>().remove(task.id),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final id = DateTime.now().millisecondsSinceEpoch.toString();
            context.read<TasksCubit>().addTask(Task(id: id, title: 'Task #$id'));
          },
          label: const Text(AppStrings.addTask),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}

