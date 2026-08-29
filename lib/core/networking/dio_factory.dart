

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:taskaty_app/core/services/shared_prefs.dart';
class DioFactory {
  static Dio? dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://api.gosorsolutions.com/api/',
       connectTimeout: const Duration(seconds: 30),
       headers: {
        'Accept':'application/json',
        'Authorization':"Bearer ${SharedPrefs.getData(PrefsKeys.token)}",
       }
    )
  );
    dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args){
            // don't print requests with uris containing '/posts' 
            if(options.path.contains('/posts')){
              return false;
            }
            return !args.isResponse || !args.hasUint8ListData;
        }
       )  
     );
    }
  }
