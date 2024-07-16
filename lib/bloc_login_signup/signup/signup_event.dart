import 'package:api_login_signup/models/register/RegisterReqModel.dart';
import 'package:equatable/equatable.dart';

 abstract class RegisterEvent extends Equatable{

}
class RegisterReqEvent extends RegisterEvent{

RegisterReqModel? registerReqModel;
RegisterReqEvent({this.registerReqModel});

  @override
  // TODO: implement props
  List<Object?> get props => [RegisterReqModel()];

}