import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskaty_app/features/auth/data/repo/login_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login({
    required String email,required String password
  })async{
    emit(AuthLoading());
    final response = await LoginRepo.login(email: email, password: password);
    if(response){
      emit(Authsuccess());
    }else{
      emit(AuthError("Login failed, please check your credentials"));
    }
  }
}
