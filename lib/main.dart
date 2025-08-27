import 'package:flutter/material.dart';
import 'utils/theme/app_theme.dart';
import 'features/tasks/presentation/pages/tasks_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/tasks/data/models/task_model.dart';
import 'features/tasks/data/data_source/task_local_data_source.dart';
import 'features/tasks/data/repositories/task_repository_impl.dart';
import 'features/tasks/domain/usecases/get_all_tasks.dart';
import 'features/tasks/domain/usecases/add_task.dart';
import 'features/tasks/domain/usecases/edit_task.dart';
import 'features/tasks/domain/usecases/delete_task.dart';
import 'features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TaskModelAdapter());
  }
  final box = await Hive.openBox<TaskModel>('tasks');

  final dataSource = TaskLocalDataSourceImpl(box);
  final repository = TaskRepositoryImpl(dataSource);
  final getAll = GetAllTasks(repository);
  final add = AddTask(repository);
  final edit = EditTask(repository);
  final del = DeleteTask(repository);

  runApp(
    RepositoryProvider.value(
      value: repository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TasksCubit(
              getAllTasks: getAll,
              addTaskUseCase: add,
              editTaskUseCase: edit,
              deleteTaskUseCase: del,
            ),
          ),
        ],
        child: const TaskManagementApp(),
      ),
    ),
  );
}

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management App',
      themeMode: ThemeMode.system,
      theme: AppTheme.light(),
      home: const TasksPage(),
    );
  }
}
