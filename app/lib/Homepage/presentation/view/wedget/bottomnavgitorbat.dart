import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedItem;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.selectedItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedItem,
      onTap: onTap,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      selectedFontSize: 20,
      unselectedFontSize: 10,
      backgroundColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "My love",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
      ],
    );
  }
}
