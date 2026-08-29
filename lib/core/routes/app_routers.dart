import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty_app/core/routes/routes.dart';
import 'package:taskaty_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:taskaty_app/features/auth/presentation/ui/login_screen.dart';
import 'package:taskaty_app/features/home_screen/presentation/cubit/home_cubit.dart';
import 'package:taskaty_app/features/home_screen/presentation/ui/home_screen.dart';

class AppRouters {
  static MaterialPageRoute onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const LoginScreen(),
                ));

      case Routes.HomeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit()..getTasks(),
            child: HomeScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Column(
                      children: [Text("Error 404")],
                    ),
                  ),
                ));
    }
  }
}
