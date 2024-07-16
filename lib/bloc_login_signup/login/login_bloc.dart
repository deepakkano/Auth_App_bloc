import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Api_call_repo/Login_repo.dart';
import '../../models/loginmodel/LoginResModel.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBlocCode extends Bloc<LoginEvent,LoginState>{
  LoginBlocCode():super(LoginInitialState()){

  on<LoginReqEvent>((event,emit) async{
    emit(LoginLoadingState());
  
try{
   LoginResModel loginResModel = await LoginRepo().login(
    event.loginReqModel?.username??"",
    event.loginReqModel?.password??"" );
  emit(LoginLoadedState(loginResModel: loginResModel));
}
catch(e){
emit(LoginErrorState(ErrorMsg: e.toString()));
}
  });
  }
}