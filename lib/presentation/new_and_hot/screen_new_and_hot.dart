import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(child: Text("New")),
    );
  }
}
