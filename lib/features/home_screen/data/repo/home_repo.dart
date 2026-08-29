


import 'package:dio/dio.dart';
import 'package:taskaty_app/core/networking/dio_factory.dart';
import 'package:taskaty_app/core/networking/end_points.dart';
import 'package:taskaty_app/features/auth/data/model/task_model.dart';

class HomeRepo {


  static Future<Object> getData()async{
   try{
   final response =await DioFactory.dio?.get(EndPoints.tasks);
   if(response?.statusCode==200){
     TaskListResponseModel data =TaskListResponseModel.fromJson(response?.data);

     return data;
   }else{
    return false;
   }
    }catch(e){
     return false;
   }
  }

 static editTask({required int taskId, String? title , String? description, String? status})async{

  try{
   final response =await DioFactory.dio?.put("tasks/$taskId",
   data: {
    "title": title,
    "description":description,
    "status":status,
   }
   );
   if(response?.statusCode==200){
     return true;
   }else{
    return false;
   }
  }catch(e){
   return false;
  }
 }

}
