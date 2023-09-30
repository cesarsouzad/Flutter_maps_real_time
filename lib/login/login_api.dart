import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String email, String password) async {
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

    Map<String, dynamic>? mapResponse;

    try {
      mapResponse = jsonDecode(response.body);
    } catch (e) {
      print('Erro ao decodificar a resposta JSON: $e');
      return false; // Se houver erro na decodificação, retorna false.
    }

    String mensagem = mapResponse?["message"] ?? "";
    String? token = mapResponse?["data"]?["token"] as String?;

    print("mensagem::: $mensagem");
    print("token::: $token");

    // Verifica se a mensagem é "User login successfully."
    if (mensagem == "User login successfully.") {
      return true;
    } else {
      return false;
    }
  }
}
