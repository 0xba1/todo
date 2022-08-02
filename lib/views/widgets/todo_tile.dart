import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_caspian/controller/todo_provider.dart';
import 'package:todo_caspian/model/todo.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (_) {
        context.read<TodoProvider>().deleteTodo(todo.id);
      },
      background: ColoredBox(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.delete_outlined),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      // secondaryBackground: ColoredBox(
      //   color: Colors.red,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: const [
      //       SizedBox(
      //         width: 16,
      //       ),
      //       Icon(Icons.delete_outlined),
      //     ],
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListTile(
          leading: todo.isCompleted
              ? const Icon(Icons.check)
              : const Icon(Icons.square),
          title: Text(todo.title),
          trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: (val) {
                context.read<TodoProvider>().toggleTodo(todo.id);
              }),
        ),
      ),
    );
  }
}
