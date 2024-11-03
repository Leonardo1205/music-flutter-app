import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFF1976D2), // Cor do botão "Adicionar" e do AppBar
  scaffoldBackgroundColor: Color(0xFF0D47A1), // Cor de fundo da aplicação
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Color(0xFF1976D2), // Define a cor principal
    secondary: Color(0xFFBBDEFB), // Cor de destaque (opcional)
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1976D2), // Define a cor do AppBar como a cor principal
    foregroundColor: Colors.white, // Define a cor do texto e dos ícones no AppBar
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF1976D2), // Cor do botão "Adicionar"
      foregroundColor: Colors.white, // Cor do texto do botão
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white), // Define a cor do texto como branco
  ),
);
