import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primeiro_projeto_flutter/utils/colors_standard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isObscure = true;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundoApp,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset('lib/assets/Logo.png'),
                width: 180,
                height: 180,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      'E-Mail',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: menu),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: criarconta),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Insira E-mail',
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      'Senha',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: menu),
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
                    hintText: 'Insira Senha',
                  ),
                ),
              ),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: ElevatedButton(
                  onPressed: () {
                    final email = _emailController.text
                        .trim(); // Obtenha o valor do campo de email
                    final senha = _passwordController.text
                        .trim(); // Obtenha o valor do campo de senha

                    if (email.isEmpty || senha.isEmpty) {
                      setState(() {
                        // print('ERRRRRRRRRRRRRRO');
                        _errorMessage = 'Preencha todos os campos';
                      });
                      // Verifique se os campos estão vazios
                      // Exibir uma mensagem de erro ou fazer qualquer outra ação necessária
                    } else {
                      // Se os campos não estiverem vazios, você pode prosseguir com a lógica de autenticação
                      // Por exemplo, verificar o email e senha em um servidor e navegar para a próxima tela se a autenticação for bem-sucedida
                      // Caso contrário, exiba uma mensagem de erro apropriada
                      Navigator.of(context).pushNamed('/pages/home');
                    }
                    //print('Acessou');
                  },
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0), // espaçamento
                      minimumSize: const Size(
                          double.infinity, 50), //tamanho mínimo do botão
                      textStyle: TextStyle(fontSize: 18), // tamanho da fonte
                      backgroundColor: botoesApp),
                  child: Text('Acessar'),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.55,
                child: ElevatedButton(
                  onPressed: () {
                    //print('criou');
                    Navigator.of(context).pushNamed('/pages/cadastro');
                  },
                  style: ElevatedButton.styleFrom(
                      //minimumSize: Size(50%, 50),
                      fixedSize:
                          Size(double.infinity, 50), //tamanho mínimo do botão
                      textStyle: TextStyle(fontSize: 18), // tamanho da fonte
                      backgroundColor: criarconta),
                  child: Text('Criar Conta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
