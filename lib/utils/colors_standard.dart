import 'dart:ui';

import 'package:flutter/material.dart';

Color backgroundColor = Color.fromARGB(255, 206, 0, 58);
Color secondaryPurple = Color.fromARGB(255, 139, 25, 215);
Color greyColor = const Color.fromRGBO(240, 241, 245, 1);
Color greyT = const Color.fromARGB(255, 63, 63, 63);
Color fundoApp = const Color.fromARGB(255, 242, 240, 240);
Color botoesApp = const Color.fromARGB(255, 20, 41, 73);
Color criarconta = const Color.fromARGB(255, 42, 138, 166);
Color menu = const Color.fromARGB(255, 128, 128, 128);

class Colorsback {
  static const back = Color.fromARGB(255, 242, 240, 240);
}

class ColorsStandard {
  static const teste = Color.fromARGB(255, 63, 63, 63);
}

class Colormenu {
  static const BordaAtiva = Color.fromARGB(255, 42, 138, 166);
}

class FundoInputs {
  static const InputBranco = Color.fromARGB(255, 255, 255, 255);
}

class gradiente {
  static const linear =
      LinearGradient(colors: [Colors.deepOrange, Colors.black]);
}

class AppGradients {
  static final LinearGradient primaryGradient = LinearGradient(
    colors: [Colors.blue, Colors.green],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final LinearGradient secondaryGradient = LinearGradient(
    colors: [Colors.green, Colors.red],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final LinearGradient accentGradient = LinearGradient(
    colors: [Colors.red, Colors.blue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
