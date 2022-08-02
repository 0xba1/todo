import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_caspian/controller/todo_provider.dart';

class EditDialog extends StatefulWidget {
  const EditDialog({Key? key}) : super(key: key);

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: DecoratedBox(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Create Todo'),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  final todoProvider = context.read<TodoProvider>();
                  todoProvider.createTodo(controller.text);
                  Navigator.of(context).pop();
                },
                child: const Text('Create Todo'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
