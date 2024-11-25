import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_api/models/todo_model.dart';
import 'package:flutter_todo_api/services/api/api_service.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent,TodoState>{

  final ApiService apiService;
  TodoBloc({required this.apiService}): super(TodoInit()){
    on<FetchTodo>((even,emit) async{
      emit(TodoLoading());
      try{
        final todo = await apiService.fetchTodos();
        emit(TodoLoaded(todo));
      }catch (e){
        emit(TodoError(e.toString()));
      }
    });
  }
}




