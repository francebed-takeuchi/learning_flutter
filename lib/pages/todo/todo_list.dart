import 'package:flutter/material.dart';
import 'package:learning_flutter/models/todo/todo.dart';
import 'package:learning_flutter/pages/add_todo/add_todo.dart';
import 'package:learning_flutter/pages/todo/todo_body.dart';

/// TodoListを表示するためのページ
/// 画面上部にタブを設置してTodoの状態(全て、未完了、完了)に応じて分ける
class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Todo> todoList = []; // 保持するTodoList

  /// TodoListを期日が早い順にソートする
  void sortTodoList() {
    todoList.sort((a, b) => a.deadLine!.compareTo(b.deadLine!));
  }

  /// TodoListの状態(完了・未完了)を変更する
  void changeState({required Todo todo}) {
    setState(() {
      todoList.firstWhere((e) => e == todo).isCompleted = !todo.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// タブとして表示するページのリスト
    /// enumとして定義したTodoStateを1つずつ取り出して、TodoPageListに渡す
    final pageList = TodoState.values
        .map((e) => TodoListBody(
              todoList: todoList,
              todoState: e,
              onChange: changeState,
            ))
        .toList();

    /// タブを使用する場合にDefaultTabControllerを使用する
    return DefaultTabController(
      length: pageList.length, // タブの数
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          bottom: TabBar(
            indicatorWeight: 4, // タブの下に白い線の太さ
            tabs: TodoState.values
                .map((e) => Tab(text: e.toString().split('.')[1]))
                .toList(), // タブに表示するテキストをenumから取得してリスト化
          ),
        ),

        /// タブを切り替えた時に表示するページ
        body: TabBarView(
          children: pageList,
        ),

        /// Todoを新たに追加ためのページを開く
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // ページの移動先から値を受け取る
            final result = await Navigator.of(context).push<Todo>(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return const AddTodo();
                },
              ),
            );
            if (result != null) {
              setState(() {
                todoList.add(result);
                sortTodoList();
              });
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
