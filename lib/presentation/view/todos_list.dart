import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/presentation/viewmodel/module.dart';
import 'package:todo_app/presentation/widgets/extensions.dart';
import 'package:todo_app/presentation/widgets/todo_tile.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosListState);
    final active = todos.active;
    final completed = todos.completed;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Todos"),
        actions: [
IconButton(
        onPressed: () {
          context.go('/todos/new');
        },
        icon: const Icon(Icons.add),
        tooltip: 'Add Todo',
      ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: todos.values.isEmpty
                ? const Center(
                    child: Text('No todos found'),
                  )
                : ListView.builder(
                    itemCount: active.length,
                    itemBuilder: (context, index) {
                      final todo = active[index];
                      return TodoTile(todo: todo);
                    },
                  ),
          ),
          if (completed.isNotEmpty)
            ExpansionTile(
              title: const Text('completed'),
              children: [
                for (final todo in completed) TodoTile(todo: todo),
              ],
            )
        ],
      ),
    );
  }
}
