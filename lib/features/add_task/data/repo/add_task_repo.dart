
import 'package:taskaty_app/core/networking/dio_factory.dart';
import 'package:taskaty_app/features/add_task/data/model/add_task_model.dart';

class AddTaskRepo {


  static Future<dynamic> addTask({ required AddTaskModel task})async{
    try{
      final response= await DioFactory.dio?.post("tasks",
      data :task.toJson());

      if(response?.statusCode==200){
      return response?.data;
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }
}