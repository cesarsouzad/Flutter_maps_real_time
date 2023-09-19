import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/utils/colors_standard.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  bool isSwitchedOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Cadastro'),
      ),
      body: Padding(
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
                child: TextField(
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
                child: TextField(
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
                            value: isSwitchedOn,
                            onChanged: (newValue) {
                              setState(() {
                                isSwitchedOn = newValue;
                                print(isSwitchedOn ? 'ligado' : 'desligado');
                              });
                            },
                            activeColor: Colors.blueAccent,
                            inactiveThumbColor: Colors.grey[700],
                            activeTrackColor: Colors.blueGrey.withOpacity(0.5),
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
                    print('Cadastrado');
                  },
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0), // espaçamento
                      minimumSize: const Size(
                          double.infinity, 60), //tamanho mínimo do botão
                      textStyle: TextStyle(fontSize: 18), // tamanho da fonte
                      backgroundColor: botoesApp),
                  child: Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
