import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_api/bloc/todo_bloc.dart';
import 'package:flutter_todo_api/models/todo_model.dart';
import 'package:flutter_todo_api/services/api/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _txtTitle = TextEditingController();

  void showBottomSheet() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _txtTitle,
                decoration: InputDecoration(
                  hintText: 'Input Todo Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  void createTodo() async {
    final todo = TodoModel(title: _txtTitle.text, isCompleted: true);
    await ApiService.instance.createTodo(todo);
    _txtTitle.clear();
    context.read<TodoBloc>().add(FetchTodo());  // Fetch todos again after adding new one
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showBottomSheet,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is TodoError) {
            return Center(
              child: Text('Error: ${state.toString()}'),
            );
          } else if (state is TodoLoaded) {
            final todos = state.todo;
            return ListView.separated(
              separatorBuilder: (ctx, index) => const SizedBox(height: 10),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(todo.isCompleted ? 'Completed' : 'Pending'),
                      Text(
                        'Created at: ${todo.createdAt?.toLocal()}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();  // Fallback for unhandled state
        },
      ),
    );
  }
}
