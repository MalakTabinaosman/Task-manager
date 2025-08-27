/// task.dart
///
/// Domain entity representing a Task in the system.

enum RepeatInterval { none, daily, weekly, monthly }

class Task {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime? reminderAt;
  final RepeatInterval repeat;
  final int? iconCodePoint; // Material icon code point
  final String? iconFontFamily; // Usually 'MaterialIcons'
  final String? iconFontPackage; // Usually null

  const Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
    this.reminderAt,
    this.repeat = RepeatInterval.none,
    this.iconCodePoint,
    this.iconFontFamily,
    this.iconFontPackage,
  });

  Task copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    DateTime? reminderAt,
    RepeatInterval? repeat,
    int? iconCodePoint,
    String? iconFontFamily,
    String? iconFontPackage,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      reminderAt: reminderAt ?? this.reminderAt,
      repeat: repeat ?? this.repeat,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      iconFontFamily: iconFontFamily ?? this.iconFontFamily,
      iconFontPackage: iconFontPackage ?? this.iconFontPackage,
    );
  }
}

