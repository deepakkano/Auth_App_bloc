import 'dart:convert';

import 'package:api_login_signup/models/register/RegisterReqModel.dart';
import 'package:api_login_signup/models/register/RegisterResModel.dart';
import 'package:http/http.dart' as http;



class RegisterRepo{
   Future<RegisterResModel> register(String username,String Password) async{
    var url= "https://reqres.in/api/register";
RegisterReqModel registerReqModel=RegisterReqModel(email:username,password: Password);
try{
  http.Response response= await http.post(Uri.parse(url),
          headers: { 'Content-Type': 'application/json' },
body: jsonEncode(registerReqModel.toJson()),
  );
  if (response.statusCode == 200) {
        var respBody = jsonDecode(response.body);
        return RegisterResModel.fromJson(respBody);
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
}
catch(e){
      throw Exception('Error during login: $e');

}

  }
}