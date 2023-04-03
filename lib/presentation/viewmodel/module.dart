// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:todo_app/domain/model/todos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/domain/usecases/module.dart';

import '../../domain/model/todo.dart';
import '../../domain/usecases/get_todos.dart';

// final todosListNotifier = ChangeNotifierProvider<ValueNotifier<Todos>>(
//     (ref) => ValueNotifier(const Todos(values: [])));

class TodosStateNotifier extends StateNotifier<Todos> {
  TodosStateNotifier(this.ref) : super(const Todos(values: [])) {
    loadTodos();
  }

  final Ref ref;
  late final getTodos = ref.read(getTodosProvider);

  Future<void> loadTodos() async {
    state = await getTodos.execute();
  }

  Future<void> save(Todo todo) async {
    await ref.read(saveTodoProvider).execute(todo);
    await loadTodos();
  }

  Future<Todo?> get(String id) async {
    return await ref.read(getTodoProvider).execute(id);
  }

  Future delete(String id) async {
    await ref.read(deleteTodoProvider).execute(id);
    await loadTodos();
  }
}

final todosListState = StateNotifierProvider<TodosStateNotifier, Todos>((ref) {
  return TodosStateNotifier(ref);
});

final todosListModel = Provider<TodosStateNotifier>((ref) {
  return ref.watch(todosListState.notifier);
});
