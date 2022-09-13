import 'package:flutter/material.dart';

import '../../../core/colors.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class BottomNavigtionWidget extends StatelessWidget {
  const BottomNavigtionWidget({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.collections), label: "New & Hot"),
    BottomNavigationBarItem(
        icon: Icon(Icons.emoji_emotions), label: "Fast Laughs"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.download), label: "Downloads"),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            elevation: 0,
            onTap: (value) {
              indexNotifier.value = value;
            },
            backgroundColor: kBackgroundColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            unselectedLabelStyle:
                const TextStyle(overflow: TextOverflow.ellipsis),
            items: items,
            currentIndex: newIndex,
            type: BottomNavigationBarType.fixed,
          );
        });
  }
}
