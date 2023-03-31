// ignore_for_file: depend_on_referenced_packages

import 'package:todo_app/data/repo/todo_impt.dart';
import 'package:todo_app/data/source/module.dart';
import 'package:todo_app/domain/repo/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todosProvider = Provider<TodosRepository>((ref) {
  return TodosRespositoryImpl(ref.read(filesProvider));
});
