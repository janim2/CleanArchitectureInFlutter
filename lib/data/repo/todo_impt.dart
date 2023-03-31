import 'dart:convert';

import 'package:todo_app/data/source/files.dart';
import 'package:todo_app/domain/model/todos.dart';

import '../../domain/model/todo.dart';
import '../../domain/repo/todo.dart';
import 'package:collection/collection.dart';

class TodosRespositoryImpl extends TodosRepository {
  TodosRespositoryImpl(this.files);
  final Files files;

  late final String path = 'todos.json';

  @override
  Future<void> deleteAllTodos() async {
    //Delete files by path
    await files.delete(path);
  }

  @override
  Future<void> deleteTodo(String id) async {
    //Delete file by path
    final todos = await loadTodos();

    //remove todos from the list
    final newTodos = todos.values.where((t) => t.id  != id).toList();

    //save the new list
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }

  @override
  Future<Todos> loadTodos() async {
    ///load the todos from path
    final content = await files.read(path);
    if (content == null) return const Todos(values: []);

    //Transform it to jsonn and then the todos list
    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();
    //Search the todo by id
    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    //Delete file by path
    final todos = await loadTodos();
 
    //remove todos from the list
    final newTodos = todos.values.where((t) => t.id != todo.id).toList();

    //add the new todo
    newTodos.add(todo);

    //save the new list
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }
}
