import 'package:flutter/material.dart';
import 'package:learning_flutter/config/constants.dart';
import 'package:learning_flutter/models/todo/todo.dart';

class TodoListBody extends StatelessWidget {
  const TodoListBody({
    Key? key,
    required this.todoList,
    required this.todoState,
    required this.onChange,
  }) : super(key: key);

  final List<Todo> todoList;
  final TodoState todoState;
  final void Function({required Todo todo}) onChange;

  @override
  Widget build(BuildContext context) {
    if (todoList.isEmpty) {
      return const Center(child: Text('Todoはありません。'));
    }

    final List<Todo> _filteredTodo;
    if (todoState == TodoState.Active) {
      _filteredTodo = todoList.where((e) => !e.isCompleted).toList();
    } else if (todoState == TodoState.Completed) {
      _filteredTodo = todoList.where((e) => e.isCompleted).toList();
    } else {
      _filteredTodo = todoList;
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: _filteredTodo.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              title: Text(
                _filteredTodo[index].title,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '${_filteredTodo[index].description}\n'
                '${dateFormat.format(_filteredTodo[index].deadLine!)}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Checkbox(
                value: _filteredTodo[index].isCompleted,
                onChanged: (_) {
                  onChange(todo: _filteredTodo[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
