import 'package:equatable/equatable.dart';

import '../../models/loginmodel/LoginReqModel.dart';

abstract class LoginEvent extends Equatable{

}
class LoginReqEvent extends LoginEvent{ 
LoginReqModel? loginReqModel;
 LoginReqEvent({this.loginReqModel});
@override
  // TODO: implement props
  List<Object?> get props => [LoginReqModel()];
  }