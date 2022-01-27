import 'package:flutter/material.dart';

import 'models/task_model.dart';

class TodoController {
  final TextEditingController textController = TextEditingController();
  final todoList = <TaskModel>[];

  void addToDo() {
    if (textController.text.isNotEmpty) {
      var newTask = TaskModel(desc: textController.text);
      todoList.add(newTask);
      textController.text = '';
    }
  }

  void onUpdateStatusTask(bool? value, int index) {
    // var obj1 = TaskModel(
    //     desc: todoList[index].desc, completed: todoList[index].completed);
    // var obj2 = todoList[index];
    //rint(obj1 == obj2);
    todoList[index] = todoList[index].copyWith(completed: value ?? false);
  }

  void onRemoveTask(int index) {
    todoList.removeAt(index);
  }
}
