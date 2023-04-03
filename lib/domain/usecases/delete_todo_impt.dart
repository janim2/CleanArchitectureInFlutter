import 'package:todo_app/domain/model/todo.dart';
import 'package:todo_app/domain/repo/todo.dart';
import 'package:todo_app/domain/usecases/delete_todo.dart';

class DeleteTodoUseCaseImpt extends DeleteTodoUseCase {
  DeleteTodoUseCaseImpt(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<void> execute(String id) async {
    await todosRepository.deleteTodo(id);
  }
}
