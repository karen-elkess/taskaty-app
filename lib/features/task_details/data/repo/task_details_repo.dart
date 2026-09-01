

import 'package:taskaty_app/core/networking/dio_factory.dart';
import 'package:taskaty_app/features/auth/data/model/task_model.dart';

class TaskDetailsRepo {


  static Future<bool?> getTaskDetailes({required int id})async{

    try{
       final response=await DioFactory.dio?.get("tasks/$id");
       if(response?.statusCode==200){
        TaskModel taskModel= TaskModel.fromJson(response?.data['data']) ;
       }else{
        return null;
       }
    }catch(e){
       return false;
    }
    return null;
  }
}