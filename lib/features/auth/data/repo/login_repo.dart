

import 'package:taskaty_app/core/networking/dio_factory.dart';
import 'package:taskaty_app/core/networking/end_points.dart';
import 'package:taskaty_app/core/services/shared_prefs.dart';

class LoginRepo {


  static login({required String email , required String password})async{
  try{
   var response = await DioFactory.dio?.post(EndPoints.login,
   data: {
    "email": email,
    "password":password,
   }
   );
   if (response?.statusCode ==200){
     String? token = response?.data['data']?['token'] ?? response?.data['token'];

        if (token != null) {
  
          await SharedPrefs.saveData(key: PrefsKeys.token, value: token);
          return true;
        }}

  }catch(e){
    print("e");
    return false;
  }
  }
}