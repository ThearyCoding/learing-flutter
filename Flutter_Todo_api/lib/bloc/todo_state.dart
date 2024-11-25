
part of 'todo_bloc.dart';

abstract class TodoState{}

class TodoInit extends TodoState{}

class TodoLoading extends TodoState{}

class TodoLoaded extends TodoState{
  final List<TodoModel> todo;

  TodoLoaded(this.todo);
}

class TodoError extends TodoState{
  String error;

  TodoError(this.error);
}