import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_caspian/controller/todo_provider.dart';
import 'package:todo_caspian/views/screens/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => TodoProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
