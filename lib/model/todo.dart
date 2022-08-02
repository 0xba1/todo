import 'package:uuid/uuid.dart' as uuid;

class Todo {
  late final String id;
  final String title;
  bool isCompleted = false;

  Todo(this.title) : id = const uuid.Uuid().v4();
}
