import 'package:flutter/material.dart';

class BottomNavigtionWidget extends StatelessWidget {
  BottomNavigtionWidget({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.face), label: "New & Hot"),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Fast Laughs"),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Donloads"),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
    );
  }
}
