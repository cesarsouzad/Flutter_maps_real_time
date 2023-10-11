import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/login/login.dart';
import 'package:primeiro_projeto_flutter/utils/colors_standard.dart';
import 'package:http/http.dart' as http;

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool isSwitchedOn = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //String _errorMessage = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                        padding: const EdgeInsets.only(bottom: 6.0),
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
                    child: TextFormField(
                      controller: _nomeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'preencha seu nome';
                        }
                        return null;
                      },
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
                        padding: const EdgeInsets.only(bottom: 6.0),
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
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'insira seu email';
                        } else if (!RegExp(
                                r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                            .hasMatch(value)) {
                          return 'insira um email valido';
                        }
                        return null;
                      },
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
                        padding: const EdgeInsets.only(bottom: 6.0),
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
                  TextFormField(
                    //senha
                    controller: _passwordController,
                    obscureText: _isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'insira sua senha';
                      } else if (value.length < 6) {
                        return 'deve conter no minimo 6 digitos';
                      }
                      return null;
                    },
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
                                value: isSwitchedOn,
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
                                inactiveTrackColor:
                                    Colors.grey.withOpacity(0.5),
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
                        if (_formKey.currentState!.validate()) {
                          _register();
                        }
                        //print('Cadastrado');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0), // espaçamento
                          minimumSize: const Size(
                              double.infinity, 60), //tamanho mínimo do botão
                          textStyle:
                              TextStyle(fontSize: 18), // tamanho da fonte
                          backgroundColor: botoesApp),
                      child: Text('Cadastrar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _passwordController.text;

    // Dados que você quer enviar para a API
    Map<String, dynamic> dados = {
      'name': nome,
      'email': email,
      'password': senha,
      'authorize_location': isSwitchedOn, // bool em vez de dynamic
    };

    String dadosJson = jsonEncode(dados);
    // Realiza a requisição POST para a API

    try {
      var resposta = await http.post(
        Uri.parse('https://mockapi.hiperlink.pro/api/register'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': isSwitchedOn ? 'authorized' : 'unauthorized'
        },
        body: dadosJson,
      );

      if (resposta.statusCode == 200) {
        print('Usuário cadastrado com sucesso!');
        _cadastradoComSucesso(context, 'Usuário cadastrado com sucesso!');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        print('Erro ao cadastrar usuário: ${resposta.statusCode} ${dados}');
        _usuarioCadastradoErro(context, 'Erro ! Usuário já existe!');
      }
    } catch (e) {
      print('Erro ao cadastrar usuário: $e');
    }
  }
}

void _usuarioCadastradoErro(BuildContext context, String message) {
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

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void _cadastradoComSucesso(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.green,
    padding: EdgeInsets.symmetric(vertical: 200),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => HomePage(),
    ),
  );
}
