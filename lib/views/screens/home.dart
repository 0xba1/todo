import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_caspian/controller/todo_provider.dart';
import 'package:todo_caspian/views/widgets/edit_dialog.dart';
import 'package:todo_caspian/views/widgets/todo_tile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoList = context.watch<TodoProvider>().list;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) => TodoTile(todo: todoList[index])),
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => const EditDialog(),
        ),
      ),
    );
  }
}
