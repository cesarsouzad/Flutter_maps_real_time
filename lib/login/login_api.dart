import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:primeiro_projeto_flutter/pages/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {
  static Future<Usuario?> login(String email, String password) async {
    var url = Uri.parse('https://mockapi.hiperlink.pro/api/login');

    var header = {"Content-Type": "application/json"};
    Map<String, String> params = {
      "email": email,
      "password": password,
    };

    var prefs = await SharedPreferences.getInstance();

    var _body = json.encode(params);

    try {
      var response = await http.post(url, headers: header, body: _body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic> mapResponse = jsonDecode(response.body);

        final usuario = Usuario.fromJson(mapResponse['data']);
        prefs.setString("_token", mapResponse["data"]['token']);
        prefs.setString("_nome", mapResponse["data"]['name']);
        prefs.setString("_email", email);
        return usuario;
      } else {
        Map<String, dynamic> mapResponse = jsonDecode(response.body);
        String mensagem = mapResponse['message'] ?? "";
        print("mensagem: $mensagem");
        return null;
      }
    } catch (e) {
      print("Erro na requisição: $e");
      return null;
    }
  }
}
