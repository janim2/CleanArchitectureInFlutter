import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/data/repo/module.dart';
import 'package:todo_app/domain/usecases/delete_todo_impt.dart';
import 'package:todo_app/domain/usecases/get_todo_impt.dart';
import 'package:todo_app/domain/usecases/get_todos_impt.dart';
import 'package:todo_app/domain/usecases/save_delete_impt.dart';

final getTodosProvider = Provider(<GetTodosUseCase>(ref) {
  return GetTodosUseCaseImpt(ref.read(todosProvider));
});

final getTodoProvider = Provider(<GetTodoUseCase>(ref) {
  return GetTodoUseCaseImpt(ref.read(todosProvider));
});

final saveTodoProvider = Provider(<SaveTodoUseCase>(ref) {
  return SaveTodoUseCaseImpt(ref.read(todosProvider));
});

final deleteTodoProvider = Provider(<DeleteTodoUseCase>(ref) {
  return DeleteTodoUseCaseImpt(ref.read(todosProvider));
});
