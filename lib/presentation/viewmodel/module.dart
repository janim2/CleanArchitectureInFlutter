import 'package:todo_app/domain/model/todos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/data/repo/module.dart';

part 'module.g.dart';

@riverpod
Future<Todos> getTodos(GetTodosRef ref) async {
  final todos = ref.watch(todosProvider);

  final items = await todos.loadTodos();
  return items;
}
