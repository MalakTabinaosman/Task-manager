import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks/domain/entities/task.dart';
import 'package:task_management_app/features/tasks/presentation/screens/home/widget/task_tile.dart';
import 'package:task_management_app/features/tasks/presentation/screens/tasks/edit_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks;

  const TaskListScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("My Tasks")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskTile(
            task: task,
            onChanged: () {
              cubit.toggleTask(task);
            },
            onDelete: () {
              cubit.deleteTask(task);
            },
            onEdit: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTaskScreen(task: task),
                ),
              );
              if (updatedTask != null) {
                cubit.updateTask(updatedTask);
              }
              ;
            },
          );
        },
      ),
    );
  }
}
