import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/login/login.dart';
import 'package:primeiro_projeto_flutter/pages/cadastro.dart';
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
  List _screens = [Maps(), Perfil(), Placeholder()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
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
          onTap: _updateIndex,
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
