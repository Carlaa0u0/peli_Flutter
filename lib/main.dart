import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pelicula_1/providers/movie_provider.dart';
import 'package:flutter_pelicula_1/screens/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        // Puedes añadir más providers aquí para series, etc.
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Películas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // Tema oscuro
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Para DetailScreen title
        ),
        cardColor: Colors.grey[900], // Color de fondo para las cards
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(background: Colors.black),
      ),
      home: const MainScreen(),
    );
  }
}
