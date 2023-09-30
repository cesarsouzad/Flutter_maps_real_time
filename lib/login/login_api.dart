import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:primeiro_projeto_flutter/login/usuario.dart';

class LoginApi {
  static Future<Usuario> login(String email, String password) async {
    var url = Uri.parse('https://mockapi.hiperlink.pro/api/login');

    var header = {"Content-Type": "application/json"};

    Map params = {
      "email": email,
      "password": password,
    };

    var _body = json.encode(params);
    print("json enviado: $_body");

    var response = await http.post(url, headers: header, body: _body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return Usuario();
  }
}
