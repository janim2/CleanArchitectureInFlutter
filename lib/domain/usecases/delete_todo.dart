import 'package:flutter/foundation.dart';

abstract class DeleteTodoUseCase {
  Future<void> execute(String id);
}
