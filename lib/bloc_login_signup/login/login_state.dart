import 'package:equatable/equatable.dart';

import '../../models/loginmodel/LoginReqModel.dart';
import '../../models/loginmodel/LoginResModel.dart';

abstract class LoginState extends Equatable{


}

class LoginInitialState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoginLoadingState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoginLoadedState extends LoginState{
LoginResModel? loginResModel  ;
LoginLoadedState({this.loginResModel});


  @override
  // TODO: implement props
  List<Object?> get props => [loginResModel];}

class LoginErrorState extends LoginState{

  String? ErrorMsg;

LoginErrorState({this.ErrorMsg});


  @override
  // TODO: implement props
  List<Object?> get props => [ErrorMsg];
  
}