import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TodoList1 extends StatefulWidget {
  const TodoList1({Key? key}) : super(key: key);

  @override
  _TodoList1State createState() => _TodoList1State();
}

class _TodoList1State extends State<TodoList1> {
  final List<TodoItem> _todoItems = <TodoItem>[];

  void _addTodoItem(String task, File? imageFile) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.add(TodoItem(task: task, imageFile: imageFile));
      });
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mark ${_todoItems[index].task} as complete?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Complete'),
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildTodoItem(_todoItems[index], index);
      },
    );
  }

  Widget _buildTodoItem(TodoItem todoItem, int index) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todoItem.task),
          SizedBox(height: 8.0),
          if (todoItem.imageFile != null)
            Image.file(
              todoItem.imageFile!,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
        ],
      ),
      onTap: () => _promptRemoveTodoItem(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: _buildTodoList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _pushAddTodoScreen(context),
          tooltip: 'Add task',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _pushAddTodoScreen(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Add a item')),
          body: Column(
            children: [
              if (pickedFile != null)
                Image.file(
                  File(pickedFile.path),
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              TextField(
                autofocus: true,
                onSubmitted: (String val) {
                  _addTodoItem(val, pickedFile != null ? File(pickedFile.path) : null);
                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                  hintText: 'Write ToDo item...',
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}

class TodoItem {
  final String task;
  final File? imageFile;

  TodoItem({required this.task, this.imageFile});
}
