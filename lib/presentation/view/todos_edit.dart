import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shortid/shortid.dart';
import 'package:todo_app/domain/model/todo.dart';
import 'package:todo_app/domain/usecases/module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/presentation/viewmodel/module.dart';
import 'package:todo_app/presentation/widgets/extensions.dart';

class TodosEdit extends ConsumerStatefulWidget {
  const TodosEdit({super.key, this.todoId});

  final String? todoId;

  @override
  ConsumerState<TodosEdit> createState() => _TodosEditState();
}

class _TodosEditState extends ConsumerState<TodosEdit> {
  final _formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final desription = TextEditingController();
  late final model = ref.read(todosListModel);
  bool isCompleted = false;
  bool editted = false;

  void change() {
    if (mounted) {
      setState(() {
        editted = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    title.addListener(change);
    desription.addListener(change);
    if (widget.todoId != null) {
      model.get(widget.todoId!).then((value) {
        if (value != null) {
          title.text = value.title;
          desription.text = value.description ?? '';
          isCompleted = value.completed;

          if (mounted) {
            setState(() {
              isCompleted = value.completed;
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            onWillPop: () async {
              if (editted) {
                final confirmed = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Discard Changes?'),
                          content: const Text(
                              'Are you sure you want to discharge this changes?'),
                          actions: [
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('No')),
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                style: TextButton.styleFrom(
                                    foregroundColor:
                                        Theme.of(context).colorScheme.error),
                                child: const Text('Yes'))
                          ],
                        ));
                if (confirmed == true) return true;
                return false;
              }
              return true;
            },
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: desription,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                CheckboxListTile(
                  title: const Text('Completed'),
                  value: isCompleted,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        isCompleted = value!;
                        editted = true;
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              final todo = Todo(
                  id: shortid.generate(),
                  description: desription.text,
                  title: title.text,
                  completed: isCompleted);

              final messenger = ScaffoldMessenger.of(context);
              final router = GoRouter.of(context);
              await model.save(todo);
              messenger.toast('Todo saved');
              if (router.canPop()) router.pop();
            }
          },
          icon: const Icon(Icons.save),
          label: const Text('Save')),
    );
  }
}
