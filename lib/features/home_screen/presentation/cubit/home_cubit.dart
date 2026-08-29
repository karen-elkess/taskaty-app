import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskaty_app/core/networking/dio_factory.dart';
import 'package:taskaty_app/features/auth/data/model/task_model.dart';
import 'package:taskaty_app/features/home_screen/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

   getTasks()async{
  emit(HomeLoading());

  final response = await HomeRepo.getData();
  if(response is TaskListResponseModel){
    emit(HomeSuccess(response.data));
  }
   else{
    emit(HomeError());
   }
   }
   editTask({
    required int taskId, String? title , String? description, String? status})async{

      emit(TaskUbdateLoading());
     
     final response= await HomeRepo.editTask(taskId:taskId , title: title,description: description);
      if(response){
        getTasks();
      }else{
        emit(TaskUbdateError());
      }
    }
}
