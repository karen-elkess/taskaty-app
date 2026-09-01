import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskaty_app/features/auth/data/model/task_model.dart';
import 'package:taskaty_app/features/task_details/data/repo/task_details_repo.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(TaskDetailsInitial());

  getTaskDetailes(int id)async{

    emit(TaskDetailsLoading());
    final response= await TaskDetailsRepo.getTaskDetailes(id: id);
    if(response is TaskModel){
      emit(TaskDetailsSuccess(response as TaskModel?));
    }else {
      emit(TaskDetailsError());
    }
  }
}
