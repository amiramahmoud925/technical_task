import 'package:flutter/material.dart';
class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {"icon": Icons.home_outlined, "label": "Home"},
      {"icon": Icons.shopping_cart, "label": "Cart"},
      {"icon": Icons.favorite_border, "label": "Favorites"},
      {"icon": Icons.person_outline, "label": "Profile"},
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: isSelected ? 12 : 0, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF015B8A) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    items[index]["icon"] as IconData,
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                  if (isSelected)
                    SizedBox(width: 6),
                  if (isSelected)
                    Text(items[index]["label"] as String,
                      style: TextStyle(
                        color: Colors.white, fontSize: 16,
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
