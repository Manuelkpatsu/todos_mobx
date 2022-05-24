import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_mobx/store/todo_list.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);
    final _textController = TextEditingController();

    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
        labelText: 'Add a Todo',
        contentPadding: EdgeInsets.all(8),
      ),
      controller: _textController,
      textInputAction: TextInputAction.done,
      onSubmitted: (String value) {
        list.addTodo(value);
        _textController.clear();
      },
    );
  }
}
