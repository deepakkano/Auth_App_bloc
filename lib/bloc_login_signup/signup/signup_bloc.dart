import 'dart:math';

import 'package:api_login_signup/Api_call_repo/Register_repo.dart';
import 'package:api_login_signup/bloc_login_signup/signup/signup_event.dart';
import 'package:api_login_signup/bloc_login_signup/signup/signup_state.dart';
import 'package:api_login_signup/models/register/RegisterResModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
RegisterBloc():super(RegisterInitialState()) {
  on<RegisterReqEvent>((event,emit) async{
emit(RegisterLodingState());
 

try {
RegisterResModel registerResModel =await RegisterRepo().register(
  event.registerReqModel?.email??"",
  event.registerReqModel?.password??""
);
emit (RegisterLoadedState(registerResModel: registerResModel));
}
catch(e){
  emit(RegisterErrorState(ErrorMsg: e.toString()));
}

 });


}
}