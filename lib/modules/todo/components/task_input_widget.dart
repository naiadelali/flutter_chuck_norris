import 'package:flutter/material.dart';

class TaskInputWidget extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final String buttonText;
  final Function()? onPressed;
  const TaskInputWidget({
    Key? key,
    required this.textController,
    required this.labelText,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: labelText,
            ),
            textInputAction: TextInputAction.next,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText),
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white),
        ),
      ],
    );
  }
}
