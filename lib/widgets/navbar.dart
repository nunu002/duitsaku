
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.selectedIndex, required this.onDestinationSelected});
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Color(0xFF219EBC),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height:60,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home,color: Colors.white),
          label: '',),
        NavigationDestination(
          icon: Icon(Icons.widgets),
          selectedIcon: Icon(Icons.widgets,color: Colors.white),
          label: '',),
        NavigationDestination(
          icon: Icon(Icons.settings),
          selectedIcon: Icon(Icons.settings,color: Colors.white),
          label: '',),
      ],
    );
  }
}
