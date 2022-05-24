import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todos_mobx/store/todo_list.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Flexible(
      child: Observer(
        builder: (_) => ListView.builder(
          itemCount: list.visibleTodos.length,
          itemBuilder: (_, int index) {
            final todo = list.visibleTodos[index];

            return Observer(
              builder: (_) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: todo.done,
                onChanged: (flag) => todo.done = flag!,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        todo.description,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => list.removeTodo(todo),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
