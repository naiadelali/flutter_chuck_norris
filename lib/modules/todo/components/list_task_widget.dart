import 'package:flutter/material.dart';

import 'task_item_widget.dart';

class ListTaskWidget extends StatelessWidget {
  final int itemCount;
  final List todoList;
  final Function(bool?, int index) onChanged;
  final Function(int index) onDimissed;
  const ListTaskWidget(
      {Key? key,
      required this.itemCount,
      required this.todoList,
      required this.onChanged,
      required this.onDimissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (_, index) {
          var task = todoList[index];
          return TaskItemWidget(
            completed: task.completed,
            title: task.desc,
            onChanged: (value) => onChanged(value, index),
            onDismissed: (direction) => onDimissed(index),
          );
        });
  }
}
