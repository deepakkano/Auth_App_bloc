import 'package:api_login_signup/models/register/RegisterResModel.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {}

class RegisterInitialState extends RegisterState {
  List<Object?> get props => [];
}

class RegisterLodingState extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterLoadedState extends RegisterState {
  RegisterResModel? registerResModel;
  RegisterLoadedState({this.registerResModel});

  List<Object?> get props => [];
}

class RegisterErrorState extends RegisterState {
  String? ErrorMsg;

  RegisterErrorState({this.ErrorMsg});

  @override
  // TODO: implement props
  List<Object?> get props => [ErrorMsg];
}
