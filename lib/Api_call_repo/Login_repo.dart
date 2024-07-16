import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/loginmodel/LoginReqModel.dart';
import '../models/loginmodel/LoginResModel.dart';

class LoginRepo {
  Future<LoginResModel> login(String username, String password) async {
    var url = "https://dummyjson.com/auth/login";

    LoginReqModel loginReqModel = LoginReqModel(username: username, password: password);

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: { 'Content-Type': 'application/json' },
        body: jsonEncode(loginReqModel.toJson()),
      );

      if (response.statusCode == 200) {
        var respBody = jsonDecode(response.body);
        return LoginResModel.fromJson(respBody);
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}
