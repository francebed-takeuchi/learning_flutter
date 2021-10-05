import 'package:flutter/material.dart';
import 'package:learning_flutter/config/constants.dart';
import 'package:learning_flutter/models/todo/todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final dateController = TextEditingController();

  String title = '';
  String description = '';

  @override
  void initState() {
    dateController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規作成'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: 'タイトル'),
              onChanged: (String? text) {
                setState(() {
                  title = text ?? '';
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              autofocus: false,
              decoration: const InputDecoration(hintText: '内容'),
              onChanged: (String? text) {
                setState(() {
                  description = text ?? '';
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: dateController,
                    autofocus: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: '期日',
                    ),
                    onTap: () async {
                      await _pickDateTime();
                    },
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    await _pickDateTime();
                  },
                  child: const Text('選択'),
                ),
              ],
            ),
            const SizedBox(height: 70),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final todo = Todo(
                    title: title,
                    description: description,
                    deadLine: DateTime.parse(dateController.text),
                    isCompleted: false,
                  );
                  Navigator.of(context).pop(todo);
                },
                child: const Text('追加'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _pickDateTime() async {
    final _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 30),
      ),
    );
    setState(() {
      dateController.text = dateFormat.format(_date!);
    });
  }
}
