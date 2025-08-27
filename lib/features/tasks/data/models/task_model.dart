/// task_model.dart
///
/// Hive model for Task and adapters to convert between domain entity and model.
import 'package:hive/hive.dart';
import '../../domain/entities/task.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  bool isCompleted;

  @HiveField(3)
  DateTime? reminderAt;

  @HiveField(4)
  int repeatIndex; // maps to RepeatInterval

  @HiveField(5)
  int? iconCodePoint;

  @HiveField(6)
  String? iconFontFamily;

  @HiveField(7)
  String? iconFontPackage;

  TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.reminderAt,
    required this.repeatIndex,
    this.iconCodePoint,
    this.iconFontFamily,
    this.iconFontPackage,
  });

  /// Creates a model from a domain entity.
  factory TaskModel.fromEntity(Task task) => TaskModel(
        id: task.id,
        title: task.title,
        isCompleted: task.isCompleted,
        reminderAt: task.reminderAt,
        repeatIndex: task.repeat.index,
        iconCodePoint: task.iconCodePoint,
        iconFontFamily: task.iconFontFamily,
        iconFontPackage: task.iconFontPackage,
      );

  /// Converts this model to a domain entity.
  Task toEntity() => Task(
        id: id,
        title: title,
        isCompleted: isCompleted,
        reminderAt: reminderAt,
        repeat: RepeatInterval.values[repeatIndex],
        iconCodePoint: iconCodePoint,
        iconFontFamily: iconFontFamily,
        iconFontPackage: iconFontPackage,
      );
}

