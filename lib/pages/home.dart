import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/login/login.dart';
import 'package:primeiro_projeto_flutter/pages/maps.dart';
import 'package:primeiro_projeto_flutter/pages/perfil.dart';
import 'package:primeiro_projeto_flutter/utils/colors_standard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  // Remova a função _handleLogout da lista _screens
  List _screens = [Maps(), Perfil()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  void _handleLogout() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) =>
          HomePage(), // Substitua LoginPage pelo nome da sua página de login
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Mapa Gps Ao Vivo'),
      // ),
      //backgroundColor: backgroundColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 2) {
              _handleLogout(); // Chama a função _handleLogout quando o item "Sair" é pressionado
            } else {
              _updateIndex(
                  index); // Atualiza a tela se outro item for pressionado
            }
          },
          backgroundColor: menu,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.badge_sharp),
              label: 'Meu Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.exit_to_app,
              ),
              label: 'Sair',
            ),
          ],
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
