import 'dart:convert';

class TaskModel {
  final bool? completed;
  final String desc;
  const TaskModel({
    this.completed = false,
    required this.desc,
  });

  TaskModel copyWith({
    bool? completed,
    String? desc,
  }) {
    return TaskModel(
      completed: completed ?? this.completed,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'completed': completed,
      'desc': desc,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      completed: map['completed'],
      desc: map['desc'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() => 'TaskModel(completed: $completed, desc: $desc)';

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is TaskModel &&
  //       other.completed == completed &&
  //       other.desc == desc;
  // }

  // @override
  // int get hashCode => completed.hashCode ^ desc.hashCode;
}
