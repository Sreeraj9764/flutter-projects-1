import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(child: Text("Search")),
    );
  }
}
