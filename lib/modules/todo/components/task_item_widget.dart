import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  final bool completed;
  final String title;
  final Function(bool?)? onChanged;
  final Function(DismissDirection)? onDismissed;

  const TaskItemWidget({
    Key? key,
    required this.completed,
    required this.title,
    this.onChanged,
    this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      child: CheckboxListTile(
        secondary: Icon(
          completed ? Icons.check_circle : Icons.error,
        ),
        title: Text(
          title,
          style: completed
              ? TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        value: completed,
        onChanged: onChanged,
      ),
      onDismissed: onDismissed,
      background: Container(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
