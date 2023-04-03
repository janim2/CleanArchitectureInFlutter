import 'package:todo_app/domain/model/todo.dart';
import 'package:todo_app/domain/repo/todo.dart';
import 'package:todo_app/domain/usecases/save_todo.dart';

class SaveTodoUseCaseImpt extends SaveTodoUseCase {
  SaveTodoUseCaseImpt(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<void> execute(Todo todo) async {
    await todosRepository.saveTodo(todo);
  }
}
