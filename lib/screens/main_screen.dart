import 'package:flutter/material.dart';
import 'package:flutter_pelicula_1/screens/recommended_screen.dart';
import 'package:flutter_pelicula_1/screens/movies_screen.dart';
import 'package:flutter_pelicula_1/screens/series_screen.dart';
import 'package:flutter_pelicula_1/widgets/custom_header.dart';
import 'package:flutter_pelicula_1/widgets/category_navigation.dart';
import 'package:flutter_pelicula_1/services/movie_service.dart';
import 'package:flutter_pelicula_1/screens/detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
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
        preferredSize: const Size.fromHeight(100.0),
        child: CustomHeader(
          onSearch: (query) async {
            if (query.isEmpty) return;

            final results = await MovieService.searchMoviesAndSeries(query);

            if (!mounted) return; // Por si el widget ya fue desmontado

            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Resultados para "$query"'),
                content: SizedBox(
                  width: double.maxFinite,
                  height: 300,
                  child: results.isEmpty
                      ? const Text('No se encontraron resultados.')
                      : ListView.builder(
                          itemCount: results.length,
                          itemBuilder: (_, i) => ListTile(
                            title: Text(results[i].title),
                            onTap: () {
                              Navigator.of(context).pop(); // Cierra el diálogo
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DetailScreen(movie: results[i]),
                                ),
                              );
                            },
                          ),
                        ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cerrar'),
                  )
                ],
              ),
            );
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
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
    );
  }
}
