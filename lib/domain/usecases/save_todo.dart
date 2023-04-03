import 'package:flutter/foundation.dart';
import 'package:todo_app/domain/model/todo.dart';

abstract class SaveTodoUseCase {
  Future<void> execute(Todo todo);
}
