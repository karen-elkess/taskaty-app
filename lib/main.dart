import 'package:flutter/material.dart';
import 'package:taskaty_app/core/networking/dio_factory.dart';
import 'package:taskaty_app/core/services/shared_prefs.dart';
import 'package:taskaty_app/taskaty.dart';

void main() async{
 
 WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  DioFactory.init();
  runApp(const Taskaty());
  
} 