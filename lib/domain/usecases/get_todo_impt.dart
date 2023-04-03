import 'package:todo_app/domain/model/todo.dart';
import 'package:todo_app/domain/repo/todo.dart';
import 'package:todo_app/domain/usecases/get_todo.dart';

class GetTodoUseCaseImpt extends GetTodoUseCase {
  GetTodoUseCaseImpt(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<Todo?> execute(String id) =>  todosRepository.getTodoById(id);
}
