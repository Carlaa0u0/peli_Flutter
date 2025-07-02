import 'package:flutter/material.dart';

class CategoryNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const CategoryNavigation({
    super.key,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
      child: Row(
        children: [
          _buildCategoryButton(context, 'Recomendado', 0),
          const SizedBox(width: 12),
          _buildCategoryButton(context, 'Películas', 1),
          const SizedBox(width: 12),
          _buildCategoryButton(context, 'Series', 2),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String title, int index) {
    final bool isSelected = selectedIndex == index;
    final Color buttonColor = isSelected 
        ? const Color(0xFFD43162) 
        : Colors.grey[800]!;

    return Expanded(
      child: GestureDetector(
        onTap: () => onCategorySelected(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: buttonColor.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white70,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
