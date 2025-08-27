// GENERATED STUB: If build_runner is unavailable, this minimal adapter enables runtime.
// For production, run code generation to regenerate this file.

part of 'task_model.dart';

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 1;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};
    for (int i = 0; i < numOfFields; i++) {
      fields[reader.readByte()] = reader.read();
    }
    return TaskModel(
      id: fields[0] as String,
      title: fields[1] as String,
      isCompleted: fields[2] as bool,
      reminderAt: fields[3] as DateTime?,
      repeatIndex: fields[4] as int,
      iconCodePoint: fields[5] as int?,
      iconFontFamily: fields[6] as String?,
      iconFontPackage: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.reminderAt)
      ..writeByte(4)
      ..write(obj.repeatIndex)
      ..writeByte(5)
      ..write(obj.iconCodePoint)
      ..writeByte(6)
      ..write(obj.iconFontFamily)
      ..writeByte(7)
      ..write(obj.iconFontPackage);
  }
}

