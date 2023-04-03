import 'package:todo_app/domain/repo/todo.dart';
import 'package:todo_app/domain/usecases/get_todos.dart';

import '../model/todos.dart';

class GetTodosUseCaseImpt extends GetTodosUseCase {
  GetTodosUseCaseImpt(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<Todos> execute() => todosRepository.loadTodos();
}
