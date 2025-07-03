import 'package:flutter/material.dart';
import 'package:flutter_pelicula_1/screens/main_screen.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearch;

  const CustomHeader({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD43162),
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          double logoSize;
          double spacing;
          double searchMaxWidth;

          if (maxWidth > 800) { //tablets etc
            logoSize = 200; 
            spacing = 30;
            searchMaxWidth = 500;
          } else if (maxWidth > 400) { //telefonos medianos
            logoSize = 80;
            spacing = 20;
            searchMaxWidth = maxWidth * 0.6;
          } else {
            // telefonos pequeños
            logoSize = 60;
            spacing = 12; 
            searchMaxWidth = maxWidth * 0.9;
          }

          if (maxWidth <= 400) {
            // Layout columna para móviles
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/image/logoNegro.png',
                      height: logoSize,
                      width: logoSize,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                  ),
                  
                  /*
                  Image.asset(
                    'assets/image/logoNegro.png',
                    height: logoSize,
                    width: logoSize,
                    fit: BoxFit.contain,
                  ), */
                  SizedBox(height: spacing),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: searchMaxWidth),
                    child: _buildSearchField(),
                  ),
                ],
              ),
            );
          } else {
            // Layout fila para tablet y desktop
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/image/logoNegro.png',
                      height: logoSize,
                      width: logoSize,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                  ),

                  SizedBox(width: spacing),

                  // Buscador con ancho máximo fijo y centrado verticalmente
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: searchMaxWidth),
                        child: _buildSearchField(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onSubmitted: onSearch,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Buscar películas o series...',
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(133.0);
}