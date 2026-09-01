import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskaty_app/features/add_task/data/model/add_task_model.dart';
import 'package:taskaty_app/features/add_task/data/repo/add_task_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addTask(AddTaskModel task)async{
    emit(AddTaskLoading());
    final response = await AddTaskRepo.addTask(task: task);
    if(response){
    emit(AddTaskSuccess());
    }else{
     emit(AddTaskError());
    }
  }
}
