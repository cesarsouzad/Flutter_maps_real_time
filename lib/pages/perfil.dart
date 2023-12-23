import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:primeiro_projeto_flutter/pages/usuario.dart';
import 'package:primeiro_projeto_flutter/utils/colors_standard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  // bool _isLoading = true;
  bool isSwitchedOn = false;

  @override
  void initState() {
    super.initState();
    carregarDadosUsuario();
  }

  void carregarDadosUsuario() async {
    try {
      var usuario = await getUserData();

      if (usuario.name != null) {
        setState(() {
          _nomeController.text = usuario.name!;
        });
      }

      if (usuario.email != null) {
        setState(() {
          _emailController.text = usuario.email!;
        });
      }

      if (usuario.senha != null) {
        setState(() {
          _passwordController.text = usuario.senha!;
        });
      }
    } catch (e) {
      print("Erro ao carregar dados do usuário: $e");
      // Tratar erros conforme necessário
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        'Nome:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    controller: _nomeController,
                    //nome
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: criarconta),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Insira Seu Nome...',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        'E-mail:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                  ),
                  child: TextField(
                    controller: _emailController,
                    //email
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: criarconta),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Insira Seu E-mail ...',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        'Senha:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                TextField(
                  //senha
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: criarconta),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObscure =
                              !_isObscure; // Alternar o estado diretamente no onTap
                        });
                      },
                      child: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    hintText: 'Insira Sua Senha ...',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      // Texto fixo
                      //Spacer(), // Espaço flexível para alinhar o Switch à direita
                      Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Transform.scale(
                            scale:
                                1.8, // Ajuste esse valor para alcançar o tamanho desejado (50x50)
                            child: Switch.adaptive(
                              value: true,
                              onChanged: (newValue) {
                                setState(() {
                                  isSwitchedOn = newValue;
                                  print(isSwitchedOn);
                                });
                              },
                              activeColor: Colors.blueAccent,
                              inactiveThumbColor: Colors.grey[700],
                              activeTrackColor:
                                  Colors.blueGrey.withOpacity(0.5),
                              inactiveTrackColor: Colors.grey.withOpacity(0.5),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          )),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Permitir o acesso da minha localização durante o uso do aplicativo.',
                          //textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _atualizarUsuario();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.0), // espaçamento
                        minimumSize: const Size(
                            double.infinity, 60), //tamanho mínimo do botão
                        textStyle: TextStyle(fontSize: 18), // tamanho da fonte
                        backgroundColor: botoesApp),
                    child: Text('Atualizar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _atualizarUsuario() async {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _passwordController.text;

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      _exibirMensagemErro(context, 'Por favor, preencha todos os campos.');
      return;
    }
    // Construa o corpo da solicitação
    Map<String, dynamic> requestBody = {
      "name": nome,
      "email": email,
      "password": senha,
      "authorize_location": isSwitchedOn,
    };

    // Converte o corpo da solicitação para uma string JSON
    String requestBodyJson = jsonEncode(requestBody);

    // Obtém o token do usuário logado
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("_token") ?? "");
    String named = (prefs.getString("_nome") ?? "");
    String emaild = (prefs.getString("_email") ?? "");

    // Envia a solicitação HTTP para a API
    http.Response resposta = await http.post(
      Uri.parse("https://mockapi.hiperlink.pro/api/update"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Adiciona o token ao cabeçalho
      },
      body: requestBodyJson,
    );

    // Verifica se a solicitação foi bem-sucedida
    if (resposta.statusCode == 200) {
      _atualizado(context, 'Usuário atualizado com sucesso!');
    } else {
      // erros aqui
      print(
          'Erro ao atualizar o usuário. Código de resposta: ${resposta.statusCode}');
      _atualizadoErro(context,
          'Erro ao atualizar o usuário. Código de resposta: ${resposta.statusCode}');
      print('nome:$named');
      print('email:$emaild');
      print('token:$token');
    }
  }
}

//MENSAGEM DE VALIDAÇÃO
void _exibirMensagemErro(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
    duration: Duration(seconds: 1),
    padding: EdgeInsets.symmetric(vertical: 300),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void _atualizadoErro(BuildContext context, String message) {
  // ignore: unused_local_variable
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
    padding: EdgeInsets.symmetric(vertical: 200),
  );
}

void _atualizado(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.greenAccent,
    padding: EdgeInsets.symmetric(vertical: 200),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// dados persistido para carregar no form atualizar
Future<Data> getUserData() async {
  var prefs = await SharedPreferences.getInstance();
  String nome = prefs.getString("_nome") ?? "";
  String email = prefs.getString("_email") ?? "";
  String senha = prefs.getString("senha") ?? "";
  String token = prefs.getString("_token") ?? "";

  return Data(token: token, name: nome, email: email, senha: senha);
}
