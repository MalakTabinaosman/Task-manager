class Task {
  final String id;
  final String title;
  final String description; 
  final bool isDone;

  const Task({
    required this.id,
    required this.title,
    required this.description, 
    this.isDone = false,
  });

  Task copyWith({
    String? id,
    String? title,
    String? description, 
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description, 
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.id == id &&
        other.title == title &&
        other.description == description && 
        other.isDone == isDone;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode ^ isDone.hashCode;
}
