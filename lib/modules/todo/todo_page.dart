import '../../common/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'components/list_task_widget.dart';
import 'components/task_input_widget.dart';
import 'todo_controller.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  var controller = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Lista de tarefas'),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(17, 24, 17, 40),
              child: TaskInputWidget(
                textController: controller.textController,
                onPressed: () => setState(() => controller.addToDo()),
                buttonText: 'ADD',
                labelText: 'Nova tarefa',
              )),
          Expanded(
            child: ListTaskWidget(
              itemCount: controller.todoList.length,
              todoList: controller.todoList,
              onChanged: (value, index) => setState(() {
                controller.onUpdateStatusTask(value, index);
              }),
              onDimissed: (index) => setState(() {
                controller.onRemoveTask(index);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
