import 'package:flutter/material.dart';
import 'package:flutter_pelicula_1/screens/recommended_screen.dart';
import 'package:flutter_pelicula_1/screens/movies_screen.dart';
import 'package:flutter_pelicula_1/screens/series_screen.dart';
import 'package:flutter_pelicula_1/widgets/custom_header.dart';
import 'package:flutter_pelicula_1/widgets/category_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 0: Recomendado, 1: Películas, 2: Series

  final List<Widget> _screens = [
    const RecommendedScreen(),
    const MoviesScreen(),
    const SeriesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Altura del AppBar
        child: CustomHeader(
          onSearch: (query) {
            // Lógica para la búsqueda (a implementar)
            print('Buscando: $query');
            // Podrías navegar a una pantalla de resultados de búsqueda aquí
          },
        ),
      ),
      body: Column(
        children: [
          CategoryNavigation(
            selectedIndex: _selectedIndex,
            onCategorySelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}