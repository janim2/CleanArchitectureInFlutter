import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/presentation/viewmodel/module.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Todos"),
      ),
      body: ref.watch(getTodosProvider).map(
          loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
          error: (error) => Center(
                child: Text(error.stackTrace.toString()),
              ),
          data: (todos) => ListView.builder(
                itemCount: todos.value.values.length,
                itemBuilder: (context, index) {
                  final todo = todos.value.values[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: todo.description != null
                        ? Text(todo.description!)
                        : null,
                  );
                },
              )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/todos/new');
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Todo'),
        tooltip: 'Add Todo',
      ),
    );
  }
}
