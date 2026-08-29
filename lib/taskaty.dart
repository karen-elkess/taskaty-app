

import 'package:flutter/material.dart';
import 'package:taskaty_app/core/routes/app_routers.dart';
import 'package:taskaty_app/core/routes/routes.dart';
import 'package:taskaty_app/core/services/shared_prefs.dart';

class Taskaty extends StatelessWidget {
  const Taskaty({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:AppRouters.onGenerateRoute ,
      initialRoute: Routes.loginScreen,
    );
  }
  String initialRoute(){
    if(SharedPrefs.getData(PrefsKeys.token)==null){
      return Routes.loginScreen;
    }else{
      return Routes.HomeScreen;
    }
  }
}